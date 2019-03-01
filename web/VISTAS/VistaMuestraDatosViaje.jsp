<%-- 
    Document   : VistaMuestraDatosViaje
    Created on : 19-ene-2019, 14:22:29
    Author     : owa_7
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZoneOffset"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalTime"%>
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
                <a class="navbar-brand " href="ControladorTraeOrigen"><img src="CSS/imagen/finalV3.png" width="85px" height="75px" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
                        aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a href="VISTAS/VistaLoginAdministrador.jsp" class="nav-link" href="#">
                               Viaje realizado
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fab fa-instagram"></i> Instagram</a>
                        </li>
                        
                    </ul>
                </div>
            </nav>
            <!--/.Navbar -->
           
            <div class="row w-100">
                <div class="col">
                    <!-- News jumbotron -->
                    <%
                        try {
                            DecimalFormat dc = new DecimalFormat("###.##");
                            DecimalFormat a = new DecimalFormat("##");
                            for (int i = 0; i < datosViaje.size(); i++) {
                                Instant instant = Instant.ofEpochMilli(datosViaje.get(i).getHorario().getHoraSalida().getTime());
                                LocalDateTime ldt = LocalDateTime.ofInstant(instant, ZoneOffset.systemDefault());      
                    %>
                    <div>
                        <div class="jumbotron text-center hoverable p-4 w-50 mx-auto">

                            <div class="row d-flex justify-content-center">
                                <!-- Excerpt -->
                                <a href="#!" class="green-text">
                                    <h6 class="h6 pb-1 text-primary">BUSAWA</h6>
                                    <p class="font-weight-normal"><i class="far fa-calendar-alt"></i><%= LocalDate.parse(datosViaje.get(i).getFechaViaje().toString()).format(DateTimeFormatter.ofPattern("d-MM-uuuu")) %></p>
                                </a>
                            </div>

                            <!-- Grid row -->
                            <div class="row">

                                <!-- Grid column -->
                                <div class="col d-inline-flex justify-content-around">

                                    <h4 class="h4 mb-4"><i class="fas fa-bus-alt text-primary"><%=datosViaje.get(i).getHorario().getRuta().getEstacionByEstacionOrigen().getNombre()%></i></h4>

                                    <p class="font-weight-normal align-self-end"><i class="far fa-clock">Hora salida:<%= new SimpleDateFormat("HH:mm").format(datosViaje.get(i).getHorario().getHoraSalida()) %></i></p>
                                    <p class="font-weight-normal align-self-start"><i class="fas fa-arrow-right"></i> <i
                                            class="fas fa-stopwatch"> <%= a.format(datosViaje.get(i).getHorario().getRuta().getDuracion()) %> MIN</i> <i class="fas fa-arrow-right"></i></p>
                                    <p class="font-weight-normal align-self-end"><i class="far fa-clock">Hora llegada:<%= ldt.plusMinutes(datosViaje.get(i).getHorario().getRuta().getDuracion().longValue()).format(DateTimeFormatter.ofPattern("HH:mm"))%></i></p>
                                    <h4 class="h4 mb-4 text-primary"><%=datosViaje.get(i).getHorario().getRuta().getEstacionByEstacionDestino().getNombre()%><i class="fas fa-bus-alt"></i></h4>

                                </div>
                                <!-- Grid column -->
                            </div>
                            <!-- Grid row -->

                            <div class="row d-flex justify-content-center">


                                <a href="#" class="btn btn-primary"><%= dc.format(datosViaje.get(i).getHorario().getRuta().getPrecio())%> <i class="fas fa-euro-sign"></i></a>
                                <!-- Excerpt -->
                                <a href="ControladorPruebas?id=<%=datosViaje.get(i).getId()%>" class="btn btn-outline-primary">Reservar</a>
                            </div>

                        </div>
                    </div>
                    <!-- News jumbotron -->
                    <%}

                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>

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

    </body>

</html>