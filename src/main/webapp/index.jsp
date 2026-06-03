<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="Controlador.Controlador"%>
<%@page import="Controlador.Fecha"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Página Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcout icon" href="IMG/signomedical.png">
        <link rel="stylesheet" href="Styles/estilo.css">
    </head>
    <body>
        <%
           HttpSession sesion=request.getSession();
           if(session.getAttribute("nivel")=="2"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='Medico.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
            }else if(session.getAttribute("nivel")=="3"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='IndAdmin.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
            }
           
        %>
        <header>
            <pre><a href="agendar.jsp"><button class="botones1">Agendar citas</button></a>  <a href="modificar.jsp"><button class="botones1">Citas Agendadas</button></a>                                                             <a class="btn btn-primary" href="main.jsp"><img class="logo"  src="IMG/Perfil.jpg" align="right" width="50" height="50"></img></a></pre>
        </header>
        <pre>
            <img class="doctor" height="360" width="318" src="IMG/doctor.jpg" align="left" alt="">    
        <div class="consulta">   
        <div class="cita">  
                <%PersonaDAO dao=new PersonaDAO();
                Fecha F=new Fecha();
                String U1=(String) session.getAttribute("usuarioSesion");
                String CC=F.Fecha();
                int HoA=F.HoraA();
                if(HoA>=1260){
                    HoA=0;
                    String[] items = CC.split("-");
                    int año=Integer.parseInt(items[0]);
                    int mes=Integer.parseInt(items[1]);
                    int dia=Integer.parseInt(items[2]);
                    CC=F.FechaS(año, mes, dia);
                }
                int c=0;
                List<Persona>list=dao.consultar7(U1,CC,HoA);
                Iterator<Persona>iter=list.iterator();
                Persona per2= null;
                while(iter.hasNext()){
                    per2=iter.next();
                    int mins=Integer.parseInt(per2.getContra());
                    int horas=0;
                    String minsF;
                    while(mins>=60){
                        horas=horas+1;
                        mins=mins-60;
                    }
                    if(mins<10){
                        minsF="0"+Integer.toString(mins);
                    }
                    else{
                        minsF=Integer.toString(mins);
                    }
                %>
                <pre><h2 align="left" style="color:#000000">Cita Proxima</h2>  <h3 style="color:#000000">Fecha</h3><input type="text" value="<%=per2.getVer()%>" disabled><br><h3 style="color:#000000">Hora</h3><input type="text" value="<%=horas%>:<%=minsF%>" disabled><br><h3 style="color:#000000">Situacion</h3><input type="text" value="<%=per2.getApellidos()%>" disabled></pre>    
                <%
                c=c+1;}
                if(per2==null){
                List<Persona>list5=dao.consultar23(U1,CC,HoA);
                Iterator<Persona>iter5=list5.iterator();
                Persona per5= null;
                while(iter5.hasNext()){
                    per5=iter5.next();
                    int mins=Integer.parseInt(per5.getContra());
                    int horas=0;
                    String minsF;
                    while(mins>=60){
                        horas=horas+1;
                        mins=mins-60;
                    }
                    if(mins<10){
                        minsF="0"+Integer.toString(mins);
                    }
                    else{
                        minsF=Integer.toString(mins);
                    }
                %>
                 <pre><h2 align="left" style="color:#000000">Cita Proxima</h2>  <h3 style="color:#000000">Fecha</h3><input type="text" value="<%=per5.getVer()%>" disabled><br><h3 style="color:#000000">Hora</h3><input type="text" value="<%=horas%>:<%=minsF%>" disabled><br><h3 style="color:#000000">Situacion</h3><input type="text" value="<%=per5.getApellidos()%>" disabled></pre>
                <%c=c+1;}
}
                if(c==0){%>
                <h2 style="color:#000000">No hay cita próxima</h2>
                <h3 style="color:#000000">(Inicia sesión para ver tu próxima cita)</h3>
                <%}%>
            </div> <p align="right">           </p>
        </div>
        </pre>
    </body>
</html> 
