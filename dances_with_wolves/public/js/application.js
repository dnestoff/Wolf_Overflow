$(document).ready(function() {

  $('#comment-question').on('submit', '.question-comment-form', function(event){
    event.preventDefault();
    // console.log('here');
    // var comment = $('#comment-text').val();
    // var commentAuthor = $('input[name="username"]').val();
    // console.log(commentAuthor);
    //
    // var commentList = $('#question-comment-list').find('tr').first().clone();
    // // console.log(commentList);
    // commentList.find('td:nth-child(6)').html(comment);
    // commentList.find('td:nth-child(7)').html(commentAuthor);
    // $('#question-comment-table').append(commentList).html();
    // $(this).trigger('reset');

    console.log($(this));

    $.ajax({

    })
  });
});
