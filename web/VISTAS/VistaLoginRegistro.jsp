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
        <div class="container">
            <div class="row">
                <div class="col">
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
                </div>
            </div>
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
                                    <input type="email" id="emailLogin" name="emailLogin" class="form-control">
                                    <label for="email">E-mail</label>
                                </div>

                                <!-- Password -->
                                <div class="md-form">
                                    <input type="password" id="contrasenaLogin" name="contrasenaLogin" class="form-control">
                                    <label for="contrasenaLogin">Contraseña</label>
                                </div>

                                <div class="d-flex justify-content-around">
                                    <div>
                                        <!-- Remember me -->
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="materialLoginFormRemember">
                                            <label class="form-check-label" for="materialLoginFormRemember">Recuerdame</label>
                                        </div>
                                    </div>
                                    <div>
                                        <!-- Forgot password -->
                                        <a href="">¿Contraseña olvidada?</a>
                                    </div>
                                </div>

                                <!-- Sign in button -->
                                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Sign in</button>


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
                            <form action="../ControladorRegistrarClientePago" class="text-center" style="color: #757575;">

                                <div class="form-row">
                                    <div class="col">
                                        <!-- First name -->
                                        <div class="md-form">
                                            <input type="text" id="nombre" name="nombre" class="form-control">
                                            <label for="nombre">Nombre</label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <!-- Last name -->
                                        <div class="md-form">
                                            <input type="email" id="apellidos" name="apellidos" class="form-control">
                                            <label for="apellidos">Apellidos</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col">
                                        <!-- Identificador -->
                                        <div class="md-form">
                                            <input type="text" id="identificador" name="identificador" class="form-control">
                                            <label for="identificador">Identificador</label>
                                        </div>
                                    </div>
                                    <div class="col d-flex align-self-center">
                                        <select class="browser-default custom-select" name="tipoIdentificador">
                                            <option selected>Tipo documento</option>
                                            <option value="nif">NIF</option>
                                            <option value="nie">NIE</option>
                                            
                                        </select>
                                        
                                    </div>
                                </div>

                                <!-- E-mail -->
                                <div class="md-form mt-0">
                                    <input type="email" id="materialRegisterFormEmail" name="email" class="form-control">
                                    <label for="materialRegisterFormEmail">E-mail</label>
                                </div>

                                <!-- Password -->
                                <div class="md-form">
                                    <input type="password" id="materialRegisterFormPassword" name="contrasena" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                                    <label for="materialRegisterFormPassword">Contraseña</label>
                                    <small id="materialRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
                                        Al menos 8 caracteres
                                    </small>
                                </div>

                                <!-- Phone number -->
                                <div class="md-form">
                                    <input type="number" id="materialRegisterFormPhone" name="telefono" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">
                                    <label for="materialRegisterFormPhone">Número de teléfono</label>
                                    <small id="materialRegisterFormPhoneHelpBlock" class="form-text text-muted mb-4">
                                        
                                    </small>
                                </div>

                                <!-- Newsletter -->
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="materialRegisterFormNewsletter">
                                    <label class="form-check-label" for="materialRegisterFormNewsletter">Subscribe to our newsletter</label>
                                </div>

                                <!-- Sign up button -->
                                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Sign in</button>


                                <hr>

                                <!-- Terms of service -->
                                <p>By clicking
                                    <em>Sign up</em> you agree to our
                                    <a href="" target="_blank">terms of service</a>

                            </form>
                            <!-- Form -->

                        </div>

                    </div>
                    <!-- Material form register -->
                </div>
            </div>



            <!-- conainter end -->
        </div>
        <footer class="text-center navbar-dark info-color d-flex align-items-center justify-content-center" style="height: 90px">
            <p class="text-white">IES Leonardo Da Vinci - 2019</p>
        </footer>

        <!-- final div img-->  
    </div>
</body>
</html>
