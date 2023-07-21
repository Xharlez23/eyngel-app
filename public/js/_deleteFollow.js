$(document).on('click', '.bn-follow-delete', function () {
    var url = '/delete-follow-user';

    var userAuth = $(this).data('auth');
    var userFollow = $(this).data('tocar');

    console.log(userAuth);
    console.log(userFollow);
    
    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'DELETE',
        data: {
            userAuth: userAuth,
            userFollow: userFollow
        },
        success: function (response) {
            location.reload();
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })

});