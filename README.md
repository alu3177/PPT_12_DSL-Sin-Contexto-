# ULL::ETSII::Alu3177::Quiz

# Práctica 12: DSL: Redacción de Cuestionarios I (Sin Contexto)

## Enunciado
Se trata de escribir un programa que redacte cuestionarios. En principio, sólo soportaremos pre-
guntas del tipo selección múltiple:
    1. ¿En que a~no Cristobal Colón descubrió América?
        1 - 1942
        2 - 1492
        3 - 1808
        4 - 1914
    Su respuesta:

Debe definir una clase Quiz que soporte un pequeñoo lenguaje en el que las preguntas puedan ser
especificadas. El constructor de Quiz va seguido de un bloque al que pasa como argumento el objeto
e que representa al examen:
    quiz = Quiz.new("Cuestionario de PFS 10/12/2011") do |e|
        e.question ’¿En que a~no Cristobal Colón descubrió América?’,
        e.wrong =>’1942’,
        e.right =>’1492’,
        e.wrong =>’1808’,
        e.wrong =>’1914’
        a = rand(10)
        b = rand(10)
        e.question "#{a}+#{b} = ",
        e.wrong =>"44",
        e.wrong =>"#{a + b + 2}",
        e.right =>"#{a + b}",
        e.wrong =>"#{a + b - 2}"
    end
    quiz.run

## Objetivos
-Escriba un método to_html que genere una página describiendo el examen. Use ERB.
-Opcionalmente puede incluir hojas de estilo, javascript, etc. en el HTML generado
-Use TDD con RSpec
-Use Unit Testing
-Use Continuous Integration (Travis)
-Use Continuous Testing (Guard)
-Documente su gema (véase RDOC::Markup o RDOC o YARD).
-Cree una gema ull-etsii-aluXX-quiz
-Publique la gema en RubyGems.org
-Indique la URL de su repositorio en GitHub y la URL en RubyGems.org

## Installation

Add this line to your application's Gemfile:

    gem 'ULL::ETSII::Alu3177::Quiz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ULL::ETSII::Alu3177::Quiz


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
