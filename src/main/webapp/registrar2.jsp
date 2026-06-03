<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.Persona"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
            <title>Registro de Doctores</title>
            <link rel="stylesheet" href="Styles/estilo6.css">
                <link rel="shortcout icon" href="IMG/signomedical.png">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style>
 body {
    background-color:#006980;
    display: flex;
    justify-content: start;
    font-family: 'Ottawa Bold';
    height: 90vh;
    margin: -20px 0 70px;
    overflow-x: hidden;
    
    
}
header {
    background-color: #fff;
    display: flex;
    justify-content: center;
    flex-direction: column;
    padding: 25px;
    height: 120px;
    text-align: center;
}
 * {
    box-sizing: border-box;
}
.titulo {
    font-size: 50px;
    display: flex;
    justify-content: left;
    margin-left: 100px;
    position: absolute;
    top: 3%;
    color: black;
}

.volver {
    margin: 10px;
    position: absolute;
    top: 3%;
    border-color: #006980;
}

button {
    border-radius: 20px;
    border: 1px solid #fff;
    background-color: #006980;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
    margin-top: 30px;
}

button:hover {

    background-color: #067863;
    color: #fff;
    border-color: #006980;
    border-width: 2px;
}


button:active {
    transform: scale(0.95);
}

button:focus {
    outline: none;
}

button.ghost {
    background-color: transparent;
    border-color:#006980;
}

.controlador{
    
    background-color: #fff;
    margin-top: 20px;
    height: 740px;
    width:800px ;
    margin-left: 440px;
    position: center;
    border-radius:25px; 
    
    

}


.controlador table {
  width: 80%;
  border-collapse: collapse;
  color:#006980;
 
}


.controlador input,
.controlador select {
  width: 100%;
  padding: 8px;
  margin-bottom: 1px;
  border: 3px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  
  
}

.controlador input[type="submit"] {
border-radius: 20px;
    border: 1px solid #fff;
    background-color: #006980;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
    padding: 15px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 80ms ease-in;
    margin-top: 15px;
    margin-left: 60px;
    width: 500px;
}

.controlador input[type="submit"]:hover {
  background-color: #067863;
}

        </style>
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
            PersonaDAO dao=new PersonaDAO();
            List<Persona>list=dao.consultar4();
            Iterator<Persona>iter=list.iterator();
            Persona per= null;
            int c=0;
            while(iter.hasNext()){
                c=c+1;
                per=iter.next(); 
            }
            list=dao.consultar14();
            iter=list.iterator();
            int a=0;
            while(iter.hasNext()){
                a=a+1;
                per=iter.next(); 
            }
           if(c<=0 || a<=0){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("alert('Debes de agregar al menos una especialidad y un consultorio antes de agregar a un doctor');");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
        %>
   <header>
        <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Registrar Doctor</a>                                                                                                              <a  href="IndAdmin.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
    <div class="">
        <form class="controlador" action="Controlador">
            <table style="text-align: left; margin-left: auto; margin-right: auto;">
                <tbody>
                    <tr>
                <br> <td>
                            <label>Nombre(s) del Doctor</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="name" rows="5" cols="50" required="required" maxlength="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Apellidos del Doctor</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="ape" rows="5" cols="50" required="required" maxlength="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Correo del Doctor</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="email" required="required" type="email" maxlength="200">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Contraseña de la cuenta:</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input name="password" rows="5" cols="50" required="required" maxlength="30">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Horario del doctor:</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Inicio:
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <input type="time" name="horI" rows="5" cols="50" required="required"> 
                            
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Fin:
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <input type="time" name="horF" rows="5" cols="50" required="required">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Especialidad: </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                    <select name="Esp" >
                        <%
                        List<Persona>list2=dao.consultar4();
                        Iterator<Persona>iter2=list2.iterator();
                        Persona per2= null;
                        while(iter2.hasNext()){
                            per2=iter2.next();
                        %>
                        <option><%=per2.getNombre()%></option>
                        <%}%>
                    </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                    <select name="Cons">
                        <%
                        List<Persona>list3=dao.consultar14();
                        Iterator<Persona>iter3=list3.iterator();
                        Persona per3= null;
                        while(iter3.hasNext()){
                            per3=iter3.next();
                        %>
                        <option><%=per3.getNombre()%></option>
                        <%}%>
                    </select>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2" rowspan="1">
                            <input value="Agregar Doctor" name="accion"   type="submit" onclick="algoritmo();"/>
                        </td>
                        <br>
                    </tr>
                    <tr>
                    </tr>
                </tbody>
            </table>
           
        </form>
    </div>
    </body>
</html>
