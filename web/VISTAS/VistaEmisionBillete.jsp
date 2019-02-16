<%-- 
    Document   : VistaEmisionBillete
    Created on : 04-feb-2019, 19:39:50
    Author     : owa_7
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Ocupacion"%>
<%@page import="POJO.Reserva"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="POJO.Viaje"%>
<%@page import="POJO.Ruta"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
        <link href="CSS/billete.css" rel="stylesheet">
        
        <!-- Bootstrap CSS -->
        <title>Busawa</title>
    </head>

    <body class="h-100">
        <style>
            canvas{
                width:100px;
            }
        </style>

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
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
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
            <div class="row mx-auto w-100 z-depth-5 ">
                <div class="col-md-12">

                    <!-- Stepers Wrapper -->
                    <ul class="stepper stepper-horizontal shadow bg-white">

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
                        <!-- Third Step -->
                        <li class="">
                            <a href="#!">
                                <span class="circle">3</span>
                                <span class="label">Datos personales</span>
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
            <div class="row w-100 ">
                <div class="col">
                    <% Reserva reserva = (Reserva) request.getSession().getAttribute("reserva");
                        List<Ocupacion> ocupacion=new ArrayList(reserva.getOcupacions());
                    %>
                    <%
                        try {
                            //Reserva reserva = (Reserva) session.getAttribute("reserva");
                            
                            DecimalFormat dc = new DecimalFormat("###.##");
                            DecimalFormat a = new DecimalFormat("##");

                            // Instant instant = Instant.ofEpochMilli(datosViaje.get(i).getHorario().getHoraSalida().getTime());
                            //LocalDateTime ldt = LocalDateTime.ofInstant(instant, ZoneOffset.systemDefault());  
                            
                            
                            for (int i = 0; i < reserva.getNumViajeros(); i++) {


                    %>
                    <main>
                        <header class="bg-info">
                            <h1>Billete de viaje</h1>
                            <div>
                                <h5>salida n°</h5>
                                <p>VY1812</p>
                            </div>
                            <div>
                                <h5>Autobús</h5>
                                <p> D26</p>
                            </div>
                        </header>
                        <section class="flight--general">
                            <div>
                                <h4><%= reserva.getViaje().getHorario().getRuta().getEstacionByEstacionOrigen().getNombre() %></h4>
                                <h2 class="text-secondary"><%= (reserva.getViaje().getHorario().getRuta().getEstacionByEstacionOrigen().getNombre()).substring(0, 3).toUpperCase() %></h2>
                            </div>
                            <div>
                                <h4>a</h4>
                            </div>
                            <div>
                                <h4><%= reserva.getViaje().getHorario().getRuta().getEstacionByEstacionDestino().getNombre() %></h4>
                                <h2 class="text-secondary"><%= (reserva.getViaje().getHorario().getRuta().getEstacionByEstacionDestino().getNombre()).substring(0, 3).toUpperCase() %></h2>
                            </div>
                        </section>
                        <section class="flight--TimeInfo">
                            <div>
                                <h5>Hora entrada</h5>
                                <p><%= reserva.getViaje().getFechaViaje() %></p>
                            </div>
                            <div>
                                <h5>Salida</h5>
                                <p><%= reserva.getViaje().getHorario().getHoraSalida() %></p>
                            </div>
                            <div>
                                <h5>Fecha</h5>
                                <p><%= reserva.getViaje().getFechaViaje() %></p>
                            </div>
                        </section>
                        <section class="flight--PassInfo">
                            <div>
                                <h5>Pasajero</h5>
                                <p><%= ocupacion.get(i).getViajero().getNombre()+ " " + ocupacion.get(i).getViajero().getApellidos() %></p>
                            </div>
                            <div>
                                <h5>Asiento</h5>
                                <p><%= ocupacion.get(i).getAsiento() %></p>
                            </div>
                        </section>
                        <section class="flight--qrcode">

                            <div id="qrcode" class="qrcode" width="100px" height="100px"></div>

                        </section>

                    </main>

                    <%                    }
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
        
        <script type="text/javascript" src="JS/jquery.qrcode.min.js"></script>
         <script>
            $(document).ready(function() {
                var billetes=document.getElementsByClassName("qrcode");
                for (var i = 0; i < <%= reserva.getNumViajeros()%>; i++) {
                    var billete=billetes[i];
                     $(billete).qrcode("<%= reserva.getLocalizador()%>");
}
               
            
});
            
        </script>
    </body>

</html>