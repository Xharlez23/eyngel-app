// Función para iniciar el cronómetro y mostrar el botón después de 2 minutos
$(document).on('click', '.miButton', function () {
    var idMin = $(this).data('min');
    var idVideo = $(this).data('video');
    var idUsuario = $(this).data('usuario');
    var duraccion = $(this).data('duraccion');
    var idNavegador = $(this).data('navegador');
    $.ajax({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        url: '/validar-prueba/' + idVideo,
        type: 'PUT',
        data: {
            idMin: idMin,
            idVideo: idVideo,
            idUsuario: idUsuario,
            duraccion: duraccion,
            idNavegador: idNavegador
        },
        success: function (response) {
            alert(response.mensaje);
            history.back();
        },
        error: function (xhr, status, error) {
            alert(error);
            history.back();
        }
    })
});
