# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ULL::ETSII::Alu3177::Quiz/version'

Gem::Specification.new do |gem|
  gem.name          = "ULL::ETSII::Alu3177::Quiz"
  gem.version       = ULL::ETSII::Alu3177::Quiz::VERSION
  gem.authors       = ["Fernando González López-Peñalver"]
  gem.email         = ["alu0100256543@ull.edu.es"]
  gem.description   = %q{Práctica: DSL: Redacción de Cuestionarios I (Sin Contexto)}
  gem.summary       = %q{Generador de custionarios. Permite crear custionarios mediante un DSL simple. Además se podrán ejecutar estos cuestionarios via consola o generar un documento html encargado de mostrar y corregir los tests.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rdoc"
  gem.add_runtime_dependency "colorize"
end
