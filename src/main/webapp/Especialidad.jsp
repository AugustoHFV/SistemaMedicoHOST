
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcout icon" href="IMG/signomedical.png">
        <link rel="stylesheet" href="Styles/estilo8.css">
        <title>Registro de Especialidad</title>
    </head>
    <body>
        <%
           HttpSession sesion=request.getSession();
           String usuario;
           String nivel;
           if(sesion.getAttribute("usuarioSesion")==null || session.getAttribute("nivel")!="3"){
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
           
        %>
    <header>
        <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Registrar Especilidad</a>                                                                                                              <a  href="IndAdmin.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
        <form class="controlador" action="Controlador">
           <br><br><br><table style="text-align: left; margin-left: auto; margin-right: auto;">
                <tbody>
                    <tr>
                        <td>
                            <label>Nombre de la Especialidad</label>
                        </td>
                    </tr>
                    <tr>
                        <br>
                        <td>
                            <input name="NEs" rows="5" cols="50" required="required" maxlength="40">
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2" rowspan="1">
                            <input value="Agregar Especialidad" name="accion"   type="submit" onclick="algoritmo();"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
