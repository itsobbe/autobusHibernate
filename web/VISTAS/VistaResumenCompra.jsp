<%-- 
    Document   : VistaResumenCompra
    Created on : 27-ene-2019, 17:57:57
    Author     : owa_7
--%>

<%@page import="MODELO.TrayectoHorario"%>
<%@page import="POJO.Parametros"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                
                int totPlazas = ((Parametros) session.getAttribute("parametros")).getNumPlazas();
                int totalPasajeros = ((TrayectoHorario) session.getAttribute("trayectoHorario")).getNumViajeros();
            %>


            <!-- formulario pasajeros -->
            <form action="ControladorGuardarDatosViajeros">
                <!--Accordion wrapper-->
                <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">

                    <%  for (int i = 0; i < totalPasajeros; i++) {
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
                                <input type="text" id="totalPasajero" name="identificacion<%=i%>" class="form-control mt-1 mb-1">
                                <span>Nombre</span>
                                <input type="text" id="totalPasajero" name="nombre<%=i%>" class="form-control mt-1 mb-1">
                                <span>Apellidos</span>
                                <input type="text" id="totalPasajero" name="apellidos<%=i%>" class="form-control mt-1 mb-1">

                                <div class="asientos">


                                    <!-- Default unchecked -->
                                    <%
                                        try {

                                            for (int j = 1; j < totPlazas + 1; j++) {%>

                                    <input type="checkbox" name="asiento<%=i%>" value="<%=j%>"

                                           <%
                                               if (a.contains(j)) {
                                           %>disabled<% }%>

                                           ><%=j%><br>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.print(e);
                                        }%>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Accordion card -->

                    <% //cierre bucle tantas tarjetas como pasajeros
                        };
                    %>
                    <div class="card-footer text-muted">
                        <button class="btn btn-secondary" type="submit">Siguiente</button>
                    </div>
                </div>
                <!-- Accordion wrapper -->
                <!-- cierre formulario -->
            </form>
            <footer class="text-center navbar-dark info-color d-flex align-items-center justify-content-center" style="height: 90px">
                <p class="text-white">IES Leonardo Da Vinci - 2019</p>
            </footer>
    </body>
</html>
