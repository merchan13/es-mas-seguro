// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  if ($('#bot-content-request').length > 0)
  {
    $('#requestModal').modal('show');
  }
  else if ($('#bot-content-complaint').length > 0)
  {
    $('#complaintModal').modal('show');
  }
});

function blockCharacters(input){
  var stripped = input.value.replace(/[^a-zA-Záäéëíïóöúüñ /,.:;(-=)0-9!¡$%*\"¿+?<>\s]+/gi, '');
  input.value = stripped;
}

function validateTextArea(textArea){
    var regex = new RegExp("^[a-zA-Záäéëíïóöúüñ \/,.:;(\-\=)0-9!¡$%*\"¿\+?<>]+");

    var match = regex.test(textArea.value);

    if (match == false && textArea.value != "") {
      textArea.style.borderColor = "red";
    }
    else if (match == false && textArea.value == "") {
      textArea.style.borderColor = "#ccc";
    }
    else {
      textArea.style.borderColor = "#00e500"
    }
}

function validateTextField(textField){
    var valid = textField.checkValidity();

    if (valid == false && textField.value != "") {
      textField.style.borderColor = "red";
    }
    else if (textField.value == "") {
      textField.style.borderColor = "";
    }
    else {
      textField.style.borderColor = "#00e500"
    }
}

function contactViaCheck(contactVia) {
    document.getElementById('contact_via_1_label').style.color = '#828282';
    document.getElementById('contact_via_2_label').style.color = '#828282';
    document.getElementById('contact_via_3_label').style.color = '#828282';

    document.getElementById('contact_via_' + contactVia + '_label').style.color = '#F85A16';
}

function insuranceTypeCheck(type) {
  if (document.getElementById(type + '_check').checked) {
    document.getElementById(type + '_check_label').style.color = '#F85A16';
  }
  else document.getElementById(type + '_check_label').style.color = '#828282';

  if (document.getElementById('ci_check').checked) {
    document.getElementById('cir_data_form').style.display = 'block';
    $('#cir_brand').attr("required", true);
    $('#cir_model').attr("required", true);
    $('#cir_year').attr("required", true);
    $('#cir_price').attr("required", true);
  }
  else {
    document.getElementById('cir_data_form').style.display = 'none';
    $('#cir_brand').removeAttr("required");
    $('#cir_model').removeAttr("required");
    $('#cir_year').removeAttr("required");
    $('#cir_price').removeAttr("required");
  }
}

///
// CLICKS
///
$("#help").click(function(evt) {
  ga('set','page','/necesitoayuda.html');
  ga('send', 'pageview');
});

$("#asegurate-nav").click(function(evt) {
  ga('set','page','/asegurateform.html');
  ga('send', 'pageview');
});

$("#asegurate-header").click(function(evt) {
  ga('set','page','/asegurateform.html');
  ga('send', 'pageview');
});

$("#asegurate-steps").click(function(evt) {
  ga('set','page','/asegurateform.html');
  ga('send', 'pageview');
});

$("#asegurate-waywf").click(function(evt) {
  ga('set','page','/asegurateform.html');
  ga('send', 'pageview');
});

$("#reclamo-nav").click(function(evt) {
  ga('set','page','/reclamoform.html');
  ga('send', 'pageview');
});

$("#reclamo-header").click(function(evt) {
  ga('set','page','/reclamoform.html');
  ga('send', 'pageview');
});

$("#reclamo-section").click(function(evt) {
  ga('set','page','/reclamoform.html');
  ga('send', 'pageview');
});

$("#reclamo-waywf").click(function(evt) {
  ga('set','page','/reclamoform.html');
  ga('send', 'pageview');
});

///
// WAYPOINTS
///
var header_waypoint = new Waypoint({
  element: document.getElementById('gtco-header'),
  handler: function(direction) {
    ga('set','page','/header.html');
    ga('send', 'pageview');
  }
})

var steps_waypoint = new Waypoint({
  element: document.getElementById('masseguro-steps'),
  handler: function(direction) {
    ga('set','page','/steps.html');
    ga('send', 'pageview');
  },
  offset: 150
})

var why_waypoint = new Waypoint({
  element: document.getElementById('masseguro-why'),
  handler: function(direction) {
    ga('set','page','/why.html');
    ga('send', 'pageview');
  },
  offset: 80
})

var reclamos_waypoint = new Waypoint({
  element: document.getElementById('masseguro-reclamos'),
  handler: function(direction) {
    ga('set','page','/reclamos.html');
    ga('send', 'pageview');
  },
  offset: 200
})

var app_waypoint = new Waypoint({
  element: document.getElementById('masseguro-app'),
  handler: function(direction) {
    ga('set','page','/app.html');
    ga('send', 'pageview');
  },
  offset: 100
})

var seguros_waypoint = new Waypoint({
  element: document.getElementById('masseguro-seguros'),
  handler: function(direction) {
    ga('set','page','/aseguradoras.html');
    ga('send', 'pageview');
  },
  offset: 200
})
