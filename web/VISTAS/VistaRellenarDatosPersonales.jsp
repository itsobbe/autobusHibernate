<%-- 
    Document   : VistaRellenarDatosPersonales
    Created on : 20-ene-2019, 11:48:53
    Author     : owa_7
--%>

<%@page import="MODELO.TrayectoHorario"%>
<%@page import="POJO.Parametros"%>
<%@page import="POJO.Ocupacion"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html class="h-100">
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
        
        <link href="CSS/css.css" rel="stylesheet">
        <script type="text/javascript" src="JS/controlAsientos.js"></script>

    </head>
    <body class="h-100">

        <div class="bg img-fluid h-100 d-flex flex-column" style="overflow: auto">
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
            <!--/.Navbar -->>
            
            <%
                List a = (List) session.getAttribute("arrayAsiento");
                int totPlazas = ((Parametros) session.getAttribute("parametros")).getNumPlazas();
                int totalPasajeros = ((TrayectoHorario) session.getAttribute("trayectoHorario")).getNumViajeros();
            %>


            <!-- formulario pasajeros -->
            <form onsubmit="return validarDNI(<%=totalPasajeros%>);" action="ControladorGuardarDatosViajeros" >
                <!--Accordion wrapper-->
                <div class="accordion md-accordion w-50 mx-auto" id="accordionEx1" role="tablist" aria-multiselectable="true">

                    <%  for (int i = 0; i < totalPasajeros; i++) {
                    %>
                    <!-- Accordion card -->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header bg-info" role="tab" id="headingTwo1">
                            <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#collapseTwo<%=i%>"
                               aria-expanded="false" aria-controls="collapseTwo1">
                                <h5 class="mb-0  text-white">
                                    Pasajero <%=i + 1%> <i class="fas fa-angle-down rotate-icon"></i>
                                </h5>
                            </a>
                        </div>

                        <!-- Card body -->
                        <div id="collapseTwo<%=i%>" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordionEx1">
                            <div class="card-body">
                                <span>NIF/NIE</span>
                                <input type="text" id="identificacion" name="identificacion<%=i%>" class="form-control mt-1 mb-1" required>
                                <span>Tipo identificador</span>
                                <select name="tipo<%=i%>" class="browser-default custom-select mb-4" required>
                                    <option value="" disabled>Elige</option>
                                    <option value="nif">NIF</option>
                                    <option value="nie">NIE</option>
                                </select>

                                <span>Nombre</span>
                                <input type="text" id="totalPasajero" name="nombre<%=i%>" class="form-control mt-1 mb-1" required>
                                <span>Apellidos</span>
                                <input type="text" id="totalPasajero" name="apellidos<%=i%>" class="form-control mt-1 mb-1" required>

                                <div class="asientos d-flex d-inline-flex">

                                    <span>Asientos</span>
                                    <!-- Default unchecked -->
                                    <%
                                        try {

                                            for (int j = 1; j < totPlazas + 1; j++) {
                                                


                                    %>
                                        
                                    <input type="checkbox" class="p-2 m-2" name="asiento<%=i%>" value="<%=j%>"

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
                        <button class="btn btn-primary" type="submit">Siguiente</button>
                    </div>
                </div>
                <!-- Accordion wrapper -->
                <!-- cierre formulario -->
            </form>
            
        </div>
            
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
        <script type="text/javascript" src="JS/controlAsientos.js"></script>


    </body>
    <script>
                
            function validarDNI(cuantos) {
                

                for (i = 0; i < cuantos; i++) {
                   
                    var dni = document.getElementsByName("identificacion"+i)[0].value;
                    var validador=true;
                    var numero, let, letra;
                    var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;

                    dni = dni.toUpperCase();
                    var quien=i+1;
                    if (expresion_regular_dni.test(dni) === true) {
                        numero = dni.substr(0, dni.length - 1);
                        numero = numero.replace('X', 0);
                        numero = numero.replace('Y', 1);
                        numero = numero.replace('Z', 2);
                        let = dni.substr(dni.length - 1, 1);
                        numero = numero % 23;
                        letra = 'TRWAGMYFPDXBNJZSQVHLCKET';
                        letra = letra.substring(numero, numero + 1);
                        if (letra !== let) {
                            
                            alert('Pasajero ' + quien + ', Identificador erroneo');
                            validador= false;
                        } else {
                            validador = true;
                        }
                    } else {
                        alert('Pasajero ' + quien + ', Identificador erroneo, formato no válido');
                        validador = false;
                    }
                }
                if(validador){
                    return true;
                }else{return false;}
            }
        </script>
    
</html>
