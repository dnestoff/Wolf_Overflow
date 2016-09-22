$(document).ready(function() {

  $('.question-comment-form').hide();

  $('.new-question-comment-form').on('click', function(event){
    event.preventDefault();

    var $button = $(this);

    var url = $button.find('form').attr('action');
    var method = $button.find('form').attr('method');

    var request = $.ajax({
      url: url
    });

    request.done(function(response) {
      $('#post-question-button').hide();
      $('#new-question-form').html(response);
    });
  });

  $('#new-question-form').on('submit', '.question-comment-form', function(event){
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

});
