$(document).ready(function() {
  $('#login-toolbar').on('click', '#login-button', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
    })
    .done(function(response) {
      $('#session-box').html(response).fadeToggle(300)
    });
  });

  $('#login-toolbar').on('click', '#register-button', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
    })
    .done(function(response) {
      $('#session-box').html(response).fadeToggle(300)
    });
  });

  $('#login-toolbar').on('click', '#logout-button', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("href"),
    })
    .done(function(response) {
      $('#login-toolbar').html(response);
      $('#session-box').fadeOut(300);
    });
  });

  $('#session-box').on('submit', '#login-form', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
    })
    .done(function(response) {
      $('#login-toolbar').html(response);
      $('#session-box').fadeOut(300);
    })

    .fail(function() {
      $('#login-container').prepend("<p class='error-message'>Email or password incorrect.</p>")
    })

  });

  $('#session-box').on('submit', '#register-form', function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
    })
    .done(function(response) {
      $('#login-toolbar').html(response);
      $('#session-box').fadeOut(300);
    })
    .fail(function() {
      $('#register-container').prepend("<p class='error-message'>Username, email or password incorrect.</p>")
    })

  });

});


