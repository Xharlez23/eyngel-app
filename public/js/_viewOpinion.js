

$('.post').click(function () {
    
    var id = $(this).data('id');

    $('#opinion').find('.idVideoPo').val(id);

    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: '/post-view-comment',
        type: 'GET',
        data: { id: id },
        success: function (response) {
            var datos = response;
            var html = '';

            datos.forEach(function (dato) {
                
                var fechaPost = dato.poc_timestamp;
                var fechaActual = new Date();

                var fechaAnteriorObj = new Date(fechaPost);

                var diferenciaMilisegundos = fechaActual - fechaAnteriorObj;

                var minutosTranscurridos = Math.floor(diferenciaMilisegundos / (1000 * 60));

                html += '<div class="content-comment">';
                html += '<div class="profile-comment">'
                html += '<div class="profile-info d-flex gap-3">';
                html += '<img class="img-profile-min" src="' + dato.u_img_profile + '" alt="img-profile">';
                html += '<a class="post-title-user mt-2" href="#" style="height: 100%;font-size: 13px; text-transform:capitalize "><strong>' + dato.u_nombre_usuario + '</strong></a>';
                html += '</div>';
                html += '<p style="line-height:0px;font-size: 12px; color: #373435; padding-left: 55px;height:100%;"><small>'+ minutosTranscurridos + " minutos " +'</small></p>';
                html += '<p class="profile-descripcion" style="font-size: 13px; font-weight: 400; padding-left: 55px; height:100%;">' + dato.poc_comment + '</p>';
                html += '</div>';
                html += '</div>';
            });

            $('.content-opinion').html(html);

        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    });

});

