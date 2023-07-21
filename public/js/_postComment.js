$(document).on('click', '.btn-opinar', function () {

    var post = $('#id').val();

    //console.log(post);
    
    if(post == "" || post == null){
        post = $(this).data('video');
        console.log(post);
    }

    var url = '/post-commet';

    var user = $(this).data('user');
    //console.log(user);
    var comment = document.getElementById("opinion-text").value;

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'POST',
        data: {
            post: post,
            user: user,
            comment: comment
        },
        success: function (response) {
            window.location.reload();
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })

});