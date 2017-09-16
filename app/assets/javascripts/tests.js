var init_test_form;

init_test_form = function() {

  $('#new-test-form').on('ajax:success', function(event, data, status) {

    $('#testModal').modal('hide');

    $('#new-test-form').find('input:text').val('');

    $('#new-test-form').find('textarea').val('');

    var alert_html = '<div id="test-error"></div>';
    var alert_html2 = '<div id="test-error-2"></div>';

    $('#test-error').replaceWith(alert_html);
    $('#test-error-2').replaceWith(alert_html2);

    init_test_form();
  });

  $('#new-test-form').on('ajax:error', function(event, xhr, status, error) {

    if (error == 'Bad Request') {

      alert_html = '<div id="test-error" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';
      alert_html2 = '<div id="test-error-2" class="alert alert-danger col-md-12" style="float:none; text-align:center; font-size:14px;"><strong>¡Oh no!</strong><br>Ocurrió un error, por favor verifique que introdujo todos los datos requeridos.</div>';

      $('#test-error').replaceWith(alert_html);
      $('#test-error-2').replaceWith(alert_html2);
    }
  });
}

$(document).ready(function() {

  init_test_form();

})
