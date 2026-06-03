<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
                <link rel="shortcout icon" href="IMG/signomedical.png">
        <title>Crear Cuenta</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    <body>
        <form name="Controlador">
            <table style="text-align: left; margin-left: auto; margin-right: auto;">
                <tbody>
                    <tr>
                        <td>
                            <label>Ingresa tu(s) nombre(s)(Máximo 20 Caracteres)</label>
                        </td>
                        <td>
                            <input name="N" required="required" type="text" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Ingresa tus apellidos(Máximo 20 Caracteres)</label>
                        </td>
                        <td>
                            <input name="A" required="required" type="text" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Ingresa tu correo electrónico(Máximo 50 Caracteres)</label>
                        </td>
                        <td>
                            <input name="CE" required="required" type="text" maxlength="50"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Ingresa tu nombre de usuario(Máximo 20 Caracteres)</label>
                        </td>
                        <td>
                            <input name="U" required="required" type="text" maxlength="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Ingresa una contraseña: (Máximo 20 Caracteres)</label>
                        </td>
                        <td>
                            <input name="C" required="required" type="text" maxlength="20"/>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2" rowspan="1">
                            <input value="Agregar" name="accion"   type="submit" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <a href="consultar.jsp">Volver</a>
        </form>
    </body>
</html>