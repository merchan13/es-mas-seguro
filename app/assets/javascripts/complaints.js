var init_complaint_form;

init_complaint_form = function() {
  $('#new-complaint-form').on('ajax:success', function(event, data, status){
    $('#complaintModal').modal('hide');
    $('#apologiesModal').modal('show');
    $('#new-complaint-form').find('input:text').val('');
    $('#new-complaint-form').find('textarea').val('');

    var alert_html = '<div id="complaint-error"></div>';
    var alert_html2 = '<div id="complaint-error-2"></div>';

    $('#complaint-error').replaceWith(alert_html);
    $('#complaint-error-2').replaceWith(alert_html2);
    init_complaint_form();
  });

  $('#new-complaint-form').on('ajax:error', function(event, xhr, status, error){
    if (error == 'Bad Request'){
      alert_html = '<div id="complaint-error" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';
      alert_html2 = '<div id="complaint-error-2" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';

      $('#complaint-error').replaceWith(alert_html);
      $('#complaint-error-2').replaceWith(alert_html2);
    }
  });
}

$(document).ready(function () {
  init_complaint_form();
})
