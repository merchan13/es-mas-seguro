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

function contactViaCheck(contactVia) {
    document.getElementById('if_via_1').style.display = 'none';
    document.getElementById('if_via_2').style.display = 'none';
    document.getElementById('if_via_3').style.display = 'none';
    document.getElementById('contact_via_1_label').style.color = '#828282';
    document.getElementById('contact_via_2_label').style.color = '#828282';
    document.getElementById('contact_via_3_label').style.color = '#828282';

    document.getElementById('if_via_' + contactVia).style.display = 'block';
    document.getElementById('contact_via_' + contactVia + '_label').style.color = '#F85A16';
}

function insuranceTypeCheck(type) {
  if (document.getElementById(type + '_check').checked) {
    document.getElementById(type + '_check_label').style.color = '#F85A16';
  }
  else document.getElementById(type + '_check_label').style.color = '#828282';
}
