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
    console.log($button);

    var method = $button.attr('method');
    console.log(method);

    var url = $button.attr('action');
    console.log(url);

    var data = $button.serialize();
    console.log(data);

    var request = $.ajax({
      method: method,
      url: url,
      data: data
    });

    request.done(function(response){
      $('#question-comment-table').append(response);
    })
  });

});
