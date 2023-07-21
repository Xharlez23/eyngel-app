<h4 class="titulo-h4">{{ $tienda->t_nombre }}</h4>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="col-form-label" for="nombre">Producto</label>
            <input type="text" class="form-control" name="t_nombre" id="t_nombre" required>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="col-form-label" for="nombre">Imagen</label>
            <input type="file" class="form-control" name="t_imagen" id="t_imagen" required>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="col-form-label" for="">Descripción producto</label>
            <textarea class="ckeditor" name="t_descripcion" id="t_descripcion" cols="30" rows="10"></textarea>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group mt-2">
            <label class="col-form-label" for="tp_precio">Precio producto</label>
            <input type="number" class="form-control" name="tp_precio" id="tp_precio" required>
        </div>
        <div class="form-group mt-2">
            <label class="col-form-label" for="nombre">Enlace producto</label>
            <input type="url" class="form-control" name="tp_enlace_producto" id="tp_enlace_producto" required>
        </div>
        <div class="form-group mt-2 mb-1">
            <input type="hidden" class="form-control" name="tp_id_empresa" id="tp_id_empresa"
                value="{{ $tienda->t_id }}" required readonly>
        </div>
        <div class="d-flex justify-content-start">
            <button class="btn btn-primary mt-3" type="submit">Guardar</button>
        </div>
    </div>
</div>
