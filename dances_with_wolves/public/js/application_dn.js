$(document).ready(function() {
  upvoteImageUrlBlack = 'https://image.freepik.com/free-icon/thumbs-up-hand-outline_318-41813.jpg'
  downvoteImageUrlBlack = 'https://image.freepik.com/free-icon/thumbs-down-hand-outline_318-41753.png'
  upvoteImageUrlRed = 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQQNuq1aPO7gTLJQhWKzYhY2AsxhLcrIgnEwjzdYczepdzuZeztnQ';
  downvoteImageUrlRed = 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQnhEA0mRKeAP1RCA-oXzrzobsL0ERbtHs1m-BgjGSUPleO_hSRypJnTeg';

  $(".upvote-button").submit( function(event) {
    event.preventDefault();
    $form = $(this);
    $image = $form.find('input[type="image"]');

    request = $.ajax({
      method: $form.attr("method"),
      url: $form.attr("action")
    });

    request.done( function(response) {
      $voteTotal = $form.closest("tr").find(".vote-total").text(response.votes);
      console.log("Vote has been added");
      if (response.vote_id != null) {
        $image.attr('src', upvoteImageUrlRed);
      } else {
        $image.attr('src', upvoteImageUrlBlack);
      };
    });
  });

  $(".downvote-button").submit( function(event) {
    event.preventDefault();
    $form = $(this);
    $image = $form.find('input[type="image"]');

    request = $.ajax({
      method: $form.attr("method"),
      url: $form.attr("action")
    });

    request.done( function(response) {
      $voteTotal = $form.closest("tr").find(".vote-total").text(response.votes);
      console.log("Vote has been added");
      if (response.vote_id != null) {
        $image.attr('src', downvoteImageUrlRed);
      } else {
        $image.attr('src', downvoteImageUrlBlack);
      };
    });
  });

  $(".delete-comment").submit( function(event) {
    event.preventDefault();
    $form = $(this)
    console.log("this");

    request = $.ajax({
      method: 'DELETE',
      url: $form.attr("action"),
      data: $form.serialize()
    });

    request.done( function(response) {
      $form.closest("table").remove();
    });

  });

  $(".edit-comment").click( function(event) {
    event.preventDefault();
    var $editLink = $(this);
    console.log("this");
    var $url = $editLink.attr("href");
    console.log($url);

    request = $.ajax({
      method: 'GET',
      url: $url
    });

    request.done( function(response) {
      console.log(response);
      $editLink.closest("table").append('<tr><td>'+response+'</td></tr>');

    });

    var $editURL = $editLink.closest("table").children().last().find("form").attr("action");
    console.log($editUrl);
    // request = $.ajax({
    //   method: 'PUT',
    //   url: $url
    // });

    // request.done( function(response) {
    //   console.log(response);
    //   $editLink.closest("table").append('<tr><td>'+response+'</td></tr>');

    // });

  });




  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
