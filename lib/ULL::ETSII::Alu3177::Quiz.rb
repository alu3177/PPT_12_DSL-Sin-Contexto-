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

        class Quiz
            attr_accessor :name, :questions

            def initialize(name)
                @counter = 0
                @aciertos = 0
                @name = name
                @questions = []

                yield self
            end

            # Avoid collisions
            def wrong
                @counter += 1
                [@counter, WRONG]
            end

            def right
                :right
            end

            def question(title, anss)
                answers = []

                anss.each do |ans|
                    a = Answer.new(ans)
                    answers << a
                end

                q = Question.new(title, answers)
                questions << q
            end

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

            def to_s
                out = name + "\n"
                #puts name
                questions.each do |q|
                    out << "#{q}\n"
                end
                out
            end

            def to_html
                # SetUp del fichero de salida
                if not Dir.exist? "html"
                    # Copiamos el directorio html con los ficheros básicos
                    require 'fileutils'
                    FileUtils.cp_r File.expand_path(File.dirname(__FILE__)) + '/html', 'html'
                end
                outFile = File.new("html/#{name.gsub(/[\ \\\/]/, '_')}.html", "w")
                raise IOError, 'Can\'t access to html output file' unless outFile
                # Construimos el ERB y lo escribimos en el fichero
                require 'templates'
                rhtml = ERB.new(HTML_TEMPLATE)
                outFile.syswrite(rhtml.result(binding))
                outFile.close
            end

        end

        class Question
            attr_accessor :answers, :title
            def initialize(title, anss)
                raise ArgumentError, 'Title has to be a String' unless title.is_a? String
                @title = title
                @answers = anss
            end

            def to_s
                out = "# #{@title}".colorize(:light_blue) + "\n"
                #puts "# #{@title}".colorize(:light_blue)
                i = 1
                answers.each do |a|
                    out << "  [#{i}] #{a}\n"
                    i += 1
                end
                out
            end
        end

        class Answer
            attr_reader :state, :value

            def initialize(ans)
                state = ans[0]
                value = ans[1]
                state == :right ? @state = RIGHT : @state = WRONG
                @value = value
            end

            def to_s
                "#{@value}"
            end
        end

      end
    end
  end
end
