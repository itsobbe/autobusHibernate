function muestraHora() {
    
    var xmlhttp;
    
    var fecha=document.getElementById("fecha").value;
    var origen=document.getElementById("origen").value;
    var destino=document.getElementById("destino").value;
    //alert(fecha);
    if (fecha === "") {
        document.getElementById("horaSalida").innerHTML = "";
        return;
    }
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            
            document.getElementById("horaSalida").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET", "/autobus_obb/ControladorCargaFechasViaje?fecha="+fecha+"&idAjax=2&origen="+origen+"&destino="+destino, true);
    xmlhttp.send();
}// muestraDestinos