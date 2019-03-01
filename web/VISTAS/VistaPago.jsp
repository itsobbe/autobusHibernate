<%-- 
    Document   : VistaPago
    Created on : 31-ene-2019, 16:26:09
    Author     : owa_7
--%>
<%@page import="java.util.Set"%>
<%@page import="POJO.Tarjeta"%>
<%@page import="MODELO.Billete"%>
<%@page import="POJO.Cliente"%>
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
        <link href="../CSS/compiledd-46.1.min.css" rel="stylesheet">
        <link href="../CSS/css.css" rel="stylesheet">

    </head>
</head>
<body class="h-100">
    <div class="bg img-fluid h-100 d-flex flex-column">

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
        
        <!--/.Navbar -->
        <div class="container">
            <!-- Recogemos los datos de sesion de cliente -->
            <%
                Cliente cliente = null;
                if (request.getSession().getAttribute("billete") != null) {
                    Billete billete = ((Billete) request.getSession().getAttribute("billete"));
                    if (billete.getCliente() != null) {
                        cliente = billete.getCliente();

                    }
                }

            %>



            <!-- INICIO FILA FORMULARO PAGO -->
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <!-- Material form register -->
                    <div class="card w-50">

                        <h5 class="card-header info-color white-text text-center py-4">
                            <strong>Pago</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <form onsubmit="return validar()" action="../ControladorPago" class="text-center p-5" style="color: #757575;">

                                <!-- Default form contact -->


                                <p class="h4 mb-4"></p>
                                <div class="row">
                                    <div class="col">
                                        <!-- num tarj -->
                                        <label>

                                            <input type="number" id="tarjetaNueva" name="tarjetaNueva" id="numeroNuevo" class="form-control mb-4" placeholder="Nºtarjeta" pattern=".{14,14}" required="required">
                                        </label>
                                    </div>
                                    <div class="col">
                                        <!-- tipo -->
                                        <select name="tarjetaNuevaTipo" id="tarjetaNuevaTipo" class="browser-default custom-select mb-4">
                                            <option value="" disabled>Elige</option>
                                            <option value="1" selected>Mastercard</option>
                                        </select>
                                    </div>
                                </div>
                                <%                                    //vemos si este cliente tiene tarjetas en bd y las cargamos en select    
                                    if (cliente.getTarjetas().size() > 0) {


                                %>
                                <div class="row">

                                    <div class="col ">
                                        <!-- num tarj -->
                                        <label>
                                            O elija una tarjeta de un anterior pago

                                            <select name="tarjetaVieja" onchange="desactiva(event)" class="browser-default custom-select mb-4">
                                                <option value="x" selected>Elige</option>
                                                <%                                                    //por cada tajeta que tenga el cliente mostramos 4 num de tarjta y como value le damos el id de atrjeta    
                                                    for (Tarjeta item : (Set<Tarjeta>) cliente.getTarjetas()) {
                                                %>
                                                
                                                <option value="<%= item.getId()%>">********<%= item.getNumeroString().substring(12)%></option>
                                                <%
                                                        //cerramos bucle tarjeta
                                                    }
                                                %>
                                            </select>
                                        </label>
                                    </div>
                                </div>
                                <%
                                        //cerramos el if de si hay tarjetas
                                    }

                                %>
                                <div class="row">
                                    <div class="col">
                                        <label>
                                            Caducidad
                                            <input name="caducidad" id="caducidad" class="form-control mb-4" type="month" min="2019-03" value="2019-03" id="example-month-input" required>
                                        </label>

                                    </div>
                                    <div class="col">
                                        <label>
                                            Código CVV
                                            <input type="number" id="cvv" name="cvv" id="defaultContactFormName" class="form-control mb-4" placeholder="CVV" required>
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>
                                            Nombre
                                            <input type="text" name="nombre" id="defaultContactFormName" class="form-control mb-4" value="<%= cliente.getNombre()%>" required>
                                        </label>
                                    </div>
                                    <div class="col">
                                        <label>
                                            Apellidos
                                            <input type="text" name="apellidos" id="defaultContactFormName" class="form-control mb-4" value="<%= cliente.getApellido()%>" required>
                                        </label>
                                    </div>
                                </div>
                                <!-- Send button -->
                                <button class="btn btn-info btn-block" type="submit">Pagar</button>
                                <!-- Default form contact -->
                            </form>
                            <!-- Form -->
                        </div>
                    </div>
                </div>
            </div>



            <!-- conainter end -->
        </div>
        

        <!-- final div img-->  
    </div>

    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/js/mdb.min.js"></script>
    <script type="text/javascript" src="../JS/creditcard.js"></script>
    <script type="text/javascript" src="../JS/usoClaseCreito.js"></script>
    
    <script>
        
    var creditcard = new CreditCard();
    
  
        function validar(){
            
            var numeroTarjeta=document.getElementById('numeroNuevo').value;
            var fecha=document.getElementById('caducidad').value;
            var fecha=fecha.split('-');
            var cvv=document.getElementById('cvv').value;
             //&& creditcard.isExpirationDateValid()
             //alert(fecha[0].toString());
            if(creditcard.isValid(numeroTarjeta.toString()) && creditcard.isExpirationDateValid(fecha[1].toString(), fecha[0].toString()) && creditcard.isSecurityCodeValid(numeroTarjeta.toString(), cvv.toString())) {
                
                return true;

            }else{
                alert("Error en tarjeta crédito");
                return false;
    }
}
        function desactiva(event){
            
            if(event.target.value !== "x"){
                document.getElementById("tarjetaNueva").disabled=true;
                document.getElementById("tarjetaNuevaTipo").disabled=true;
            }else{
                document.getElementById("tarjetaNueva").disabled=false;
                document.getElementById("tarjetaNuevaTipo").disabled=false;
            }
        }
    </script>
</body>
</html>


