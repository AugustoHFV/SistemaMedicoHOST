

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <body onload = 'loaded();'><%
           String m=(String) session.getAttribute("mensaje");
           if(m=="null"){
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<body onload = 'loaded();'></body>");
                out.println("<script>");
                out.println("function loaded() {");
                out.println("location.href ='index.jsp';");
                out.println("}");
                out.println("</script>");
                out.println("</html>");
            }%>
           </body>
    <script>
        <%String l=(String) session.getAttribute("link");%>
        <%String I=(String) session.getAttribute("icono");%>
        <%session.setAttribute("mensaje",null);%>
        <%session.setAttribute("link",null);%>
        <%session.setAttribute("icono",null);%>
        var variable = '<%= I %>';
        var variable2 = '<%= m %>';
    Swal.fire({
            title: variable2,
            icon: variable
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '<%=l%>';
            }
        });
        setTimeout(function() {
      window.location.href = '<%=l%>';
    }, 3000);
            
    </script>
</html>
