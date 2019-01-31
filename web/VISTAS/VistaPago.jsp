<%-- 
    Document   : VistaPago
    Created on : 31-ene-2019, 16:26:09
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
                <div class="col d-flex justify-content-center">
                    <!-- Material form register -->
                    <div class="card w-50">

                        <h5 class="card-header info-color white-text text-center py-4">
                            <strong>Pago</strong>
                        </h5>

                        <!--Card content-->
                        <div class="card-body px-lg-5 pt-0">

                            <!-- Form -->
                            <form action="../Controlador" class="text-center p-5" style="color: #757575;">

                                <!-- Default form contact -->


                                <p class="h4 mb-4"></p>
                                <div class="row">
                                    <div class="col">
                                        <!-- num tarj -->
                                        <label>

                                            <input type="number" id="defaultContactFormName" class="form-control mb-4" placeholder="Nºtarjeta">
                                        </label>
                                    </div>
                                    <div class="col">
                                        <!-- tipo -->
                                        <select class="browser-default custom-select mb-4">
                                            <option value="" disabled>Elige</option>
                                            <option value="1" selected>Mastercard</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col ">
                                        <!-- num tarj -->
                                        <label>
                                            O elija una tarjeta de un anterior pago
                                            <select class="browser-default custom-select mb-4">
                                            <option value="" disabled>Elige</option>
                                            <option value="1" selected>Mastercard</option>
                                        </select>
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>
                                            
                                            <input class="form-control mb-4" type="month" value="2011-08" id="example-month-input">
                                        </label>

                                    </div>
                                    <div class="col">
                                        <input type="number" id="defaultContactFormName" class="form-control mb-4" placeholder="CVV">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>
                                            Nombre
                                            <input type="text" id="defaultContactFormName" class="form-control mb-4" placeholder="">
                                        </label>
                                    </div>
                                    <div class="col">
                                        <label>
                                            Apellidos
                                            <input type="text" id="defaultContactFormName" class="form-control mb-4" placeholder="">
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
        <footer class="text-center navbar-dark info-color d-flex align-items-center justify-content-center" style="height: 90px">
            <p class="text-white">IES Leonardo Da Vinci - 2019</p>
        </footer>

        <!-- final div img-->  
    </div>


</body>
</html>


