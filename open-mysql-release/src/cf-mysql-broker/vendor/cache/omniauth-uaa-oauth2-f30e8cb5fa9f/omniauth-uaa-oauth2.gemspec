# -*- encoding: utf-8 -*-
# stub: omniauth-uaa-oauth2 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-uaa-oauth2"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Joel D'sa", "Dave Syer", "Dale Olds", "Vidya Valmikinathan", "Luke Taylor"]
  s.date = "2016-03-07"
  s.description = "An OmniAuth strategy for the Cloudfoundry UAA"
  s.email = ["jdsa@vmware.com", "olds@vmware.com", "dsyer@vmware.com", "vidya@vmware.com", "ltaylor@vmware.com"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "Gemfile.lock", "LICENSE", "NOTICE", "README.md", "Rakefile", "examples/config.ru", "lib/omniauth-uaa-oauth2.rb", "lib/omniauth/cloudfoundry.rb", "lib/omniauth/strategies/cloudfoundry.rb", "lib/omniauth/uaa_oauth2/version.rb", "omniauth-uaa-oauth2.gemspec", "spec/omniauth/strategies/uaa_oauth2_spec.rb", "spec/spec_helper.rb"]
  s.homepage = ""
  s.rubygems_version = "2.4.8"
  s.summary = "An OmniAuth strategy for the Cloudfoundry UAA"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>, ["~> 1.0"])
      s.add_runtime_dependency(%q<cf-uaa-lib>, ["< 4.0", ">= 3.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<omniauth>, ["~> 1.0"])
      s.add_dependency(%q<cf-uaa-lib>, ["< 4.0", ">= 3.2"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth>, ["~> 1.0"])
    s.add_dependency(%q<cf-uaa-lib>, ["< 4.0", ">= 3.2"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
