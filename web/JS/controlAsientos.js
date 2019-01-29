/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var q = document.querySelectorAll('input[type^="checkbox"]');
var wpo = document.querySelectorAll('input[type^="checkbox"]');
//console.log(q);
q.forEach(function (element) {
    element.addEventListener("change", function () {
        a(event)
    })
});

wpo.forEach(function (element) {
    element.addEventListener("click", function () {
        a(event)
    })
});
//    q.forEach(function(element){element.addEventListener("click",function(){contar(event)})});

//$(".contenedor").click(function(evt){alert(evt)});
function a(event) {
//    alert(event.target.parentNode);
//    alert(event);
    var a = document.querySelectorAll('input[type^="checkbox"]');
    var cont = 0;
    var papa = event.target.parentNode;
    var abuelo = papa.parentNode;
//    console.log(abuelo.chil);
    //alert()
//    console.log(papa.className);
    var hijos = papa.querySelectorAll('input[type^="checkbox"]');
//    console.log(hijos);
    //puedo poer checkbox y al darle a uno descativar todos los check hijos menos él mismo
    // del padre del pulsado y así solo puede coger unp

//    a.forEach(function(eleme){if(eleme.value==)});
//    if (event.target.checked) {
//        hijos.forEach(function (hijo) { //para desahibilitar todos lo hermanos y así solo peude elgir uno, problemaal volver a dar click no habilita y habilita desahabilitados del servidor
//
//            if (hijo.checked) {
//                cont++;
//            }
//
//        });
//        if (cont > 1) {
//            return;
//        }
//        console.log(cont);
//    }
    //limita el numero de checkbox hermanos a 1
    var limit = 1;
    $('[name*="asiento"]').on('click', function (evt) {
        if ($(this).siblings(':checked').length >= limit) {
            this.checked = false;
            //console.log($(this).siblings(':checked'));
        }
        if (abuelo.children(':checked')) {
            
        }
    });

//    $(".contenedor").click(function(evt){alert(evt)});
//    var limit = 1;
//    $('.checkmark').on('click', function (evt) {
//        if ($(this).siblings(':checked').length >= limit) {
//            this.checked = false;
//            //console.log($(this).siblings(':checked'));
//        }
//    });

//    //var $checkboxes = $('input[type="checkbox"]');
//    var aa=$(this).siblings(':checked').length;
////    var $checkboxes=aa.siblings('input[type="checkbox"]');
//    console.log("sadasd"+aa);
//    $checkboxes.click(function(){
//        var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
//        // $('#count-checked-checkboxes').text(countCheckedCheckboxes);
//        if (countCheckedCheckboxes > 2) {
//        this.checked = false;
//    }
//        console.log("val nue"+countCheckedCheckboxes);
//    });
    
//    console.log("wewew"+$(this).find('.contenedor').children(':checked').length);

    //console.log($(this).parent().find('input.checkbox.attr:checked').length);

//    var lena = 0;
//
//    $('.contenedor').find('input').each(function () {
//
//        if ($(this).find('[name="vehicle1"]').is(':checked'))
//        {
//            lena++;
//        }
//
//    });
//    console.log("lena"+lena);

//$("input:checkbox").click(function(){
//    if ($("input:checkbox:checked").length > 3){
//      return false;
//   }
//});

//    $(document).click(function (event) {
//        if ($(event.target).parents('.asientos').length > 0) {
//            $('[name="vehicle1"]').on('change', function (evt) {
//                if ($(event.target).siblings(':checked').length >= limit) {
//                    this.checked = false;
//                }
//            });
//        }
//    });

    //para deshibiltar los checkbox de los otros pasajeros del mismo asiento
    //funcional
    a.forEach(function (eleme) {
        if (event.target !== eleme) {
            if (eleme.value === event.target.value) {
                if (event.target.checked) {
//                if (eleme.disabled) {
//                    eleme.removeAttribute("disabled");
//                } else {
//                    eleme.disabled = "disabled"
//                }

                    eleme.disabled = "disabled"
                } else if (event.target.checked === false) {
                    eleme.removeAttribute("disabled");
                    //eleme.checked=true;
                }
                console.log(eleme);
            }
            ;

        }
    })






}
//$(document).ready(function(){
//        $('input[type="checkbox"]').click(function(){
//            if($(this).prop("checked") == true){
//                alert("Checkbox is checked.");
//            }
//            else if($(this).prop("checked") == false){
//                alert("Checkbox is unchecked.");
//            }
//        });
//    });
//    
//    var $checkboxes = $('input[type="checkbox"]');
//        
//    $checkboxes.change(function(){
//        var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
//        // $('#count-checked-checkboxes').text(countCheckedCheckboxes);
//        if (countCheckedCheckboxes > 1) {
//        this.checked = false;
//    }
//        console.log("val nue"+countCheckedCheckboxes);
//    });
//    
//function contar(event){
//    var a=document.querySelectorAll('input[type^="radio"]');
//    
//    var papa=event.parentNode;
//    var hijos=papa.querySelectorAll('input[type^="radio"]');
//    if(hijos.length >= 1){
//        
//    }
//    
//    a.forEach(function(eleme){
//        if (event.target !== eleme) {
//            if (eleme.value==event.target.value) {
//                if (eleme.disabled) {
//                    eleme.removeAttribute("disabled");
//                }else{eleme.disabled="disabled"}
//            console.log(eleme);
//            }
//
//    }})
//}


//
//hijos.forEach(function(hijo){ //para desahibilitar todos lo hermanos y así solo peude elgir uno, problemaal volver a dar click no habilita y habilita desahabilitados del servidor
//                
//                if (event.target !== hijo) {
//                    if (!hijo.disabled) {
//                        hijo.disabled="disabled"; 
//                    }else{hijo.removeAttribute("disabled");}
//                    
//                }
//            });