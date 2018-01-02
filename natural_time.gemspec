
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "natural_time/version"

Gem::Specification.new do |spec|
  spec.name          = "natural_time"
  spec.version       = NaturalTime::VERSION
  spec.authors       = ["Isaac Priestley"]
  spec.email         = ["progressions@gmail.com"]

  spec.summary       = "Smart enumeration of durations in natural language"
  spec.description   = "Smart enumeration of durations in natural language--\"4 hours, 3 minutes and 2 seconds\""
  spec.homepage      = "https://github.com/progressions/natural_time"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "pry", "~> 0.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "activesupport", "~> 5.1.4"
end
