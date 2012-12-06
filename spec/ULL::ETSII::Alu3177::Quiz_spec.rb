#encoding: UTF-8
require 'ULL::ETSII::Alu3177::Quiz'

include ULL::ETSII::Alu3177::Quiz

describe Quiz do

    before :all do
        @quiz = Quiz.new("test"){ |e|
            e.question "Pregunta 1",
                e.right => "Answer 1" ,
                e.wrong => "Answer2"
        }
    end

    it "Debe tener un método 'question' para declarar preguntas" do
        (@quiz.respond_to? :question).should == true
    end

    it "Debe tener un método 'wrong' para declarar respuestas erróneas" do
        (@quiz.respond_to? :wrong).should == true
    end

    it "Debe tener un método 'right' para declarar la respuesta correcta" do
        (@quiz.respond_to? :right).should == true
    end

    it "Debe tener un método 'run' que ejecuta el test" do
        (@quiz.respond_to? :run).should == true
    end

    it "Debe tener un método 'to_s'" do
        (@quiz.respond_to? :to_s).should == true
    end
end
