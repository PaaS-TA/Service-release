require 'spec_helper'
require 'omniauth-uaa-oauth2'

describe OmniAuth::Strategies::Cloudfoundry do
  def app; lambda{|env| [200, {}, ["Hello."]]} end

  before :each do
    OmniAuth.config.test_mode = true
    @request = double('Request')
    @request.stub(:params) { {} }
    @request.stub(:cookies) { {} }
    @request.stub(:env) { {} }
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject do
    args = ['app', 'appclientsecret', @options || {}].compact
    OmniAuth::Strategies::Cloudfoundry.new(app, *args).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      subject.callback_path.should eq('/auth/cloudfoundry/callback')
    end
  end

  describe 'set auth and token server' do
    it 'should set the right auth and token server' do
      @options = {:auth_server_url => 'https://login.cloudfoundry.com'}
      subject.client
      subject.auth_server_url.should eq('https://login.cloudfoundry.com')
      subject.token_server_url.should eq('https://login.cloudfoundry.com')
    end

    it 'should set the right auth and token server if independently set' do
      @options = {:auth_server_url => 'https://login.cloudfoundry.com', :token_server_url => 'https://uaa.cloudfoundry.com'}
      subject.client
      subject.auth_server_url.should eq('https://login.cloudfoundry.com')
      subject.token_server_url.should eq('https://uaa.cloudfoundry.com')
    end

    it 'should set the right auth and token server' do
      @options = {:auth_server_url => 'login.cloudfoundry.com'}
      subject.client
      subject.auth_server_url.should eq('https://login.cloudfoundry.com')
      subject.token_server_url.should eq('https://login.cloudfoundry.com')
    end
  end

  describe '#callback_phase' do
    let(:token_issuer) { CF::UAA::TokenIssuer.new('target', 'client_id') }
    let(:uaa_info) do
      info = double("UAA_INFO")
      info.stub(:whoami) { { "omniauth.auth" => "something" } }
      info
    end

    before do
      subject.stub(:client).and_return(token_issuer)
      subject.uaa_info = uaa_info
      subject.stub(:session).and_return({})
      subject.stub(:env).and_return({})
      subject.stub(:expired?) { true }
      @request.stub(:query_string)
    end

    context 'when the callback request contains an error message' do
      it 'makes a call to #fail! with the error and a CallbackError' do
        @request.stub(:params) do
          {
            'error'             => 'access_denied',
            'error_description' => 'User denied access',
            'state'             => 'some-state-value'
          }
        end

        subject.should_receive(:fail!).with('access_denied', instance_of(OmniAuth::Strategies::Cloudfoundry::CallbackError))
        subject.callback_phase
      end
    end

    context 'when the access token is not empty and expired' do
      let(:refresh_access_token) { OmniAuth::Strategies::CFAccessToken.new({
                                     'access_token' => 'some-refreshed-token'
                                   },
                                   'auth-header'
                                 )}

      it 'should call refresh on the access token' do
        token_issuer.stub(:authcode_grant).and_return(CF::UAA::TokenInfo.new({}))

        subject.should_receive(:refresh).with(anything).and_return(refresh_access_token)
        subject.callback_phase
      end
    end

    context 'when the access token is empty and expired' do
      it 'should not call refresh on the access token' do
        token_issuer.stub(:authcode_grant).and_raise(CF::UAA::InvalidToken)

        subject.should_not_receive(:refresh)
        subject.callback_phase
      end
    end
  end

  describe 'set scopes' do
    it 'should set the right scopes if requested' do
      @options = {:auth_server_url => 'https://login.cloudfoundry.com', :token_server_url => 'https://uaa.cloudfoundry.com', :scope => "openid cloud_controller.read"}
      subject.client
      subject.options[:scope].should eq("openid cloud_controller.read")
    end

    it 'should not set any scopes if not requested' do
      @options = {:auth_server_url => 'https://login.cloudfoundry.com', :token_server_url => 'https://uaa.cloudfoundry.com'}
      subject.client
      subject.options[:scope].should eq(nil)
    end
  end

  describe 'empty?' do
    it 'is empty when initialized without info' do
      token = OmniAuth::Strategies::CFAccessToken.new
      token.empty?.should be_true
    end

    it 'is not empty when initialized with info' do
      token = OmniAuth::Strategies::CFAccessToken.new({
        'access_token' => 'some-token',
      })
      token.empty?.should be_false
    end
  end

  describe 'raw_info' do
    let(:uaa_info) do
      info = double("UAA_INFO")
      info.stub(:whoami) { "something" }
      info
    end

    before do
      subject.uaa_info = uaa_info
      @omni_logger = OmniAuth.config.logger
    end

    after do
      OmniAuth.config.logger = @omni_logger
    end

    it 'should return raw info' do
      subject.access_token = OmniAuth::Strategies::CFAccessToken.new

      subject.raw_info.should_not be_empty
    end

    context 'when whoami returns an error' do
      let(:uaa_info) do
        info = double("UAA_INFO")
        info.stub(:whoami).and_raise(CF::UAA::TargetError)
        info
      end

      before do
        subject.uaa_info = uaa_info
      end

      it 'should rescue, log, and return empty hash on target error' do
        logger = double("logger")
        logger.should_receive(:error).once
        OmniAuth.config.logger = logger

        subject.access_token = OmniAuth::Strategies::CFAccessToken.new
        subject.raw_info.should be_empty
      end
    end
  end

  describe 'build_access_token' do
    let(:token_issuer) { CF::UAA::TokenIssuer.new('target', 'client_id') }
    let(:logger) { double("logger") }
    let!(:omni_logger) { OmniAuth.config.logger }

    before do
      OmniAuth.config.logger = logger
      logger.should_receive(:info).once

      subject.stub(:client).and_return(token_issuer)
      subject.stub(:session).and_return({})
    end

    after do
      OmniAuth.config.logger = omni_logger
    end

    it 'should return an access token' do
      token_issuer.stub(:authcode_grant).and_return(CF::UAA::TokenInfo.new({}))

      subject.build_access_token('query-string').should_not be_empty
    end

    it 'should rescue, log, and return empty token on invalid token error' do
      token_issuer.stub(:authcode_grant).and_raise(CF::UAA::InvalidToken)
      logger.should_receive(:error).once

      subject.build_access_token('query-string').should be_empty
    end
  end
end
