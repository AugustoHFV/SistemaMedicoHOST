<%@page import="Controlador.Fecha"%>
<%@page import="Controlador.Controlador"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agendar citas</title>
    <link rel="stylesheet" href="Styles/estilo33.css">
    <link rel="shortcout icon" href="IMG/signomedical.png">
</head>
<body>
        <%
           HttpSession sesion=request.getSession();
           if(sesion.getAttribute("usuarioSesion")==null || session.getAttribute("nivel")!="1"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("alert('Inicia sesión para acceder');");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
            PersonaDAO dao=new PersonaDAO();
            Controlador con=new Controlador();
            Fecha F=new Fecha();
            String U1=(String) session.getAttribute("usuarioSesion");
            String CC=F.Fecha();
            int HoA=F.HoraA();
            List<Persona>list=dao.consultar21(U1,CC,HoA);
            Iterator<Persona>iter=list.iterator();
            Persona per2= null;
            int c=0;
            while(iter.hasNext()){
                c=c+1;
                per2=iter.next(); 
            }
            List<Persona>list7=dao.consultar22(U1,CC,HoA);
            Iterator<Persona>iter7=list7.iterator();
            Persona per7= null;
            while(iter7.hasNext()){
                c=c+1;
                per7=iter7.next(); 
            }
           if(c>=3 && session.getAttribute("nivel")=="1"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("alert('Limite de citas alcanzado, espera que pasen algunas de tus citas vigentes para agendar más citas');");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
            list=dao.consultar15();
            iter=list.iterator();
            Persona per3= null;
            int a=0;
            while(iter.hasNext()){
                a=a+1;
                per3=iter.next(); 
            }
           if(a<=0){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("alert('No doctores encontrados, informa al administrador');");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
        %>
    <header>
        <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Registrar citas</a>                                                                                                              <a  href="index.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
<div class="marco">
    <div class="marco2">
        <form class="controlador" action="Controlador">
            <%
                    List<Persona>list2=dao.list(U1);
                    Iterator<Persona>iter2=list2.iterator();
                    Persona per= null;
                    while(iter2.hasNext()){
                        per=iter2.next(); 
                        String N=con.descifradoCesar(per.getNombre());
                        String A=con.descifradoCesar(per.getApellidos());
                    %>
            <label>Nombre(s):</label>
            <input name="nombre" value="<%=N%>" disabled>
            <label>Apellidos:</label>
            <input name="Ape" value="<%=A%>" disabled>
            <%}%>
            <label>Situación:</label>
            <select name="Sit">
                        <%
                        List<Persona>list3=dao.consultar2();
                        Iterator<Persona>iter3=list3.iterator();
                        while(iter3.hasNext()){
                            per=iter3.next();
                        %>
                        <option><%=per.getNombre()%></option>
                        <%}%>
                    </select>
            <label>Día de la cita:</label>
            <input type="date" name="Dia" required="required">
            <input type="submit" name="accion" value="Confirmar">
        </form>
    </div>
</div>    
</body>
</html>