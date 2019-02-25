<%-- 
    Document   : VistaBuscarViajeRealizado
    Created on : 14-feb-2019, 16:13:05
    Author     : owa_7
--%>

<%@page import="POJO.Estacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
        <link href="CSS/compiled-4.6.1.min.css" rel="stylesheet">
        <link href="../CSS/css.css" rel="stylesheet"
    </head>
    <body>
        <div class="bg img-fluid h-100 d-flex flex-column">
            <!--Navbar -->
            <nav class="mb-1 navbar navbar-expand-lg navbar-dark info-color">
                <a class="navbar-brand " href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
                        aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a href="../ControladorTraeOrigen?id=2" class="nav-link" href="#">
                               Viaje realizado
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fab fa-instagram"></i> Instagram</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <i class="fas fa-user"></i> Profile </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                                <a class="dropdown-item" href="#">My account</a>
                                <a class="dropdown-item" href="#">Log out</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!--/.Navbar -->
            <!-- Horizontal Steppers -->
            <div class="row mx-auto w-100">
                <div class="col-md-12">

                    <!-- Stepers Wrapper -->
                    <ul class="stepper stepper-horizontal bg-white">

                        <!-- First Step -->
                        <li class="completed">
                            <a href="#!">
                                <span class="circle ">1</span>
                                <span class="label">Elige</span>
                            </a>
                        </li>

                        <!-- Second Step -->
                        <li class="">
                            <a href="#!">
                                <span class="circle">2</span>
                                <span class="label">Reserva</span>
                            </a>
                        </li>

                        <!-- Third Step -->
                        <li class="">
                            <a href="#!">
                                <span class="circle">3</span>
                                <span class="label">Datos personales</span>
                            </a>
                        </li>
                        <!-- Forth Step -->
                        <li class="">
                            <a href="#!">
                                <span class="circle">3</span>
                                <span class="label">Resumen</span>
                            </a>
                        </li>

                        <!-- Fifth Step -->
                        <li class="">
                            <a href="#!">
                                <span class="circle"><i class="fas fa-exclamation"></i></span>
                                <span class="label">Pago</span>
                            </a>
                        </li>

                    </ul>
                    <!-- /.Stepers Wrapper -->

                </div>
            </div>
            <!-- /.Horizontal Steppers -->
        
        <div class="row mx-auto mb-5">
                <div class="col w-50">
                    <!-- Material form login -->
                    <div class="card">

                        <h5 class="card-header info-color white-text text-center py-4">
                            <strong>Buscar viaje</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <!-- <form action="../ControladorLoginPago" class="text-center" style="color: #757575;"> -->

                                <form method="get" action="../ControladorConfirmarViaje" class="text-center border border-light p-5 bg-white animated bounceInDown" style="width: 500px">
                                    <div class="">
                                        <p class="h4 mb-4">Elegir viaje realizado</p>
                                    </div>
                                    <span>Origen</span>
                                   
                                    <select class="browser-default custom-select mt-1 mb-1" id="origen" name="origen" onchange="muestraDestino(this.value)" required>
                                        <option selected="">Abre para elegir</option>
                                        <%
                                            List array = (List) session.getAttribute("arrayOrigen");
                                        %>
                                        <% for (int i = 0; i < array.size(); i++) {
                                        %>
                                        <option value="<%= ((Estacion) array.get(i)).getId()%>"><%= ((Estacion) array.get(i)).getNombre()%></option>
                                        <%}%>
                                        
                                    </select>

                                    <span>Destino</span>
                                    
                                    <select class="browser-default custom-select mt-1 mb-1" name="destino" id="destino" onchange="muestraFecha()" required>
                                        <option value="" disabled selected>Abre para elegir</option>
                                    </select>
                                    <span>Fecha</span>
                                    <select class="browser-default custom-select mt-1 mb-1" name="fecha" id="fecha" onchange="muestraHora()" required>
                                        <option value="" disabled selected>Abre para elegir</option>
                                    </select>
                                    <span>Hora salida</span>
                                    <select class="browser-default custom-select mt-1 mb-1" name="horaSalida" id="horaSalida" required>
                                        <option value="" disabled selected>Abre para elegir</option>
                                    </select>
                                    <button class="btn btn-info btn-block mt-2" type="submit">Finalizar</button>


                                </form>
                                <!-- Default form subscription --> 


                            <!--</form> -->
                            <!-- Form -->

                        </div>

                    </div>
                    <!-- Material form login -->
                </div>
        </div>
        
        
        
        </div>
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
        <script type="text/javascript" src="JS/compiled.0.min.js"></script>
        <script src="../JS/ajaxOrigenDestino.js" type="text/javascript"></script>
        <script src="../JS/ajaxFechaViaje.js" type="text/javascript"></script>
         <script src="../JS/ajaxHoraViaje.js" type="text/javascript"></script>
    </body>
</html>
