#encoding: UTF-8
module ULL
  module ETSII
    module Alu3177
      module Quiz

		JAVASCRIPT_TEMPLATE = %{
            $(function() {
                $( "#button" ).button();
            <% for i in 1..questions.size %>
                $( "#question<%=i%>" ).buttonset();
            <%end%>
            });
            function run(){
                <% for i in 1..questions.size %>
                for (i=0;i<document.forms[0].preg<%=i%>.length;i++) {
                    if (document.forms[0].preg<%=i%>[i].checked) {
                        user_input = document.forms[0].preg<%=i%>[i].value;
                        if (user_input == "true") {
                            $( "#correccion<%=i%>" ).show("blind", 65);
                            text = document.getElementById("correccion<%=i%>_text");
                            text.innerHTML = "<span style='color: green;'><b>¡Respuesta Correcta!</b></span>";
                        }else{
                            $( "#correccion<%=i%>" ).show("blind", 65);
                            text = document.getElementById("correccion<%=i%>_text");
                            text.innerHTML = "<span style='color: red;'>Respuesta incorrecta ...</span>";
                        }
                    }
                }
                <%end%>
            }
		}

        HTML_TEMPLATE = %{
        <html>
          <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title><%= name %></title>
            <link href="css/blitzer/jquery-ui-1.9.2.custom.min.css" rel="stylesheet">
            <link href="css/base.css" rel="stylesheet">
            <script src="js/jquery-1.8.3.js"></script>
            <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
            <script src="js/quiz.js"></script>
          </head>
          <body>
            <div class="contenedor">
                <h1><%= name %></h1>
                <form action="">
                    <% i=0; questions.each do |q| %>
                        <div id="question_<%=i%>" class="question">
                            <h3><%= q.title %></h3>
                                <div id="question<%=i+1%>">
                                <% j=0; q.answers.each do |a| %>
                                    <input type="radio" id="preg<%=i%>.<%=j+1%>" name="preg<%=i+1%>" value="<%= a.state %>"><label for="preg<%=i%>.<%=j+1%>"><%= a.value %></label>
                                <% j+=1;end %>
                                </div>

                                <div id="correccion<%=i+1%>" class="ui-state-highlight ui-corner-all" style="display: none;margin-top: 20px;">
                                    <p><span class="ui-icon ui-icon-info" style="float: left; margin-left: .3em;"></span>
                                    <p id="correccion<%=i+1%>_text"></p>
                                    </p>
                                </div>
                        </div>
                        <% i += 1 %>
                    <% end %>
                    <input id="button" value="Corregir" onclick="run()" />
                </form>
            </div>
          </body>
        </html>
        }


      end
    end
  end
end
