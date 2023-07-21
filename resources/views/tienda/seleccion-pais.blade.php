@extends('layouts.app')
@section('content')
    <div class="d-flex justify-content-center align-items-center" style="width: 100%; height: 80vh;">
        <div class="card p-4 border-0 shadow">
            <h4 class="text-center fw-bold mb-2">Seleccione el país de consulta</h4>
            <form action="{{URL::to('/tienda')}}" method="get">
                @csrf
                <select class="js-example-basic-single" name="pais" id="pais" style="width: 100%" required>
                    @foreach ($paises as $pais)
                        <option value="{{$pais->pa_id}}">{{$pais->pa_nombre}}</option>
                    @endforeach
                </select>
                <button class="btn btn-primary mt-3 mb-2 w-100">Seleccionar</button>
            </form>
        </div>
    </div>
@endsection
