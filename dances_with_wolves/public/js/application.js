$(document).ready(function() {

  $('.question-comment-form').hide();
  // $('.answer-comment-container').hide();

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


  // $('#answer-comment-list').on('submit', '.new-answer-comment-form', function(event){
  //   event.preventDefault();
  //
  //   var $button = $(this);
  //   // console.log($button);
  //   var url = $button.find('form').attr('action');
  //
  //   var request = $.ajax({
  //     url: url,
  //     method: "GET"
  //   });
  //
  //   request.done(function(response) {
  //     $('#post-answer-comment-button').hide();
  //     $('#new-answer-comment').html(response);
  //   });
  // });

  // $('#new-answer-comment').on('submit', '.answer-comment-form', function(event){
  //   event.preventDefault();
  //
  //   var $button = $(this);
  //   var method = $button.attr('method');
  //   var url = $button.attr('action');
  //   var data = $button.serialize();
  //
  //   var request = $.ajax({
  //     method: method,
  //     url: url,
  //     data: data
  //   });
  //
  //   request.done(function(response){
  //     console.log(response);
      // var article = $button.parent().parent().first().children().first().next.clone();
      // article.find('td:nth-child(4)').text(response)
  //     $('#question-comment-table').append(response);
  //     $button.trigger('reset');
  //     $button.hide();
  //     $button.parent().closest('div').first().find('#post-question-comment-button').show();
    // })
// });

});
