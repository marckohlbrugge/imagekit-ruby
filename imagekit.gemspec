require_relative "lib/imagekit/version"

Gem::Specification.new do |spec|
  spec.name          = "imagekit"
  spec.version       = ImageKit::VERSION
  spec.summary       = "Ruby client for imagekit.co"
  spec.homepage      = "https://imagekit.co"
  spec.license       = "MIT"
  spec.author        = "Marc Köhlbrugge"
  spec.email         = "hey@marckohlbrugge.com"
  spec.files         = `git ls-files`.split("\n")
  spec.require_path  = "lib"
end
