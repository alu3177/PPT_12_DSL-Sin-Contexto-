require "ULL::ETSII::Alu3177::Quiz/version"

module ULL
  module ETSII
    module Alu3177
      module Quiz

        class Quiz
            attr_accessor :name, :questions

            WRONG = 0
            def initialize(name)
                @counter = 0
                self.name = name
                self.questions = []

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

            def to_s
                questions.each do |q|
                    puts q
                end
                ""
            end

        end

        class Question
            attr_accessor :answers
            def initialize(title, anss)
                raise ArgumentError, 'Title has to be a String' unless title.is_a? String
                @title = title
                self.answers = anss
            end

            def to_s
                puts "#{@title}"
                answers.each do |a|
                    puts a
                end
                ""
            end


        end

        class Answer
            WRONG = 0
            RIGHT = 1

            def initialize(ans)
                state = ans[0]
                value = ans[1]
                state == :right ? @state = RIGHT : @state = WRONG
                @value = value
            end

            def to_s
                "#{@state} => #{@value}"
            end
        end

      end
    end
  end
end
