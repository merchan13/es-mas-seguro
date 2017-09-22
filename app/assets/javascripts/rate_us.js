var init_rate_form;

var hide_spinner_rate = function(){
  $('#spinner-rate').hide();
}

var show_spinner_rate = function(){
  $('#spinner-rate').show();
}

init_rate_form = function() {
  $('#new-request-form').on('ajax:before', function(event, data, status){
    show_spinner_rate();
  });

  $('#new-request-form').on('ajax:after', function(event, data, status){
    hide_spinner_rate();
  });

  $('#new-request-form').on('ajax:success', function(event, data, status){
    //ga('set','page','/contratosubmited.html');
    //ga('send', 'pageview');

    hide_spinner_rate();

    init_rate_form();
  });

  $('#new-request-form').on('ajax:error', function(event, xhr, status, error){
    if (error == 'Bad Request'){

    }
  });
}

$(document).ready(function () {
  init_rate_form();
})
