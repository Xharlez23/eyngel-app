$(document).on('click', '.miBoton', function () {
    var idMin = $(this).data('min');
    var idVideo = $(this).data('video');
    var idUsuario = $(this).data('usuario');
    var idNavegador = $(this).data('navegador');
    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: '/registro-paquete-vistas',
        type: 'POST',
        data: {
            idUsuario: idUsuario,
            idMin: idMin,
            idNavegador: idNavegador,
            idVideo: idVideo,
        },
        success: function (response) {
            alert(response.mensaje);
            window.location.reload();
        },
        error: function (xhr, status, error) {
            alert('Error al registrar');
        }
    })
});
