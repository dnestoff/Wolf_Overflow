$(document).ready(function(){
  $('#profile-page-container').on('click','#question-expand', function(event){
    event.preventDefault();
    console.log($(this).attr('href'));

    $.ajax({
      url: $(this).attr('href'),
    })

    .done(function(response) {
      $('#user-questions-table').html(response);
      $('#question-expand').hide();
    })
    .fail(function() {
      console.log("error");
    })


  });
  $('#profile-page-container').on('click','#answer-expand', function(event){
    event.preventDefault();
    console.log($(this).attr('href'));

    $.ajax({
      url: $(this).attr('href'),
    })

    .done(function(response) {
      $('#user-recent-answers-table').html(response);
      $('#answer-expand').hide();
    })
    .fail(function() {
      console.log("error");
    })


  });

  $('#profile-page-container').on('click','#comment-expand', function(event){
    event.preventDefault();
    console.log($(this).attr('href'));

    $.ajax({
      url: $(this).attr('href'),
    })

    .done(function(response) {
      $('#user-comments-table').html(response);
      $('#comment-expand').hide();
    })
    .fail(function() {
      console.log("error");
    })


  });

});
