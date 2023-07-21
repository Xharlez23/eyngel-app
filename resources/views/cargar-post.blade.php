@extends('layouts.app')

@section('content')
    <div class="w-100 mx-auto">
        <form action="{{ URL::to('/card-post-store') }}" method="post" enctype="multipart/form-data">
            @csrf
            @include('components.form-upload')
        </form>
    </div>
@endsection
@section('js')
    <script>
        /*Seleccion tipo de publicación*/
        var options = document.querySelectorAll("input[name=options]");
        var text_message = document.getElementById("text-message");
        var text_movie = document.getElementById("message-movie");
        var files1 = document.getElementById("files1");
        var files2 = document.getElementById("files2");

        const previewImage = document.getElementById('contenedorImg');
        const contenedorVideo = document.getElementById('contenedorVideo');

        files1.style.display = "none";
        files2.style.display = "none";
        text_movie.style.display = "none";

        contenedorVideo.style.display = "none";
        previewImage.style.display = "none";

        options.forEach(function(option) {
            option.addEventListener('change', function() {
                if (this.checked) {
                    if (option.value == "img") {
                        text_message.textContent =
                            "Has seleccionado la opción de publicación de contenido de solo imagen.";
                        files1.style.display = "block";
                        files2.style.display = "block";
                        previewImage.style.display = "none";
                        contenedorVideo.style.display = "none";
                        text_movie.style.display = "block";
                        text_movie.textContent = "Formatos permitidos .jpg .jpeg .png .webp";
                    } else if (option.value == "movie") {
                        text_message.textContent =
                            "Has seleccionado la opción de publicación de contenido de solo video.";
                        files1.style.display = "block";
                        files2.style.display = "block";
                        contenedorVideo.style.display = "block";
                        previewImage.src = "";
                        previewImage.style.display = "none";
                        text_movie.style.display = "block";
                        text_movie.textContent = "Duracción máxima de video: 2 minutos. Formatos permitidos .mp4 y .webp";
                    } else if (option.value == "text") {
                        text_message.textContent =
                            "¡Ohh maravilloso!, expresa lo que estas pensando";
                        files1.style.display = "none";
                        files2.style.display = "none";
                        previewImage.src = "";
                        contenedorVideo.style.display = "none";
                        previewImage.style.display = "none";
                        text_movie.style.display = "none";
                    }
                }
            })
        });
        /*Fin*/

        /*Limite duracción y tamaño*/
        var inputElement = document.querySelector('input[type=file]');

        inputElement.addEventListener('change', function() {
            var selectedFile = inputElement.files[0];

            // Validar el tamaño del archivo (60 MB máximo)
            if (selectedFile.size > 65 * 1024 * 1024) {
                alert('El tamaño del video no puede superar los 60 MB.');
                inputElement.value = ''; // Borrar el archivo seleccionado
                return;
            }

            // Crear un objeto de video para obtener su duración
            var video = document.createElement('video');
            video.src = URL.createObjectURL(selectedFile);

            video.addEventListener('loadedmetadata', function() {
                // Validar la duración del video (2 minutos máximo)
                if (video.duration > 120) {
                    alert('La duración del video no puede superar los 2 minutos.');
                    inputElement.value = ''; // Borrar el archivo seleccionado
                }

                // Liberar recursos del objeto de video
                URL.revokeObjectURL(video.src);
            });
        });
        /*Fin*/


        previewImage.style.display = "none";
        previewImage.style.width = "100%";
        previewImage.style.height = "500px";

        function cargarVideo(event) {
            previewImage.style.display = "none";
            var archivo = event.target.files[0];
            var tipoVideo = /video.*/;
            if (archivo && archivo.type.match(tipoVideo)) {
                var lector = new FileReader();
                lector.onload = function(e) {
                    var video = document.createElement('video');
                    video.src = e.target.result;
                    video.controls = true;
                    video.autoplay = true;
                    video.style.width = "500px";
                    video.style.height = "500px";
                    contenedorVideo.innerHTML = '';
                    contenedorVideo.appendChild(video);
                };
                lector.readAsDataURL(archivo);
                previewImage.style.display = "none";
            } else {
                contenedorVideo.style.display = "none";
                const file = event.target.files[0];

                // Crear un objeto FileReader
                const reader = new FileReader();

                // Configurar la función de devolución de llamada al completar la lectura del archivo
                reader.onload = function(e) {
                    // Obtener la URL de los datos de la imagen
                    const imageURL = e.target.result;
                    previewImage.style.display = "block";
                    // Asignar la URL a la fuente de la imagen de previsualización
                    previewImage.src = imageURL;
                };

                // Leer el contenido del archivo como una URL de datos
                reader.readAsDataURL(file);
            }
        }

        function cargarEscala() {
            const scale = document.getElementById('scale').value;

            console.log(scale);
            if (scale == "1:1") {
                previewImage.style.width = "100%";
                previewImage.style.height = "500px";
                console.log(scale);
            } else if (scale == "4:5") {
                previewImage.style.width = "80%";
                previewImage.style.height = "500ppx";
            } else if (scale == "16:9") {
                previewImage.style.width = "100%";
                previewImage.style.height = "300px";
            }
        }

        const pu_descripcion = document.getElementById('pu_descripcion');
        const count = document.getElementById('count');

        // Obtener la cantidad máxima de caracteres permitidos del atributo "maxlength" del textarea
        const maxLength = pu_descripcion.getAttribute('maxlength');

        // Escuchar el evento 'input' del textarea
        pu_descripcion.addEventListener('input', function() {
            // Obtener la longitud actual del texto en el textarea
            const currentLength = pu_descripcion.value.length;

            // Actualizar el contador de caracteres
            count.textContent = `Caracteres: ${currentLength}/${maxLength}`;
        });
    </script>
@endsection
