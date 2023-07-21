@extends('layouts.app')
@section('content')
    <div class="container-fluid">
        <br>
        <h3 class="titulo-h3 mt-4">Gana dinero con Eyngel</h3>
        <div class="content-monetizacion">
            <h4 class="titulo-h4 mt-4">Conviertete en creador:</h4>
            <p class="text-default">Únete al Programa de socios de EYNGEL a fin de ganar dinero, debes cumplir con los siguiente requisito:</p>
            <div class="card card-body">
                <h4 class="titulo-h4 mt-2">¿Como puedo postularme?</h4>
                <p class="text-default">Para postularse como creador de contenido en <strong>eyngel</strong> y ser elegible para la monetización,
                    debes cumplir
                    con los siguientes requisitos</p>
                <ul>
                    <li>Contar con un mínimo de 3,000 saludos en tu perfil de eyngel. Los saludos representan la audiencia o
                        seguidores de tu perfil en la plataforma.</li>
                    <li class="mt-3" style="list-style: none">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="{{$tocando_count->count(). '%'}}"
                            aria-valuemin="0" aria-valuemax="3000">
                            <div class="progress-bar" style="width: {{$tocando_count->count(). '%'}}"></div>

                        </div>
                        <div class="d-flex justify-content-between">
                            <p>{{$tocando_count->count()}} saludos</p>
                            <p>Meta: 3.000</p>
                        </div>
                    </li>
                    <li>Tener un mínimo de 50,000 EY (Tokens de eyngel). Los EY son los tokens que los creadores de
                        contenido ganan mientras los usuarios o sus seguidores consumen su contenido en eyngel.</li>
                    <li class="mt-3" style="list-style: none">
                        <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="{{($tokensCount->count()/2). '%'}}"
                            aria-valuemin="0" aria-valuemax="50000">
                            <div class="progress-bar" style="width: {{($tokensCount->count()/2). '%'}}"></div>

                        </div>
                        <div class="d-flex justify-content-between">
                            <p>{{($tokensCount->count()/2)}} EY</p>
                            <p>Meta: 50.000</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="card card-body mt-2">
                <h4 class="titulo-h4 mt-2">Solicitar rol de creador</h4>
                <p class="text-default">Una vez que cumpla con los requisitos minimos podra realizar la postulación a creador y esta sera revisada por EYNGEL.</p>
            </div>
        </div>
    </div>
    <br>
@endsection
