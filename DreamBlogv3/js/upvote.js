$('span.upvote-action').click(function() {
    

    the_id = $(this).attr('data-post-id');
    var badge = $(this).siblings('.badge');
    
    $.ajax({
            type: "POST",
            data: "action=upvote&id=" + the_id,
            url: "upvote.php",
            dataType: 'json',
            success: function (data) {
                var votes = data[0];
                badge.text(votes);
            
            },
            error: function () {
                alert("Error");
            }
        });
    });
    $('span.downvote-action').click(function() {
         

        the_id = $(this).attr('data-post-id');
        var badge = $(this).siblings('.badge');

        $.ajax({
                type: "POST",
                data: "action=downvote&id=" + the_id,
                url: "upvote.php",
                dataType: 'json',
                success: function (data) {
                   
                    var votes = data[0];
                    badge.text(votes);

                },
                error: function () {
                    alert("Error");
                }
            });
    });



