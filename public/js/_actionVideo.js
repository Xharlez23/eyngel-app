
$(document).ready(function () {

    var contet_notify = document.getElementById("content-notify-site");
    contet_notify.style.display = "none";

    var contet_notify_mobile = document.getElementById("content-notify-mobile");
    contet_notify_mobile.style.display = "none";

    $.ajax({
        url: '/post-count',
        type: 'GET',
        success: function (response) {
            // Aquí puedes manejar la respuesta del servidor
            var likesPublicaciones = response.likes;
            // Recorre el objeto con los likes de las publicaciones
            for (var publicacionId in likesPublicaciones) {
                var likes = likesPublicaciones[publicacionId];
                // Actualiza la interfaz de usuario con la cantidad de likes
                $('#likes-count-' + publicacionId).text(likes + " Increible");
            }
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });

    $.ajax({
        url: '/notificaciones',
        type: 'GET',
        success: function (response) {
            var notificaciones = response.notificaciones;
            var len = notificaciones.length;
            $('#count-notify-site').text(len);
            $('#count-notify-mobile').text(len);
        },
        error: function (xhr, status, error) {
            console.log('Error al obtener las notificaciones:', error);
        }
    });
});

$(document).on('click', '.edit_post', function () {

    var id = $(this).data('idpost');
    var descripcion = $(this).data('description');

    $('#modal-edit-post').find('.idPostEdit').val(id);
    $('#modal-edit-post').find('.pu_descripcion').val(descripcion);

});

$(document).on('click', '.edit-post-db', function () {

    var id = $('.idPostEdit').val();
    var descripcion = $('.pu_descripcion').val();

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: '/post-edit',
        type: 'PUT',
        data: {
            id: id,
            descripcion: descripcion,
        },
        success: function (response) {
            location.reload();
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    });
});


$(document).on('click', '.button-check', function () {

    var url = '/post-action';

    var auth = $(this).data('auth');
    var video = $(this).data('video');

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'POST',
        data: {
            auth: auth,
            video: video,
        },
        success: function (response) {
            console.log(response.likes);
            $('#button-action-' + video).addClass('button-check-delete');
            $('#button-action-' + video).removeClass('button-check');
            $('#likes-count-' + video).text(response.likes + " Increible");
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })
});

$(document).on('click', '.button-check-delete', function () {

    var url = '/post-action-delete';

    var auth = $(this).data('auth');
    var video = $(this).data('video');

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'DELETE',
        data: {
            auth: auth,
            video: video,
        },
        success: function (response) {
            $('#button-action-' + video).addClass('button-check');
            $('#button-action-' + video).removeClass('button-check-delete');
            $('#likes-count-' + video).text(response.likes + " Increible");
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })
});

$('.show_post').click(function () {
    var id = $(this).data('id');
    $('#modal-d-post').find('.miInput').val(id);
});

$(document).on('click', '.d-cuenta', function () {

    var url = '/post-delete';

    var id = $('#miInput').val();

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'DELETE',
        data: {
            id: id
        },
        success: function (response) {
            window.location.href = "/";
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })
});

function obtenerNotificacionesComentarios() {
    var name = document.getElementById("name-profile-notify");
    $.ajax({
        url: '/notificaciones',
        type: 'GET',
        success: function (response) {
            var html = '';
            // Manejar las notificaciones recibidas en la respuesta
            var notificaciones = response.notificaciones;
            var img = document.getElementById("img-profile-notify");
            // Mostrar las notificaciones al usuario (puedes ajustar la lógica según tu diseño)
            notificaciones.forEach(function (notificacion) {
                html += "<a class='d-flex gap-3 comment-notify mt-2 p-2 align-items-center' data-user='"+notificacion.id+"' data-post='"+notificacion.pu_id+"' style='height: 40px !important;' href='" + name.textContent + '/post/' +notificacion.pu_id + "' >";
                html += "<img style='width:40px; height:40px; object-fit: contain;' src='" + notificacion.u_img_profile + "' alt=''>";
                if (notificacion.poac_action == 1) {
                    html += "<p class='text-default mt-3' style='line-height: 15px'>" + notificacion.u_nombre_usuario + " le dio increible a tu publicación</p>";
                } else if (notificacion.poac_action == 2) {
                    html += "<p class='text-default mt-3' style='line-height: 15px'>" + notificacion.u_nombre_usuario + " realizó un comentario</p>";
                } else if(notificacion.poac_action == 3){
                    html += "<p class='text-default mt-3' style='line-height: 15px'>" + notificacion.u_nombre_usuario + " ahora te visita</p>";
                }
                html += "</a>";
            });

            $('#content-notify-site').html(html);
            $('#content-notify-mobile').html(html);

            var len = notificaciones.length;
            $('#count-notify-site').text(len);
            $('#count-notify-mobile').text(len);

        },
        error: function (xhr, status, error) {
            console.log('Error al obtener las notificaciones:', error);
        }
    });
}

var contador = 0;

$(document).on('click', '.ver-notificaciones-btn', function () {

    var contet_notify = document.getElementById("content-notify-site");
    contet_notify.style.display = "block";

    var contet_notify_mobile = document.getElementById("content-notify-mobile");
    contet_notify_mobile.style.display = "block";

    contador++;

    console.log(contador);

    if (contador == 2) {
        contet_notify.style.display = "none";
        contet_notify_mobile.style.display = "none";
        console.log(contador);
        contador = 0;
    }

    obtenerNotificacionesComentarios();
});

$(document).on('click', '.comment-notify', function () {
    var url = '/post-most-notify';

    var user = $(this).data('user');
    var post = $(this).data('post');

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: url,
        type: 'PUT',
        data: {
            user: user,
            post: post,
        },
        success: function (response) {
            console.log("ok update")
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })
})


