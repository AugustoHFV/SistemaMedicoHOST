<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.concurrent.Executors"%>
<%@page import="java.util.concurrent.ExecutorService"%>
<%@page import="Controlador.Fecha"%>
<%@page import="Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="Controlador.Auxiliar"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="Styles/estilo9.css">
    <link rel="shortcout icon" href="IMG/signomedical.png">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
    </head>
    <body>
        <header style="position: sticky;   top: 0; ">
            <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Mensajes con el doctor</a>                                                                                                              <a  href="index.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
    <%
        String mensaje = request.getParameter("mensaje");
        if (request.getParameter("mensaje") == null) {
            mensaje = "";
        }
    %>
    <pre><form onsubmit="enviarMensaje(event)"><input type="text" maxlength="1000" name="mensaje" id="mensaje" value="<%=mensaje%>" placeholder="Mensaje"><button type="submit" class="btn btn-primary">Enviar</button></form></pre>
            <%
                Auxiliar aux = new Auxiliar();
                if (aux.getNombre() == null || aux.getApellidos() == null) {
                    if (session.getAttribute("nivel") != "2") {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<body onload = 'loaded();'></body>");
                        out.println("<script>");
                        out.println("function loaded() {");
                        out.println("alert('Ocurrió un error');");
                        out.println("location.href ='index.jsp';");
                        out.println("}");
                        out.println("</script>");
                        out.println("</html>");
                    }
                }
                String UD = (String) session.getAttribute("usuarioSesion");
                String ED = (String) session.getAttribute("Doc");
                %>
    <script>
    // Función para seleccionar automáticamente el input al cargar la página
    window.onload = function() {
      var input = document.getElementById('mensaje');
      if (input) {
        input.focus(); 
        input.setSelectionRange(input.value.length, input.value.length);
      }
    };
  </script>
    <table class="chat-table" style="width: 70%; align-self: center">
        <%PersonaDAO dao = new PersonaDAO();
            Controlador con = new Controlador();
            Fecha F = new Fecha();
            List<Persona> list = dao.consultar27(UD, ED);
            Iterator<Persona> iter = list.iterator();
            Persona per2 = null;

            while (iter.hasNext()) {
                per2 = iter.next();
                String Nom = "";
                if (per2.getNombre().equals(UD)) {
                    Nom = "Tu";
                } else {
                    List<Persona> list2 = dao.consultar(ED);
                    Iterator<Persona> iter2 = list2.iterator();
                    Persona per3 = null;
                    while (iter2.hasNext()) {
                        per3 = iter2.next();
                        Nom = con.descifradoCesar(per3.getNombre());
                    }
                }
                String Men = per2.getVer();
                String Fe = per2.getContra();
                int Ho = per2.getHora();
                int c = 0;
                while (Ho > 60) {
                    Ho = Ho - 60;
                    c = c + 1;
                }
                String HoF = c + ":" + Ho;
        %>
        <tr class="message"><td class="sender"><p align="left"><%=Nom%></p></td></tr>
        <tr class="message"><td class="content"><p align="left"><%=Men%></p></td></tr>
        <tr class="message"><td class="timestamp"><p align="right"><%=Fe%>    <%=HoF%></p></td></tr>
                <%}%>
    </table>
    <br>
    <script>
        setTimeout(function () {
                var mensaje2 = document.getElementById('mensaje').value;
                var textoCodificado = encodeURIComponent(mensaje2);
                window.location.href = 'chat.jsp?mensaje=' + textoCodificado;
        }, 3000);
    </script>
    <script>
        function enviarMensaje(event) {
            event.preventDefault();
            var mensaje = document.getElementById('mensaje').value;
            var rem = '<%=UD%>';
            var des = '<%=ED%>';

            var url = 'Controlador?accion=EnvMensa&Rem=' + encodeURIComponent(rem) + '&des=' + encodeURIComponent(des) + '&mensaje=' + encodeURIComponent(mensaje);
            window.location.href = url;
        }
    </script>
    <style>
    .chat-table {
  background-color: #10403B;
}

/* Estilos para cada fila de mensaje */
.message {
  border-bottom: 1px solid #ccc;
}

/* Estilos para el remitente del mensaje */
.sender {
  font-weight: bold;
}

/* Estilos para el contenido del mensaje */
.content {
  padding-left: 10px;
}

/* Estilos para la fecha/hora del mensaje */
.timestamp {
  font-size: 0.8em;
  color: #888;
}
    </style>
</body>
</html>