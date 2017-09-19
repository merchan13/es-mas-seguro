var init_request_form;

var hide_spinner_request = function(){
  $('#spinner-request').hide();
}

var show_spinner_request = function(){
  $('#spinner-request').show();
}

init_request_form = function() {
  $('#new-request-form').on('ajax:before', function(event, data, status){
    show_spinner_request();
  });

  $('#new-request-form').on('ajax:after', function(event, data, status){
    hide_spinner_request();
  });

  $('#new-request-form').on('ajax:success', function(event, data, status){
    ga('set','page','/contratosubmited.html');
    ga('send', 'pageview');

    hide_spinner_request();

    $('#requestModal').modal('hide');
    $('#successModal').modal('show');

    $('#new-request-form').find('input:text').val('');
    $('#new-request-form').find('textarea').val('');
    $('#new-request-form').find('input:checkbox').removeAttr('checked');
    $('#new-request-form').find('input:radio').removeAttr('checked');

    document.getElementById('contact_via_1_label').style.color = '#828282';
    document.getElementById('contact_via_2_label').style.color = '#828282';
    document.getElementById('contact_via_3_label').style.color = '#828282';
    document.getElementById('hi_check_label').style.color = '#828282';
    document.getElementById('ci_check_label').style.color = '#828282';
    document.getElementById('fi_check_label').style.color = '#828282';
    document.getElementById('li_check_label').style.color = '#828282';

    var alert_html = '<div id="request-error"></div>';
    var alert_html2 = '<div id="request-error-2"></div>';

    $('#request-error').replaceWith(alert_html);
    $('#request-error-2').replaceWith(alert_html2);

    if ($('#bot-content').length > 0){
      window.location.replace("http://www.esmasseguro.com");
    }

    init_request_form();
  });

  $('#new-request-form').on('ajax:error', function(event, xhr, status, error){
    if (error == 'Bad Request'){
      alert_html = '<div id="request-error" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';
      alert_html2 = '<div id="request-error-2" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';

      $('#request-error').replaceWith(alert_html);
      $('#request-error-2').replaceWith(alert_html2);
    }
  });
}

$(document).ready(function () {
  init_request_form();
})
