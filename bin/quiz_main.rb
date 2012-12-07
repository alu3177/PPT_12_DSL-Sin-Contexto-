#encoding: UTF-8
require 'ULL::ETSII::Alu3177::Quiz'
include ULL::ETSII::Alu3177::Quiz

quiz = Quiz.new("Lenguajes y Paradigmas de Programación: Temas 1 y 2") do |e|
    e.question "¿Cómo se pueden ver los valores de una configuración git?",
        e.right => "git config -l",
        e.wrong => "git list config",
        e.wrong => "git config -a",
        e.wrong => "git config ls"
    e.question "¿Cómo se crea un repositorio git?",
        e.wrong => "git initialize",
        e.wrong => "git start",
        e.right => "git init",
        e.wrong => "git new"
    e.question "¿Cómo se añaden cambios para que estén bajo el control de git?",
        e.wrong => "git update filename",
        e.wrong => "git include filename",
        e.right => "git add filename",
        e.wrong => "git require filename"
    e.question "¿Cómo se ve el estado de mis ficheros con respecto al repositorio?",
        e.wrong => "git list",
        e.wrong => "git file status",
        e.wrong => "git diff",
        e.right => "git status"
    e.question "¿Es correcto escribir subguiones en un número (por ejemplo: 1_000_000)?",
        e.right => "Sí",
        e.wrong => "No"
    e.question "¿Qué opción hay que pasarle a git commit para especificar el mensaje de log y evitar que abra el editor?",
        e.wrong => "-n",
        e.wrong => "-n \"Texto\"",
        e.wrong => "-m",
        e.right => "-m \"Texto\""
    e.question "¿Qué opción hay que pasarle a git commit para que añada todos los cambios efectuados en ficheros rastreados (tracked)?",
        e.right => "-a",
        e.wrong => "-c",
        e.wrong => "-h",
        e.wrong => "-p"
    e.question "Qué indica el prefijo/sufijo? $",
        e.right => "Variable global",
        e.wrong => "Variable de clase",
        e.wrong => "Variable de instancia"
    e.question "Qué indica el prefijo/sufijo? @",
        e.wrong => "Variable global",
        e.wrong => "Variable de clase",
        e.right => "Variable de instancia"
    e.question "Qué indica el prefijo/sufijo? @@",
        e.wrong => "Variable global",
        e.right => "Variable de clase",
        e.wrong => "Variable de instancia"

end

quiz.to_html
