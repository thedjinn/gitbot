# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{gitbot}
  s.version = "1.0.0"
  s.platform = Gem::Platform::RUBY
  s.licenses = ["MIT"]
  s.authors = ["Emil Loer"]
  s.email = %q{emil@koffietijd.net}
  s.homepage = %q{http://github.com/thedjinn/gitbot}
  s.summary = %q{An IRC bot that listens to GitHub webhooks}
  s.description = %q{An IRC bot that listens to GitHub webhooks}
 
  #s.rubyforge_project = "gitbot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]

  s.default_executable = %q{gitbot}

  s.add_runtime_dependency(%q<cinch>, ["~> 1.0.0"])
  s.add_runtime_dependency(%q<sinatra>, ["~> 1.1.0"])
  s.add_runtime_dependency(%q<json>, [">= 0"])
  
  s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])

  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")
end
