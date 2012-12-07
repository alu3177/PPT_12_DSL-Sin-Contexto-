#encoding: UTF-8
require "ULL::ETSII::Alu3177::Quiz/version"
require 'colorize'
require 'erb'



module ULL
  module ETSII
    module Alu3177
      module Quiz

        WRONG = false
        RIGHT = true

        # Clase que permite la construcción de cuestionarios tipo test mediante un DSL
        class Quiz
            attr_accessor :name, :questions

            # Recibe el nombre del test y un bloque con las preguntas y sus respuestas
            #
            # Ejemplo de uso:
            #   quiz = Quiz.new("Test 1"){ |e| 
            #     e.question "Pregunta 1",
            #       e.wrong => "Respuesta incorrecta 1",
            #       e.wrong => "Respuesta incorrecta 2",
            #       e.wrong => "Respuesta incorrecta 3",
            #       e.wrong => "Respuesta correcta"
            #   }
            def initialize(name)
                @counter = 0
                @aciertos = 0
                @name = name
                @questions = []

                yield self
            end

            # Pregunta incorrecta
            #
            # Avoid collisions
            def wrong
                @counter += 1
                [@counter, WRONG]
            end

            # Pregunta correcta
            def right
                :right
            end

            # Método que recibe el título <em>title</em> de la pregunta y una serie de
            # parámetros como respuestas
            def question(title, anss)
                answers = []

                anss.each do |ans|
                    a = Answer.new(ans)
                    answers << a
                end

                q = Question.new(title, answers)
                questions << q
            end

            # Ejecuta el test por consola. Presenta cada pregunta y las posibles respuestas.
            # Al final muestra los resultados.
            def run
                puts name
                questions.each do |q|
                    puts q
                    print "Su respuesta: "
                    resp = gets.chomp.to_i
                    raise IndexError, "Answer must be between 1 and #{q.answers.size}." unless resp <= q.answers.size and resp > 0
                    if q.answers[resp-1].state
                        puts "Correcto!".colorize(:light_green)
                        @aciertos += 1
                    else
                        correcta = q.answers.select { |ans| ans.state }.first
                        puts "Fallo, la respuesta correcta era #{correcta}".colorize(:red)
                    end
                    puts
                end
                puts "Has acertado el #{(@aciertos/questions.size.to_f)*100}% de las preguntas [#{@aciertos} de #{questions.size}]."
            end

            # Representación visual de un Test en forma de String.
            def to_s
                out = name + "\n"
                #puts name
                questions.each do |q|
                    out << "#{q}\n"
                end
                out
            end

            # Genera el test en formato html.
            # Dicho test es totalmente funcional, permitiendo la selección de respuestas y
            # la corrección de las mismas
            def to_html
                # SetUp del fichero de salida
                if not Dir.exist? "html"
                    # Copiamos el directorio html con los ficheros básicos
                    require 'fileutils'
                    FileUtils.cp_r File.expand_path(File.dirname(__FILE__)) + '/html', 'html'
                end
                outFile = File.new("html/#{name.gsub(/[\ \\\/:]/, '_')}.html", "w")
                raise IOError, 'Can\'t access to html output file' unless outFile
                # Construimos el ERB y lo escribimos en el fichero
                require 'templates'
                rhtml = ERB.new(HTML_TEMPLATE)
                outFile.syswrite(rhtml.result(binding))
                outFile.close
            end

        end

        # Clase que representa una de pregunta a un test.
        class Question
            attr_accessor :answers, :title
            # Recibe un título <em>title</em> de la pregunta y el resto de parámetros son las
            # posibles respuestas.
            def initialize(title, anss)
                raise ArgumentError, "Title has to be a String, got #{title.class}" unless title.is_a? String
                @title = title
                @answers = anss
            end

            # Representación visual de una pregunta en forma de String.
            def to_s
                out = "# #{@title}".colorize(:light_blue) + "\n"
                i = 1
                answers.each do |a|
                    out << "  [#{i}] #{a}\n"
                    i += 1
                end
                out
            end
        end

        # Clase que representa las respuestas a preguntas de un test.
        class Answer
            attr_reader :state, :value

            # Recibe como parámetro una lista de dos elementos que contiene
            # el <em>state</em> o estado de la respuesta (si es verdadera o falsa)
            # y el <em>value</em> con el texto que la representa.
            def initialize(ans)
                raise ArgumentError, "Array spected, got #{ans.class}" unless ans.is_a? Array
                raise IndexError, 'Must have two (2) elements; state and value' unless ans.size == 2
                state = ans[0]
                value = ans[1]
                state == :right ? @state = RIGHT : @state = WRONG
                @value = value
            end

            # Devuelve <em>value</em>, es decir, el texto que describe a la respuesta
            def to_s
                "#{@value}"
            end
        end

      end
    end
  end
end
