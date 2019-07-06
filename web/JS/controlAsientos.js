/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var q = document.querySelectorAll('input[type^="checkbox"]');
var wpo = document.querySelectorAll('input[type^="checkbox"]');

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
function a(event) {
    var a = document.querySelectorAll('input[type^="checkbox"]');
    var cont = 0;
    var papa = event.target.parentNode;
    var abuelo = papa.parentNode;

    var hijos = papa.querySelectorAll('input[type^="checkbox"]');
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


    //para deshibiltar los checkbox de los otros pasajeros del mismo asiento
    //funcional
    a.forEach(function (eleme) {
        if (event.target !== eleme) {
            if (eleme.value === event.target.value) {
                if (event.target.checked) {

                    eleme.disabled = "disabled"
                } else if (event.target.checked === false) {
                    eleme.removeAttribute("disabled");
                }
                console.log(eleme);
            }
            ;

        }
    })
    }
