<%@page import="Controlador.Fecha"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Caompatible" content="ie=edge">
    <title>Agendar Citas</title>
    <link rel="stylesheet" href="Styles/estilo33.css">
    <link rel="shortcout icon" href="IMG/signomedical.png">
</head>
<body>
                            <%
                        String Es=(String) session.getAttribute("Especialidad");
                        String Fe=(String) session.getAttribute("Dia");
                        int aum=Integer.parseInt((String) session.getAttribute("aum"));
                        if(Es==null){
                             out.println("<!DOCTYPE html>");
                             out.println("<html>");
                             out.println("<body onload = 'loaded();'></body>");
                             out.println("<script>");
                             out.println("function loaded() {");
                             out.println("location.href ='agendar.jsp';");
                             out.println("}");
                             out.println("</script>");
                             out.println("</html>");
                         }%>
    <header>
        <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Registrar citas</a>                                                                                                              <a  href="agendar.jsp"><button class="volver"align="right">Volver</button></a></pre></header> 
    </header>
<div class="marco">
    <div class="marco2">
        <form class="controlador" action="Controlador">
            <label>Seleccione la hora para su cita:</label>
            <select name="Hora">
                        <%
                        int c=0;
                            try{
                        PersonaDAO dao=new PersonaDAO();
                        Fecha F=new Fecha();
                        int Ho=F.HoraA()+30;
                        while(Ho%30!=0){
                            Ho=Ho+1;
                        }
                        List<Persona>list3=dao.consultar3(Es);
                        Iterator<Persona>iter3=list3.iterator();
                        Persona per3= null;
                        while(iter3.hasNext()){
                            per3=iter3.next();
                        }
                        int maxH=per3.getHora2();
                        List<Persona>list4=dao.consultar20(Es);
                        Iterator<Persona>iter4=list4.iterator();
                        Persona per4= null;
                        while(iter4.hasNext()){
                            per4=iter4.next();
                        }
                        if (aum==1 || Ho<per4.getHora())
                        {
                            Ho=per4.getHora();
                        }
                        int c2=0;
                        while(Ho<maxH){
                        List<Persona>list=dao.consultar19(Es,Ho);
                        Iterator<Persona>iter=list.iterator();
                        Persona per= null;
                        boolean ban1=false;
                        while(iter.hasNext() && ban1==false){
                        per=iter.next();
                        String Doc=per.getNombre();
                        List<Persona>list2=dao.consultar18(Fe,Es,Ho,Doc);
                        Iterator<Persona>iter2=list2.iterator();
                        Persona per2= null;
                        boolean ban2=false;
                        while(iter2.hasNext()){
                            per2=iter2.next();
                            ban2=true;
                        }
                        System.out.println("si");
                        if (ban2==false){
                        int HoT=0;
                        int Ho2=Ho;
                        while(Ho2>=60){
                            HoT=HoT+1;
                            Ho2=Ho2-60;
                        }
                        String HoF;
                        HoF=Integer.toString(Ho2);
                        if (Ho2<10){
                            HoF="0"+HoF;
                        }
                        String HoraFi=HoT+":"+HoF;
                        %>
                        <option><%=HoraFi%></option>
                        <%
                            c=1;
                            c2=c2+1;
                            ban1=true;
                        }
                        }
                        Ho=Ho+30;
                        }%>
                </select>
                <input type="submit" name="accion" value="Agendar Cita" >
                        <%
                        if(c2==0){
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<body onload = 'loaded();'></body>");
                            out.println("<script>");
                            out.println("function loaded() {");
                            out.println("alert('Ocurrió un error, es posible que no haya citas disponibles para este día, intenta seleccionar otro1');");
                            out.println("location.href ='agendar.jsp';");
                            out.println("}");
                            out.println("</script>");
                            out.println("</html>");
                        }
                            }catch(Exception e){
c=0;
}
        %></form>
    </div>
</div>
            </body>
<%
                        if(c==0){
                            session.setAttribute("mensaje","Ocurrió un error, es posible que no haya citas disponibles para este día, intenta seleccionar otro");
                            session.setAttribute("link","agendar.jsp");
                            response.sendRedirect("mensaje.jsp");
                        }%>    
</html>
