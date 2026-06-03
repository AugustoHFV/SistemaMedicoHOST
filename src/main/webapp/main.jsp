<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesion</title>
    <link rel="stylesheet" href="Styles/esilo2.css">
    <link rel="shortcout icon" href="IMG/signomedical.png">
  
</head>
<body>
    <%
           HttpSession sesion=request.getSession();
           if( session.getAttribute("nivel")=="1"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='editar.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
           if( session.getAttribute("nivel")=="2"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='editar.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
           }
           if( session.getAttribute("nivel")=="3"){
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
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="Controlador">
                <script src="JS/registroV.js"></script>
                <h1>Crear Cuenta</h1>    
                <input type="text" name="name" placeholder="Nombre(s)" maxlength="20" required="required"/>
                <input type="text" name="ape" placeholder="Apellidos" maxlength="20" required="required"/>
                <input type="email" name="email" placeholder="Correo Electronico" maxlength="300" required="required"/>
                <input type="text" name="password" placeholder="Contraseña" maxlength="30" required="required"/>
                <input type="submit" name="accion" value="Crear">
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="Srvldatos" method="POST">
                <h1>Iniciar sesion</h1>
                <input type="email" name="email" placeholder="Correo Electronico" required="required"/>
                <input type="password" name="password" placeholder="Contraseña" required="required"/>
                <a href="#">Olvidaste tu contraseña?</a>
                <input type="submit" value="Iniciar Sesión">
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Bienvenido de vuelta</h1>
                    <p>Para mantenerte conectado con nosotros, inicia sesion con tu informacion</p>
                    <button class="ghost" id="signIn">Iniciar Sesion</button>
                    <div class="social-container">
                        <img height="180" width="159" src="IMG/logo2.jpg" alt="">
                    </div>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Bienvenido!!</h1>
                    <p>Ingresa tus datos para empezar con nosotros</p>
                    <button class="ghost" id="signUp">Crear Cuenta</button>
                    <div class="social-container">
                        <img height="180" width="159" src="IMG/logo2.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        </div>  
        <script src="JS/Sesion.js"></script>
</body>
</html>