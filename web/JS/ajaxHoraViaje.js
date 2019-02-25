function muestraFecha() {
    
    var xmlhttp;
    
    var origen=document.getElementById("origen").value;
    var destino=document.getElementById("destino").value;
    //alert(origen+"--"+destino);
    if (destino === "") {
        document.getElementById("fecha").innerHTML = "";
        return;
    }
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            
            document.getElementById("fecha").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET", "/autobus_obb/ControladorCargaFechasViaje?origen="+origen+"&destino="+destino+"&idAjax=1", true);
    xmlhttp.send();
}// muestraDestinos