/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

 import CreditCard from './JS/creditcard.js';
 let creditcard = new CreditCard();

function validar(){
//    var creditcard=new Creditcard();
    var numeroTarjeta=document.getElementById('numeroTarjeta');
    var fecha=document.getElementById('example-month-input');
    var cvv=document.getElementById('cvv');
     //&& creditcard.isExpirationDateValid()
    if(creditcard.isValid(numeroTarjeta) && isSecurityCodeValid(numeroTarjeta,cvv)){
        alert("sii");
        
    }else{
        alert("Error en tarjeta crédito");
        return false;
    }
}

