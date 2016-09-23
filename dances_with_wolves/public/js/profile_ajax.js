$(document).ready(function(){
  $('#profile-page-container').on('click','#question-expand', function(event){
    event.preventDefault();
    console.log($(this).attr('href'));

    $.ajax({
      url: $(this).attr('href'),
    })

    .done(function(response) {
      $('#user-questions-table').html(response);
    })
    .fail(function() {
      console.log("error");
    })


  })
})
