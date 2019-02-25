<%-- 
    Document   : VistaLoginRegistro
    Created on : 30-ene-2019, 16:24:49
    Author     : owa_7
--%>

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
        <link href="../CSS/compiled-4.6.1.min.css" rel="stylesheet">
        <link href="../CSS/css.css" rel="stylesheet">
    </head>
</head>
<body class="h-100">
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
        <div class="row">
                <div class="col">
                    <!-- Horizontal Steppers -->
                    <div class="row mx-auto w-0">
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
                </div>
            </div>
        <div class="container">
            
            <div class="row">
                <div class="col">
                    <!-- Material form login -->
                    <div class="card">

                        <h5 class="card-header info-color white-text text-center py-4">
                            <strong>Inicia sesión</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <form action="../ControladorLoginPago" class="text-center" style="color: #757575;">

                                <!-- Email -->
                                <div class="md-form">
                                    <span>E-mail</span>
                                    <input type="email" id="totalPasajero" name="emailLogin" class="form-control" required>
                                </div>

                                <!-- Password -->
                                <div class="md-form">
                                    <span>Contraseña</span>
                                    <input type="password" id="contrasenaLogin" name="contrasenaLogin" class="form-control" required>
                                </div>

                                

                                <!-- Sign in button -->
                                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Iniciar sesión</button>


                            </form>
                            <!-- Form -->

                        </div>

                    </div>
                    <!-- Material form login -->
                </div>
                <!-- ## REGISTRO ## -->
                <div class="col">
                    <!-- Material form register -->
                    <div class="card">

                        <h5 class="card-header info-color white-text text-center py-4">
                            <strong>Regístrate</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <form action="../ControladorRegistrarClientePago" onsubmit="return validaDni();" class="text-center" style="color: #757575;">

                                <div class="form-row">
                                    <div class="col">
                                        <!-- First name -->
                                        <div class="md-form">
                                            <span>Nombre</span>
                                            <input type="text" id="nombre" name="nombre" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <!-- Last name -->
                                        <div class="md-form">
                                            <span>Apellidos</span>
                                            <input type="text" id="apellidos" name="apellidos" class="form-control" required>
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col">
                                        <!-- Identificador -->
                                        <div class="md-form">
                                            <span>Identificador</span>
                                            <input type="text" id="identificador" name="identificador" id="identificador" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col d-flex align-self-center">
                                        <select class="browser-default custom-select" name="tipoIdentificador" id="tipo" required> 
                                            <option selected>Tipo documento</option>
                                            <option value="nif">NIF</option>
                                            <option value="nie">NIE</option>
                                        </select>

                                    </div>
                                </div>

                                <!-- E-mail -->
                                <div class="md-form mt-0">
                                     <span>E-mail</span>
                                    <input type="email" id="materialRegisterFormEmail" name="email" class="form-control" required>
                                   
                                </div>

                                <!-- Password -->
                                <div class="md-form">
                                    <span>Contraseña</span>
                                    <input type="password" id="contrasena" name="contrasena" class="form-control" required>
                                    <small id="materialRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
                                        Al menos 8 caracteres
                                    </small>
                                </div>

                                <!-- Phone number -->
                                <div class="md-form">
                                    <span>Número de teléfono</span>
                                    <input type="number" id="materialRegisterFormPhone" name="telefono" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" required>
                                </div>

                                <!-- Sign up button -->
                                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Registrar</button>

                            </form>
                            <!-- Form -->

                        </div>

                    </div>
                    <!-- Material form register -->
                </div>
            </div>



            <!-- conainter end -->
        </div>
        

        <!-- final div img-->  
    </div>
    <script>

        $('.md-form').on('focusout', function (e) {

        });
        $('.md-form').focusin(function () {
            $('#a_c').show();
        });

    </script>
       <script>
            function validaDni(){
                
                    //var dni = document.getElementsByName("identificador"+i)[0].value;
                    var dni=document.getElementById("identificador").value;
                    var validador=true;
                    var numero, let, letra;
                    var expresion_regular_dni = /^[XYZ]?\d{5,8}[A-Z]$/;
                    
                    dni = dni.toUpperCase();
                    
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
                            
                            alert('Identificador erroneo');
                            validador= false;
                        } else {
                            validador = true;
                        }
                    } else {
                        alert('Identificador erroneo, formato no válido');
                        validador = false;
                    }
                
                if(validador){
                    return true;
                }else{return false;}
            }
        </script>
</body>
</html>
