<%-- 
    Document   : VistaResumenCompra
    Created on : 27-ene-2019, 17:57:57
    Author     : owa_7
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="POJO.Viaje"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="POJO.Ocupacion"%>
<%@page import="MODELO.Billete"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.Viajero"%>
<%@page import="MODELO.TrayectoHorario"%>
<%@page import="POJO.Parametros"%>
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
        <link href="CSS/css.css" rel="stylesheet"
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
            <%

                DecimalFormat dc = new DecimalFormat("###.##");

                //este no lo mecesito porque el asient ya es fijo
                int totPlazas = ((Parametros) session.getAttribute("parametros")).getNumPlazas();
                //podemos para hacer el bucle de tantas cartas como pasajeros con numplzaas o del arraylist de viajeros
                int totalPasajeros = ((TrayectoHorario) session.getAttribute("trayectoHorario")).getNumViajeros();
                //recogemos el arraylist de viajeros
                ArrayList<Viajero> viajeros = ((Billete) request.getSession().getAttribute("billete")).getViajero();

                Viaje viaje = ((Billete) request.getSession().getAttribute("billete")).getViaje();

                TrayectoHorario trayectoHorario = (TrayectoHorario) request.getSession().getAttribute("trayectoHorario");

            %>


            <!-- formulario pasajeros -->
            <form action="">
                <!-- Aquí meter los datos conjuntos -->
                <h5 class="card-header bg-light">BUSAWA</h5>
                <div class="card-body bg-white">
                    <h5 class="card-title">Origen: <%= trayectoHorario.getOrigen()%></h5>
                    <h5 class="card-title">Destino: <%= trayectoHorario.getDestino()%></h5>
                    <p class="card-text">Fecha Salida: <%= trayectoHorario.getFechaSalida().format(DateTimeFormatter.ofPattern("dd MMM uuu"))%></p>
                    <p class="card-text">Precio total: <%= dc.format(trayectoHorario.getSalida().get(0).getPrecio() * totalPasajeros)%>€</p>
                    <p class="card-text">Hora Salida:<%= viaje.getHorario().getHoraSalida()%></p>
                </div>
                <!--Accordion wrapper-->
                <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">

                    <%  for (int i = 0; i < totalPasajeros; i++) {

                            Set<Ocupacion> ocu = viajeros.get(i).getOcupacions();
                            Iterator iter = ocu.iterator();


                    %>
                    <!-- Accordion card -->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header" role="tab" id="headingTwo1">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#collapseTwo<%=i%>"
                               aria-expanded="false" aria-controls="collapseTwo1">
                                <h5 class="mb-0">
                                    Pasajero <%=i + 1%> <i class="fas fa-angle-down rotate-icon"></i>
                                </h5>
                            </a>
                        </div>

                        <!-- Card body -->
                        <div id="collapseTwo<%=i%>" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordionEx1">
                            <div class="card-body">
                                <span>NIF/NIE</span>
                                <input type="text" id="totalPasajero" name="identificacion<%=i%>" class="form-control mt-1 mb-1" value="<%= viajeros.get(i).getIdentificador()%>">
                                <span>Nombre</span>
                                <input type="text" id="totalPasajero" name="nombre<%=i%>" class="form-control mt-1 mb-1" value="<%= viajeros.get(i).getNombre()%>">
                                <span>Apellidos</span>
                                <input type="text" id="totalPasajero" name="apellidos<%=i%>" class="form-control mt-1 mb-1" value="<%= viajeros.get(i).getApellidos()%>">

                                <div class="asientos">
                                    <span>Asiento</span>
                                    <input  type="number" name="asiento<%=i%>" class="form-control mt-1 mb-1" value="<%= ((Ocupacion) iter.next()).getAsiento()%>">
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Accordion card -->

                    <% //cierre bucle tantas tarjetas como pasajeros
                        };
                    %>
                    <div class="card-footer text-muted">
                        <button class="btn btn-secondary" href type="submit">Siguiente</button>
                        <a href="VISTAS/VistaLoginRegistro.jsp" class="btn btn-secondary" role="button" aria-pressed="true">Siguiente</a>
                    </div>
                </div>
                <!-- Accordion wrapper -->
                <!-- cierre formulario -->
            </form>
            <footer class="text-center navbar-dark info-color d-flex align-items-center justify-content-center" style="height: 90px">
                <p class="text-white">IES Leonardo Da Vinci - 2019</p>
            </footer>
        </div>
                    <script type="text/javascript" src="JS/compiled.0.min.js"></script>
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
