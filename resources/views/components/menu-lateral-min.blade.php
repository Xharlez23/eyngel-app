<?php $ruta = Request::route()->getName(); ?>
@if ($ruta != 'promocionar.index')
    <div class="content-menu-lateral-min">
        <div class="menu-lateral-min mt-2">
            <a href="{{ URL::to('/' . Auth::user()->u_nombre_usuario . '/') }}" 
                style="display: flex; align-items: center; padding-left: 20px; font-size: 15px"><img
                    class="logo-icon-header" 
                    src="{{ Auth::user()->u_img_profile == '' ? asset('images/3135768.png') : asset(Auth::user()->u_img_profile) }}"
                    alt="img-profile"><span class="fw-bold" id="name-profile-notify"
                    style="padding-left: 10px">{{ Str::ucfirst(Auth::user()->u_nombre_usuario) }}</span></a>
            <a href="{{ URL::to('/cargar') }}"
                style="display: flex; align-items: center; padding-left: 20px; font-size: 15px"><i
                    class="bi bi-patch-plus {{ ($ruta == 'post.cargar' ? 'color' : '')}}" style="font-size: 25px; padding-right: 10px"></i> Nueva publicación</a>
            <a href="{{ URL::to('/centro-de-promocion/crear?eyngel_id='.Auth::user()->id) }}"
                style="display: flex; align-items: center; padding-left: 20px; font-size: 15px"><i
                    class="bi bi-graph-up-arrow {{($ruta == 'promocionar.index' ? 'color' : '')}}" style="font-size: 25px; padding-right: 10px"></i> Promocionar</a>
            <a href="{{ URL::to('/tienda') }}"
                style="display: flex; align-items: center; padding-left: 20px; font-size: 15px"><i class="bi bi-shop {{ ($ruta == 'tienda.index' ? 'color' : '')}}"
                    style="font-size: 25px; padding-right: 10px"></i> Centro comercial</a>
            <hr>
        </div>
    </div>
@endif
