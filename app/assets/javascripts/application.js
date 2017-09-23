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
  if ($('#bot-content').length > 0){
    $('#requestModal').modal('show');
  }
});

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
