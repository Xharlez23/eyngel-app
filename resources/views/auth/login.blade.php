@extends('layouts.app')
@section('content')
    <div class="container-login">
        <img class="logo_card_auth mb-3" src="{{ asset('images/icons/icon-logo-200.png') }}" alt="">
        <div class=" border-0 p-2">
            <div class="card-body">
                <form method="POST" action="{{ route('login') }}">
                    @csrf
                    <div class="row mb-3">
                        <div class="col-md-12">
                            <label for="email" class="col-md-12 col-form-label">{{ __('Correo electronico') }}</label>
                            <div class="col-md-12">
                                <input id="email-login" type="email"
                                    class="form-custom @error('email') is-invalid @enderror" name="email"
                                    value="{{ old('email') }}" placeholder="Ingrese correo electronico...." required
                                    autocomplete="email" autofocus>
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="password" class="col-md-12 col-form-label">{{ __('Contraseña') }}</label>
                            <div class="col-md-12">
                                <input id="password-login" type="password"
                                    class="form-custom @error('password') is-invalid @enderror" name="password" required
                                    autocomplete="current-password" placeholder="Ingrese contraseña....">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row mb-0">
                        <div class="col-md-12">
                            <button type="submit" class="bn bn-primary">
                                {{ __('Ingresar') }}
                            </button>
                            <hr>
                            <div class="d- mt-4">
                                <a class="text-default" style="text-decoration: none; color: #000" id="text__pass"
                                    href="{{ route('password.update') }}">Recuperar
                                    contraseña</a>
                                <a class="text-default" href="#" style="text-decoration: none; color: #000" id="text__pass"  data-bs-toggle="modal" data-bs-target="#registerUser">Registro de nuevo usuario</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@include('components.register')