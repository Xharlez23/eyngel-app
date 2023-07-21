<?php
$post_like = DB::table('post_action')
    ->select(DB::raw('count(*) as like_count'))
    ->where('poac_id_post', $post->pu_id)
    ->where('poac_action', 1)
    ->first();
$post_comment = DB::table('post_comment')
    ->where('poc_id_post', $post->pu_id)
    ->get();
$post_auth_like = DB::table('post_action')
    ->where('poac_id_user', Auth::user()->id)
    ->where('poac_id_post', $post->pu_id)
    ->where('poac_action', 1)
    ->first();
?>
@if (request()->input('filter') == 'images' && $post->pu_extension != 'mp4' && $post->pu_extension != '' )
    <!-- Mostrar solo imágenes -->
    <div class="card card-custom-post p-3 mb-3 border-0 shadow-sm">
        <div class="card-header-custom">
            <div class="name-profile">
                <img class="img-profile-min" src="{{ $post->u_img_profile == '' ? asset('images/3135768.png') : asset($post->u_img_profile) }}" alt="img-profile" loading="lazy">
                <p class="title-profile"
                    onclick="window.location.href='{{ URL::to('/' . $post->u_nombre_usuario) }}';">
                    {{ $post->u_nombre_usuario }} <br> <small class="text-muted">{{$post->created_at}}</small></p>
            </div>
            @include('components.complement-profile')
        </div>
        <div class="card-custom-descripcion">
            <p class="text-default mt-2"><?php echo $post->pu_descripcion ?></p>
        </div>
        <div class="content-post-body">
            <div class="card-custom-post-body" id="card-custom-post-body">
                <img class="card-custom-img" src="{{ asset($post->pu_file) }}"
                    onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                    alt="imagen post" loading="lazy">
            </div>
            <div class="d-flex justify-content-end mt-1">
                <span class="badge rounded-pill text-bg-light" id="likes-count-{{$post->pu_id}}"><strong><small>
                            </small></strong></span>
            </div>
            @include('components.button-icons-action')
        </div>
    </div>
@elseif (request()->input('filter') == 'videos' && $post->pu_extension == 'mp4')
    <!-- Mostrar solo videos -->
    <div class="card card-custom-post p-3 mb-3 border-0 shadow-sm">
        <div class="card-header-custom">
            <div class="name-profile">
                <img class="img-profile-min" src="{{ $post->u_img_profile == '' ? asset('images/3135768.png') : asset($post->u_img_profile) }}" alt="img-profile" loading="lazy">
                <p class="title-profile"
                    onclick="window.location.href='{{ URL::to('/' . $post->u_nombre_usuario) }}';">
                    {{ $post->u_nombre_usuario }} <br> <small class="text-muted">{{$post->created_at}}</small></p>
            </div>
            @include('components.complement-profile')
        </div>
        <div class="card-custom-descripcion">
            <p class="text-default mt-2"><?php echo $post->pu_descripcion ?></p>
        </div>
        <div class="content-post-body">
            <div class="card-custom-post-body" id="card-custom-post-body">
                <video class="card-custom-video videoElemento" id="card-custom-video"
                        src="{{ asset($post->pu_file) }}" controls data-id="{{ $post->pu_id }}"
                        data-iduser={{ Auth::user()->id }}
                        onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                        loading="lazy"></video>
            </div>
            <div class="d-flex justify-content-end mt-1">
                <span class="badge rounded-pill text-bg-light" id="likes-count-{{$post->pu_id}}"><strong><small>
                            </small></strong></span>
            </div>
            @include('components.button-icons-action')
        </div>
    </div>
@elseif (request()->input('filter') == '')
    <!-- Mostrar todo -->
    <div class="card card-custom-post p-3 mb-3 border-0 shadow-sm">
        <div class="card-header-custom">
            <div class="name-profile">
                <img class="img-profile-min" src="{{ $post->u_img_profile == '' ? asset('images/3135768.png') : asset($post->u_img_profile) }}" alt="img-profile" loading="lazy">
                <p class="title-profile"
                    onclick="window.location.href='{{ URL::to('/' . $post->u_nombre_usuario) }}';">
                    {{ $post->u_nombre_usuario }} <br> <small class="text-muted">{{$post->created_at}}</small></p>
            </div>
            @include('components.complement-profile')
        </div>
        <div class="card-custom-descripcion">
            <p class="text-default mt-2"><?php echo $post->pu_descripcion ?></p>
        </div>
        <div class="content-post-body">
            <div class="card-custom-post-body" id="card-custom-post-body">
                @if ($post->pu_extension == 'mp4')
                    <video preload="auto" playsinline class="card-custom-video videoElemento" id="card-custom-video"
                        src="{{ asset($post->pu_file) }}" controls data-id="{{ $post->pu_id }}"
                        data-iduser={{ Auth::user()->id }}
                        onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                        loading="lazy"></video>
                @elseif($post->pu_extension == 'png' || $post->pu_extension == 'jpg' || $post->pu_extension == 'jpeg')
                    <img class="card-custom-img" src="{{ asset($post->pu_file) }}"
                        onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                        alt="imagen post">
                @elseif($post->pu_extension == "")
                @endif
            </div>
            <div class="d-flex justify-content-end mt-1">
                <span class="badge rounded-pill text-bg-light" id="likes-count-{{$post->pu_id}}"><strong><small>
                            </small></strong></span>
            </div>
            @include('components.button-icons-action')
        </div>
    </div>
@elseif (request()->input('filter') == 'hilos' && $post->pu_extension == '')
    <div class="card card-custom-post p-3 mb-3 border-0 shadow-sm">
        <div class="card-header-custom">
            <div class="name-profile">
                <img class="img-profile-min" src="{{ $post->u_img_profile == '' ? asset('images/3135768.png') : asset($post->u_img_profile) }}" alt="img-profile" loading="lazy">
                <p class="title-profile"
                    onclick="window.location.href='{{ URL::to('/' . $post->u_nombre_usuario) }}';">
                    {{ $post->u_nombre_usuario }} <br> <small class="text-muted">{{$post->created_at}}</small></p>
            </div>
            @include('components.complement-profile')
        </div>
        <div class="card-custom-descripcion">
            <p class="text-default mt-2"><?php echo $post->pu_descripcion ?></p>
        </div>
        <div class="content-post-body">
            <div class="d-flex justify-content-end mt-1">
                <span class="badge rounded-pill text-bg-light" id="likes-count-{{$post->pu_id}}"><strong><small>
                            </small></strong></span>
            </div>
            @include('components.button-icons-action')
        </div>
    </div>
@endif
@include('components.modal-opinar')
@section('js')
    <script src="{{ asset('js/_viewOpinion.js') }}"></script>
    <script src="{{ asset('js/_playVideo.js') }}"></script>
@endsection
