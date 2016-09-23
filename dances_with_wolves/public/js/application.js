$(document).ready(function() {

  $('.question-comment-form').hide();
  $('.answer-comment-container').hide();

  $('.new-question-comment-form').on('click', function(event){
    event.preventDefault();

    var $button = $(this);

    var url = $button.find('form').attr('action');
    // var method = $button.find('form').attr('method');

    var request = $.ajax({
      url: url
    });

    request.done(function(response) {
      $('#post-question-comment-button').hide();
      $('#new-question-comment').html(response);
    });
  });

  $('#new-question-comment').on('submit', '.question-comment-form', function(event){
    event.preventDefault();

    var $button = $(this);

    var method = $button.attr('method');
    var url = $button.attr('action');
    var data = $button.serialize();

    var request = $.ajax({
      method: method,
      url: url,
      data: data
    });

    request.done(function(response){
      $('#question-comment-table').append(response);
      $button.trigger('reset');
      $button.hide();
      $button.parent().closest('div').first().find('#post-question-comment-button').show();
    })
  });

  $('.post-answer-form').on('submit', function(event){
    event.preventDefault();

    var $button = $(this);
    var url = $button.find('form').attr('action');

    var request = $.ajax({
      url: url
    });

    request.done(function(response){
      $('#post-answer-button').hide();
      $('#answer-list').prepend(response);
    });
  });

  $('#answer-list').on('submit', '.new-answer', function(event){
    event.preventDefault();

    var $button = $(this);
    var url = $button.attr('action');
    var method = $button.attr('method');
    var data = $button.serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response){
      $button.hide();
      $('.answer-list').append(response);
    });
  });


  $('.new-answer-comment-form').on('click', '#answer-comment', function(event){
    event.preventDefault();

    var $form = $(this);
    // console.log($form);
    var url = $form.attr('action');
    console.log(url)
    var request = $.ajax({
      url: url,
      method: "GET"
    });

    request.done(function(response) {
      console.log(response)
      $form.hide();
      $form.parent().parent().append(response);
    });
  });

  $('.answer-comment-list').on('submit', '.answer-comment-form', function(event){
    event.preventDefault();

    var $button = $(this);
    // console.log($button)
    var method = $button.attr('method');
    var url = $button.attr('action');
    var data = $button.serialize();

    var request = $.ajax({
      method: method,
      url: url,
      data: data
    });

    request.done(function(response){
      // debugger
      // console.log(response);
      $button.parent().closest('article').children('table').last().append(response);
      // $button.closest('article').last('table').append(response);
      $button.parent().siblings('.new-answer-comment-form').children().show();
      $button.trigger('reset');
      $button.hide()
    })
});

});
