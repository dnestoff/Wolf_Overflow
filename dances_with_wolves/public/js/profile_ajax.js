$(document).ready(function(){
  $('#profile-page-container').on('click','#question-expand', function(event){
    event.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
    })
    .done(function(response) {
      ;
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });


  })
})
