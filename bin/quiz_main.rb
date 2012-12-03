require 'ULL::ETSII::Alu3177::Quiz'
include ULL::ETSII::Alu3177::Quiz

quiz = Quiz.new("Cuestionario de PFS 10/12/2011") do |e|
    e.question "En que anio Cristobal Colon descubrio America?",
        e.wrong =>'1942',
        e.right =>'1492',
        e.wrong =>'1808',
        e.wrong =>'1914'

    a = rand(1.0...10.0).round(3)
    b = rand(1.0...10.0).round(3)

    e.question "#{a} + #{b} = ",
        e.wrong =>"44",
        e.wrong =>"#{a + b + 2}",
        e.right =>"#{a + b}",
        e.wrong =>"#{a + b - 2}"
end

puts quiz
