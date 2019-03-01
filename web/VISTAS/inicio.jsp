<%-- 
    Document   : inicio
    Created on : 15-ene-2019, 16:07:18
    Author     : owa_7
--%>

<%@page import="POJO.Estacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
        <link href="../CSS/css.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <title>Busawa</title>
    </head>


    <body>
        <div class="bg img-fluid">
            <!--Navbar -->
            <nav class="mb-1 navbar navbar-expand-lg navbar-dark info-color">
                <a class="navbar-brand " href="../ControladorTraeOrigen"><img src="../CSS/imagen/finalV3.png" width="85px" height="75px" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
                        aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a href="VistaLoginAdministrador.jsp" class="nav-link" href="#">
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
            <article>
                <section id="principal">
                    <div class="container" style="height: 600px">



                        <div class="row">
                            <div class="col-xs-12 mt-3 d-flex">
                                <!-- Default form subscription -->
                                <form method="get" action="../ControladorBuscarViaje" class="text-center border border-light p-5 bg-white animated bounceInDown" style="width: 500px">
                                    <div class="">
                                        <p class="h4 mb-4">¡Reserva tu billete ya!</p>
                                    </div>
                                    <span>Origen</span>
                                    <!-- Name -->
                                    <select class="browser-default custom-select mt-1 mb-1" id="origen" name="origen" onchange="muestraDestino(this.value)" required>
                                        <option value="" disabled selected>Choose your option</option>
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
                                    <!-- Email -->
                                    <select class="browser-default custom-select mt-1 mb-1" name="destino" id="destino" required>
                                        <option value="" disabled selected>Abre para elegir</option>
                                    </select>
                                    <span>Fecha</span>
                                    <input type="date" id="fecha" name="fecha" class="form-control mt-1 mb-1" required>
                                    <span>Número de pasajeros</span>
                                    <input type="number" id="totalPasajero" name="totalPasajero" class="form-control mt-1 mb-1" min="1" required>
                                    <!-- Sign in button -->
                                    <button class="btn btn-info btn-block mt-2" type="submit">Buscar</button>


                                </form>
                                <!-- Default form subscription --> 
                            </div>
                            <div class="col-xs-12 mx-auto">
                                <div id="c_155626d00429eaa298353f38307954e1" class="normal"></div><script type="text/javascript" src="https://www.eltiempo.es/widget/widget_loader/155626d00429eaa298353f38307954e1"></script>
                            </div>
                        </div>




                    </div>

                </section>
            </article>

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
        <script src="../JS/ajaxOrigenDestino.js" type="text/javascript"></script>
    </body>
</html>