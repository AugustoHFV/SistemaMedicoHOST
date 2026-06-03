<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="Controlador.Fecha"%>
<%@page import="Controlador.Controlador"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Caompatible" content="ie=edge">
            <link rel="shortcout icon" href="IMG/signomedical.png">
    <title>Citas Agendadas</title>
    <style>
        
        * {
    margin: 0; 
    padding: 0;
    box-sizing: border-box;
}

body { 
    background: #006980;
    display: flex;
    justify-content: start;
    flex-direction: column;
    font-family: 'Ottawa Bold';
    height: 100px;
    margin: -20px 0 70px;
    
}

.titulo {
    font-size: 40px;
    margin-bottom: 30px;
    margin-top:8px ;
    color: #000;
}

.subtitulo {
    margin: 0;
    color: #000;
    display: inline;
    font-size: 50px;
    font-weight: 500;
    text-transform: uppercase;
}


.carousel {
    min-height: 500px;
    margin-top: 10px;
}

.carousel .carousel-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    user-select: none;
    width: 500px;
    height: 1000px;
   
}

.carousel .carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    position: absolute;
    top: 0;
    left: 0;
    z-index: -1;
    border-radius: 15px;
}

.carousel .indicators .indicator-item {
    border-radius: 0;
    transform: rotate(45deg);
    margin: 0 15px;
    background: #36221c;
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


.consulta {
    display: flex;
    justify-content: right;

}

.cita {
        background-color: #eee;
        border: none;
        padding: 12px 300px;
        width: 800px    ;
       


}

.titulo {
    font-size: 50px;
    display: flex;
    justify-content: left;
    margin-left: 100px;
    position: absolute;
    top: 1%;
    color: black;
}

.volver {
    margin: 10px;
    position: absolute;
    top: 3%;
    border-color: #006980;
}

.marco {
    height: 710px;
    background-color: #fff;
    padding: 50px;
    margin-top: 30px;
    border-radius: 20px;
    width: 1370px;
    margin-left: 55px;
    margin-right: 500px;

}

h1 {
    font-weight: bold;
    margin: 0;
}

h2 {
    text-align: center;
}

p {
    font-size: 14px;
    font-weight: 100;
    line-height: 5px;
    letter-spacing: 0.5px;
    margin: 20px 0 30px;
}

span {
    font-size: 12px;
}

a {
    color: #fff;
    font-size: 14px;
    text-decoration: none;
    margin: 15px 0;
}

button {
    border-radius: 20px;
    border: 1px solid #006980;
    background-color: #006980;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
    padding: 12px 45px;
    letter-spacing: 1px;
    text-transform: uppercase;
    transition: transform 200ms ease-in;
    
    
}

button:active {
    transform: scale(0.75);
    
}

button:focus {
    outline: #FFf;
}

button.ghost {
    background-color: transparent;
    border-color:#006980;
}

input {
    background-color: #eee;
    border: none;
    padding: 12px 15px;
    margin: 8px 0;
    width: 10%;
}

.container {
    background-color: #067863;
    border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
            0 10px 10px rgba(0,0,0,0.22);
    overflow: hidden;
    width: 1215px;
    max-width: 100%;
    min-height: 100px;
    margin-top: 0px ;
}

.container2 {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
            0 10px 10px rgba(0,0,0,0.22);
    width: 90%;
    max-width: 100%;
    min-height: 440px;
    
}

.dato{
    width: 30%;
    margin-left: 50px;
}
    </style>
   
    <link href="https://fonts.googleapis.com/css?family=Dancing+Script|Raleway:500,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="Styles/estilo4.css">
    <link rel="shortcout icon" href="IMG/signomedical.png">
</head>

<header>
    <br><pre><a><img src="IMG/logo2.jpg" align="left" width="50" height="50"></a>                     <a class="titulo">Citas Agendadas</a>                                                                                           <a href="editar.jsp"><button class="volver"align="right">Volver</button></a></a></header> 
</header>

<body>
    <%
           HttpSession sesion=request.getSession();
           if(sesion.getAttribute("usuarioSesion")==null || sesion.getAttribute("nivel")!="2"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
           
        %>
    <div class="marco">
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <div class="carousel center-align">
                        <%PersonaDAO dao=new PersonaDAO();
                                Controlador con=new Controlador();
                                Fecha F=new Fecha();
                                String U1=(String) session.getAttribute("usuarioSesion");
                                String CC=F.FechaPM();
                                int HoA=F.HoraA();
                                List<Persona>list=dao.consultar10(U1,CC);
                                Iterator<Persona>iter=list.iterator();
                                Persona per2= null;
                                while(iter.hasNext()){
                                    per2=iter.next();
                                    String ED=per2.getNombre();
                                    String S=per2.getApellidos();
                                    String Fe=per2.getVer();
                                    String Co=per2.getCons();
                                    String Re="";
                                    if(per2.getEmail()==null){
                                        Re="El doctor no ha generado una receta aún";
                                    }else{
                                        Re=per2.getEmail();
                                    }
                                    int Ho=Integer.parseInt(per2.getContra());
                                    int aux=F.Comp2(Fe);
                                    int HoT=0;
                                    int Ho2=Ho;
                                    while(Ho>=60){
                                        HoT=HoT+1;
                                        Ho=Ho-60;
                                    }
                                    String HoF;
                                    HoF=Integer.toString(Ho);
                                    if (Ho<10){
                                        HoF="0"+HoF;
                                    }
                                    List<Persona>list2=dao.consultar(ED);
                                    Iterator<Persona>iter2=list2.iterator();
                                    Persona per= null;
                                    while(iter2.hasNext()){
                                        per=iter2.next();
                                        }
                                        String ND=per.getNombre();
                                %>
                        <div class="carousel-item">
                            <div class="container2">
                                <h5>Nombre del Paciente:<input class="dato" type="text" value="<%=con.descifradoCesar(ND)%>" style="width: 40%;" disabled></h5>
                                <h5>Situación de la cita:<input class="dato" type="text" value="<%=S%>" style="width: 40%;" disabled></h5>
                                    <h5>Fecha:<input class="dato" type="text" value="   <%=Fe%>" style="width: 25%;" disabled> Hora:<input class="dato" type="text" value="   <%=HoT%>:<%=HoF%>" style="width: 13%;" disabled> </h5>
                                    <h5>Receta:</h5>
                                    <textarea id="receta" name="receta" rows="3" cols="50" style="height: 72px; width: 397px;" disabled><%=Re%></textarea>
                                    <br>
                                    <a href="Controlador?accion=Receta&Pac=<%=ED%>&Sit=<%=S%>&Fe=<%=Fe%>&Ho=<%=Ho2%>"><button style="width: 90%; background-color: #006A55;">Editar Receta</button></a>
                                    <br>
                                    <br>
                                    <a href="Controlador?accion=Chat&Doc=<%=ED%>"><button style="width: 90%; background-color: #006A55;">Ver mensajes con el paciente</button></a>
                                    <br>
                                    <br>
                        </div>
                    </div>
                                    <%}%>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <script src="JS/Carrusel.js"></script>
</body>
</html>
