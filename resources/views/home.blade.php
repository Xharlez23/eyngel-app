@extends('layouts.app')
@section('content')
    <div class="container-fluid">
        @if (Auth::user()->u_role == 0)
            <div class="row">
                <div class="col-md-7 mt-3" id="card-post-content">
                    @foreach ($post_users as $post)
                        @include('components.post-home')
                    @endforeach
                </div>
                <div class="col-md-5 mt-3 d-flex justify-content-center">
                    <div class="a-fixed">
                        <div class="content-site-notify">
                            <div class="d-flex justify-content-end" id="button-notify">
                                <a href="#" class="btn btn-primary position-relative ver-notificaciones-btn" id="ver-notificaciones-btn">
                                    <i class="bi bi-bell"></i> Notificaciones
                                    <span
                                        class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                        id="count-notify-site">
                                        <span class="visually-hidden"><i class="bi bi-bell"></i></span>
                                    </span>
                                </a>
                            </div>
                            <div class="card content-notify p-1 border-0 shadow mb-2" id="content-notify-site"></div>
                        </div>
                        @include('components.anuncios-red-social')
                    </div>
                </div>
            </div>
        @endif
    </div>
    @include('components.modal-edit-post')
    @include('components.modal-d-post')
    @include('components.modal-perfil-basico')
@endsection
