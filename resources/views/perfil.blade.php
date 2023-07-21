<?php
$user_tocado = DB::table('users')
    ->where('u_nombre_usuario', $usuario->u_nombre_usuario)
    ->first();
$tocando = DB::table('seguidores')
    ->where('seguido_id_users', Auth::user()->id)
    ->where('seguidor_id_users', $usuario->id)
    ->first();
?>
@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="content-profile">
            <div class="content-profile-header">
                <!--Imagen de perfil-->
                <a href="#"
                    {{ Auth::user()->id == $usuario->id ? 'data-bs-toggle=modal data-bs-target=#profile-img' : '' }}><img
                        class="card-img-profile"
                        src="{{ $usuario->u_img_profile == '' ? asset('images/3135768.png') : asset($usuario->u_img_profile) }}"
                        alt="img-profile" loading="lazy">
                </a>
                <!--fin-->
                <!--info-->
                <div class="info-red-min">
                    <h4 class="titulo-h4">{{ Str::ucfirst($usuario->u_nombre_usuario) }}
                        @if (Auth::user()->id != $usuario->id)
                            @if ($tocando)
                                <button class="bn-follow-delete" data-auth="{{ Auth::user()->id }}"
                                    data-tocar="{{ $user_tocado->id }}"><img style="width: 20px; height: 20px;" src="{{asset('images/icons/te-visitan-color.png')}}" alt=""></button>
                            @else
                                <button class="bn-follow" data-auth="{{ Auth::user()->id }}"
                                    data-tocar="{{ $user_tocado->id }}"><img style="width: 20px; height: 20px;" src="{{asset('images/icons/te-visitan-white.png')}}" alt=""></button>
                            @endif
                        @endif
                        @if (Auth::user()->id == $usuario->id)
                            <div class="dropdown">
                                <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    <i class="bi bi-plus-circle"></i>
                                </button>
                                <ul class="dropdown-menu shadow" style="border: none">
                                    <li><a class="dropdown-item" style="font-size: 15px; padding: 10px 12px;"
                                            href="#"><i class="bi bi-box-arrow-in-up-right"
                                                style="padding-right: 10px"></i> Difundir perfil</a></li>
                                    <li><a class="dropdown-item" style="font-size: 15px; padding: 10px 12px;" href="#"
                                            data-bs-toggle="modal" data-bs-target="#modal-profile"><i class="bi bi-pencil"
                                                style="padding-right: 10px"></i> Editar perfil</a></li>
                                    <hr>
                                    <li><a class="dropdown-item" style="font-size: 15px; padding: 10px 12px;"
                                            href="{{ URL::to('/' . Auth::user()->u_nombre_usuario . '/monetizacion') }}"><i
                                                class="bi bi-wallet2" style="padding-right: 10px"></i> Trabaja con
                                            nosotros</a></li>
                                    <hr>
                                    <li><a class="dropdown-item" style="font-size: 15px; padding: 10px 12px;" href="#"
                                            data-bs-toggle="modal" data-bs-target="#modal-d-cuenta"><i class="bi bi-pencil"
                                                style="padding-right: 10px"></i> Eliminar cuenta</a></li>
                                    <hr>
                                    <li><a class="dropdown-item" href="{{ route('logout') }}"
                                        onclick="window.localStorage.setItem('logeado', false); event.preventDefault();
                                        document.getElementById('logout-form').submit();"
                                        style="font-size: 15px; padding: 10px 12px;"><i
                                            class="bi bi-door-closed" style="padding-right: 10px"></i>
                                        Cerrar sesión</a></li>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                        @csrf
                                    </form>
                                    <!--<li><a class="dropdown-item" style="font-size: 15px; padding: 10px 12px;"
                                                    href="{{ url('/tienda/dashboard-tienda') }}"><i class="bi bi-wallet2"
                                                        style="padding-right: 10px"></i> Empresa</a></li>-->
                                </ul>
                            </div>
                        @endif
                    </h4>
                    <h6 class="titulo-h6">{{ Str::ucfirst($usuario->u_nombre) . ' ' . Str::ucfirst($usuario->u_apellido) }}</h6>
                    <div class="d-flex gap-2">
                        <a href="#"
                            {{ $usuario->id == Auth::user()->id
                                ? "data-bs-toggle=modal
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            data-bs-target=#modal-seguidos"
                                : '' }}><small><strong>{{ $tocado->count() }}
                                    Te visitan</strong></small></a>
                        @if (Auth::user()->id == $usuario->id)
                            <a href="#"
                                {{ $usuario->id == Auth::user()->id
                                    ? "data-bs-toggle=modal
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            data-bs-target=#modal-seguidores"
                                    : '' }}><small><strong>{{ $tocando_count->count() }}
                                        Visitando</strong></small></a>
                        @endif
                    </div>
                    <div class="presentation">
                        <p class="text-default" style="font-weight: 400">{{ $usuario->u_descripcion_perfil }}</p>
                    </div>
                </div>
                <!--fin-->
            </div>
        </div>
        <?php
        $filter = '';
        $post_users = DB::table('post_user')
            ->select('pu_extension', 'pu_file', 'u_nombre_usuario', 'id', 'pu_id', 'pu_id_user', 'pu_descripcion')
            ->join('users', 'post_user.pu_id_user', '=', 'users.id')
            ->where('pu_id_user', $usuario->id)
            ->get();
        ?>
        @if ($post_users->count() > 0)
            <div class="d-flex justify-content-center align-items-center gap-5" id="menu-filter-movil"
                style="list-style: none">
                <li><a class=" " id="menu-movil-link" href="?filter=" title="Para ti">
                        <i class="bi bi-card-list" style="font-size: 20px; color: #373435"></i>
                    </a></li>
                <li><a class=" " id="menu-movil-link" href="?filter=images" title="Solo imagenes">
                        <i class="bi bi-card-image" style="font-size: 20px; color: #373435"></i>
                    </a></li>
                <li><a class=" " id="menu-movil-link" href="?filter=videos" title="Solo videos"><i class="bi bi-film"
                            style="font-size: 20px; color: #373435"></i></a></li>
                <li><a class=" " id="menu-movil-link" href="?filter=hilos" title="Solo hilos"><i
                            class="bi bi-chat-quote" style="font-size: 20px; color: #373435"></i></a></li>
            </div>
            <div class="content-filter-profile mt-4">
                @foreach ($post_users as $post)
                    <?php $post_like = DB::table('post_action')
                        ->select(DB::raw('count(*) as like_count'))
                        ->where('poac_id_post', $post->pu_id)
                        ->where('poac_action', 1)
                        ->first();
                    
                    $post_auth_like = DB::table('post_action')
                        ->where('poac_id_user', Auth::user()->id)
                        ->where('poac_id_post', $post->pu_id)
                        ->where('poac_action', 1)
                        ->first();
                    
                    ?>
                    @if (request()->input('filter') == 'images' && $post->pu_extension != 'mp4' && $post->pu_extension != '')
                        <div class="card-post-profile">
                            @include('components.complement-profile')
                            <img class="card-custom-image" src="{{ asset($post->pu_file) }}" alt="image-post"
                                onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                                loading="lazy">
                        </div>
                    @elseif (request()->input('filter') == 'videos' && $post->pu_extension == 'mp4')
                        <div class="card-post-profile">
                            @include('components.complement-profile')
                            <video class="card-custom-video" id="card-custom-video" src="{{ $post->pu_file }}" controls
                                onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}';"
                                loading="lazy"></video>
                        </div>
                    @elseif (request()->input('filter') == '')
                        @if ($post->pu_extension == 'mp4')
                            <div class="card-post-profile">
                                @include('components.complement-profile')
                                <video class="card-custom-video" id="card-custom-video" src="{{ $post->pu_file }}"
                                    controls
                                    onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}'"
                                    loading="lazy"></video>
                            </div>
                        @elseif(
                            $post->pu_extension == 'jpg' ||
                                $post->pu_extension == 'png' ||
                                $post->pu_extension == 'jpeg' ||
                                $post->pu_extension == 'webp')
                            <div class="card-post-profile">
                                <div class="complement-profile">
                                    @if (Auth::user()->id == $post->pu_id_user)
                                        <div class="button-delete-post">
                                            <button class="border-0" style="background-color: transparent"
                                                data-bs-toggle="dropdown" aria-expanded="false"><i
                                                    class="bi bi-grid"></i></button>
                                            <ul class="dropdown-menu shadow border-0">
                                                <a class="dropdown-item show_post" href="#" data-bs-toggle="modal"
                                                    data-bs-target="#modal-d-post" data-id="{{ $post->pu_id }}"><i
                                                        class="bi bi-trash3"></i> Eliminar publicación</a>
                                                <a class="dropdown-item"
                                                    href="{{ URL::to('/' . Auth::user()->u_nombre_usuario . '/post/' . $post->pu_id) }}"><i
                                                        class="bi bi-eye"></i> Ir a la publiciación</a>
                                            </ul>
                                        </div>
                                    @endif
                                </div>
                                <img class="card-custom-image" src="{{ asset($post->pu_file) }}" alt="img-post"
                                    onclick="window.location.href='{{ URL::to($post->u_nombre_usuario . '/post/' . $post->pu_id) }}'"
                                    loading="lazy">
                            </div>
                        @endif
                    @elseif(request()->input('filter') == 'hilos' && $post->pu_extension == '' && $post->pu_file == '')
                        <div class="card-hilo card card-custom-post p-3 mb-3 border-0 shadow-sm">
                            <div class="card-header-custom d-flex justify-content-end">
                                @include('components.complement-profile')
                            </div>
                            <div class="card-custom-descripcion">
                                <p style="font-size: 15px"><?php echo $post->pu_descripcion; ?></p>
                            </div>
                            <div class="content-post-body">
                                <div class="d-flex justify-content-end mt-1">
                                    <span class="badge rounded-pill text-bg-light"
                                        id="likes-count-{{ $post->pu_id }}"><strong><small>
                                            </small></strong></span>
                                </div>
                                @include('components.button-icons-action')
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>
        @else
            <div class="alert alert-secondary mt-4" role="alert">
                Aún no tienes publicaciones, ¿Qué esperar para poder compartir tu contenido?
                <a href="{{ URL::to('/cargar') }}">Compartir</a>
            </div>
        @endif
    </div>
    </div>
    <br>
    @include('components.profile-img')
    @include('components.modal-seguidores')
    @include('components.modal-seguidos')
    @include('components.modal-perfil-basico')
    @include('components.modal-d-post')
    @include('components.modal-d-cuenta')
    @include('components.modal-opinar')
@endsection
