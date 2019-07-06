<%-- 
    Document   : VistaBuscarViajesRealizados
    Created on : 08-mar-2019, 9:26:41
    Author     : owa_7
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                                <form method="get" action="../ControladorBuscarViajesRealizados" class="text-center border border-light p-5 bg-white animated bounceInDown" style="width: 500px">
                                    <div class="">
                                        <p class="h4 mb-4">Busca viajes realizados</p>
                                    </div>

                                    <span>Fecha inicio</span>
                                    <input type="date" id="fechaInicio" name="fechaInicio" class="form-control mt-1 mb-1" required>
                                     <span>Fecha fin</span>
                                    <input type="date" id="fechaFinal" name="fechaFinal" class="form-control mt-1 mb-1" required>
                                    <span>NIF</span>
                                    <input type="text" id="nif" name="nif" class="form-control mt-1 mb-1" required>
                                    <!-- Sign in button -->
                                    <button class="btn btn-info btn-block mt-2" type="submit">Buscar</button>


                                </form>
                                <!-- Default form subscription --> 
                            </div>
                            <div class="col-xs-12 mx-auto">
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
    </body>
</html>
