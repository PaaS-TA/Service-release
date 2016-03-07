CloudFoundry UAA OmniAuth Strategy
==================================

OmniAuth strategy for authenticating users using the CloudFoundry UAA server.

Set up a local ruby environment (so sudo not required):

    $ rvm use 1.9.2

or

    $ rbenv global 1.9.2-p180

see: https://rvm.io/ or http://rbenv.org/

Build and install the cf-uaa-lib gem located at https://github.com/cloudfoundry/cf-uaa-lib

Build the gem

      $ bundle install
      $ bundle exec gem build omniauth-uaa-oauth2.gemspec

Install it

      $ gem install omniauth-uaa-oauth2-*.gem


See the examples folder for details on how to use it.

Warning: Unlike the omniauth-oauth2 gem, this gem does not support the oauth2 'state' security parameter.
