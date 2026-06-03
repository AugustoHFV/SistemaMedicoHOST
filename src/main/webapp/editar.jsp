<%-- 
    Document   : editar
    Created on : 31 mar 2023, 19:14:00
    Author     : alumno
--%>

<%@page import="Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<!DOCTYPE html>
<html>
            <link rel="stylesheet" href="Styles/estilo9.css">
            <link rel="shortcout icon" href="IMG/signomedical.png">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Cuenta</title>
    </head>
    <body>
           <header>
        <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Modificar Cuenta</a>                                                                                                              <a  href="index.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
        <%
           HttpSession sesion=request.getSession();
           String usuario;
           String nivel;
            if(sesion.getAttribute("usuarioSesion")==null){
                    if(session.getAttribute("nivel")!="2"){
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
           
        %>    
        
        <div class="marco2"><br>
                <form class="controlador" action="Controlador">
                <%
                Controlador con=new Controlador();
                PersonaDAO dao=new PersonaDAO();
                String U1=(String) session.getAttribute("usuarioSesion");
                List<Persona>list=dao.consultar(U1);
                Iterator<Persona>iter=list.iterator();
                Persona per= null;
                while(iter.hasNext()){
                    per=iter.next();     
                    }
                %>
                <br> <br> <br>
            Nombre:<input type="text" maxlength="20" name="N" value="<%=con.descifradoCesar(per.getNombre())%>"><br><br>
            Apellidos:<input type="text" maxlength="20" name="A" value="<%=con.descifradoCesar(per.getApellidos())%>"><br><br>
            Contraseña:<input type="text" maxlength="20" name="C" value="<%=con.descifradoCesar(per.getContra())%>"><br><br>
            <input type="submit" name="accion" value="Editar"><br>
            <input type="submit" name="accion" value="Cerrar Sesion"><br>
        </form>
    </body>
</html>
