<%-- 
    Document   : index
    Created on : 27-ene-2019, 11:58:36
    Author     : owa_7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("ControladorTraeOrigen");
                requestDispatcher.forward(request, response);
        
        %>
        <h1>Hello World!</h1>
    </body>
</html>
