<div class="p-2">
    <h4 class="titulo-h4 mt-4">Cargar</h4>
    <p class="text-default">Haz una publicación en tu cuenta</p>
    <div class="row">
        <div class="col-md-12">
            <div class="content-post-eyngel shadow">
                <div class="d-flex gap-2 justify-content-center align-items-center mb-3" id="menu-cargar">
                    <img class="img-profile-min"
                        src="{{ $usuario->u_img_profile == '' ? asset('images/3135768.png') : asset($usuario->u_img_profile) }}"
                        alt="Imagen perfil">
                    <p class="text-default fw-bold" style="margin-top: 10px">{{ $usuario->u_nombre_usuario }}</p>
                    <div class="button-selection">
                        <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off"
                            value="img">
                        <label class="btn btn-primary" for="option2"><img class="img-filter"
                                style="width: 20px; height: 20px; object-fit: cover"
                                src="{{ asset('images/icons/icon-image.png') }}" alt="img-icon"></label>
                        <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off"
                            value="movie">
                        <label class="btn btn-primary" for="option3"><img class="img-filter"
                                style="width: 20px; height: 20px; object-fit: cover"
                                src="{{ asset('images/icons/icon-media.png') }}" alt="img-icon"></label>
                        <input type="radio" class="btn-check" name="options" id="option4" autocomplete="off"
                            value="text">
                        <label class="btn btn-primary" for="option4"><img class="img-filter"
                                style="width: 20px; height: 20px; object-fit: cover"
                                src="{{ asset('images/icons/icon-hilo.png') }}" alt="img-icon"></label>
                    </div>
                </div>
                <p class="text-muted" style="font-weight: 500" id="text-message"></p>
                <div class="form-group">
                    <textarea class="form-control" cols="30" rows="5" name="pu_descripcion" id="pu_descripcion"
                        placeholder="Escribe algo..." maxlength="500"></textarea>
                    <p class="mt-2" style="font-size: 14px" id="count"></p>
                </div>
                <div class="col-md-12  bg-white shadow-sm border-1 mb-2">
                    <div style="width: 100%; height: 100%;display:flex; justify-content: center;">
                        <div id="contenedorVideo"
                            style="width: 50%; height: 100%; display:flex; justify-content: center; align-items: center;">
                        </div>
                    </div>
                    <div class="contenedorImg"
                        style="width: 100%; height: 100%; display:flex; justify-content: center; align-items: center">
                        <img id="contenedorImg"
                            style="width: 50%; height: 100%; display:flex; justify-content: center; align-items: center;"
                            src="">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2" id="files1">
                        <div class="form-group">
                            <p style="font-size: 13px" id="message-movie"></p>
                            <input class="form-control mt-3" type="file" name="pu_file" id="pu_file"
                                onchange="cargarVideo(event)">
                        </div>
                    </div>
                    <div class="col-md-6 mb-2" id="files2">
                        <div class="form-group">
                            <p><small>Aspecto imagen</small></p>
                            <select class="form-select" name="scale" id="scale" onchange="cargarEscala()"
                                required>
                                <option value="1:1">1:1</option>
                                <option value="4:5">4:5</option>
                                <option value="16:9">16:9</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-start mt-2">
                    <button class="btn btn-primary" type="submit">Publicar</button>
                </div>
            </div>
        </div>
    </div>
</div>
