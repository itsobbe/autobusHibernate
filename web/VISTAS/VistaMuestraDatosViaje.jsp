<%-- 
    Document   : VistaMuestraDatosViaje
    Created on : 19-ene-2019, 14:22:29
    Author     : owa_7
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="POJO.Viaje"%>
<%@page import="POJO.Ruta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
        <link href="CSS/css.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <title>Busawa</title>
    </head>
    <body class="h-100">
        <%
            //List datosViaje=(List)request.getAttribute("datosViaje");
            List<Viaje> datosViaje = (List) session.getAttribute("datosViaje");
            Ruta ruta = new Ruta();
            Viaje viaje = new Viaje();
            //out.print(datosViaje.get(0).getHorario().getRuta().getEstacionByEstacionDestino().getNombre());
        %>

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
                            <a class="nav-link" href="#">
                                <i class="fab fa-facebook-f"></i> Facebook
                                <span class="sr-only">(current)</span>
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
            <div class="row mx-auto w-50">
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
                                <span class="circle"><i class="fas fa-exclamation"></i></span>
                                <span class="label">Pago</span>
                            </a>
                        </li>

                    </ul>
                    <!-- /.Stepers Wrapper -->

                </div>
            </div>
            <!-- /.Horizontal Steppers -->
            <div class="row w-100">
                <div class="col">

                    <!-- News jumbotron -->
                    <%
                        try {
                            DecimalFormat dc=new DecimalFormat("###.##");
                            for (int i = 0; i < datosViaje.size(); i++) {

                                //Object[] a = (Object[]) datosViaje.get(i);
                                //ruta = (Ruta) a[0];
                                //viaje = (Viaje) a[1];

                    %>
                    <div>
                        <div class="jumbotron text-center hoverable p-4 w-50 mx-auto">
                            <!-- Grid row -->
                            <div class="row">

                                <!-- Grid column -->
                                <div class="col-md-4 offset-md-1 mx-3 my-3">

                                    <!-- Featured image -->
                                    <div class="view overlay">
                                        <img src="https://mdbootstrap.com/img/Photos/Others/laptop-sm.jpg" class="img-fluid" alt="Sample image for first version of blog listing">
                                        <a>
                                            <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-md-7 text-md-left ml-3 mt-3">

                                    <!-- Excerpt -->
                                    <a href="#!" class="green-text">
                                        <h6 class="h6 pb-1 text-primary"><i class="fas fa-desktop pr-1"></i> Work</h6>
                                    </a>

                                    <h4 class="h4 mb-4"><%=datosViaje.get(i).getHorario().getRuta().getEstacionByEstacionOrigen().getNombre() + "  -   " + datosViaje.get(i).getHorario().getRuta().getEstacionByEstacionDestino().getNombre() %></h4>

                                    <p class="font-weight-normal">Duración: <%= datosViaje.get(i).getHorario().getRuta().getDuracion()%></p>
                                    <p class="font-weight-normal">Hora salida: <%= datosViaje.get(i).getHorario().getHoraSalida()%></p>
                                    <p class="font-weight-normal">Fecha: <%= datosViaje.get(i).getFechaViaje()%></p>
                                    <p class="font-weight-normal">Precio: <%= dc.format(datosViaje.get(i).getHorario().getRuta().getPrecio()) %></p>

                                    <a href="ControladorPruebas?id=<%=datosViaje.get(i).getId()%>" class="btn btn-outline-primary">Reservar</a>

                                </div>
                                <!-- Grid column -->

                            </div>
                            <!-- Grid row -->

                        </div></div>
                    <!-- News jumbotron -->
                    <%}

                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>

                </div>
            </div>
            <footer class="text-center navbar-dark info-color d-flex align-items-center justify-content-center" style="height: 90px">
                <p class="text-white">IES Leonardo Da Vinci - 2019</p>
            </footer>
        </div>
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>

    </body>
</html>
