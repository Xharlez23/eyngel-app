<div class="card-post-anuncios">
    @if (Auth::user()->u_role == 0)
        <div class="row">
            @if (Auth::user()->u_ciudad_residencia == '' || Auth::user()->u_ciudad_residencia == null)
                <div class="col-md-12 completar-perfil">
                    <div class="card p-3 mb-3 border-0 shadow-sm">
                        <h6 class="titulo-h6">Para conocer más personas, completa tu perfil.</h6>
                        <a class="btn btn-primary btn-sm" href="#" data-bs-toggle="modal"
                            data-bs-target="#modal-profile"><i class="bi bi-person-bounding-box"></i> Completar</a>
                    </div>
                </div>
            @endif
            @if ($sugerencias->count() > 0)
                <div class="col-md-12 card bg-white p-2 mt-1 shadow-sm border-0">
                    <h5 class="titulo-h5">Sugerencias</h5>
                    <div class="sugeriencias">
                        @foreach ($sugerencias as $item)
                            <?php
                            $tocando = DB::table('seguidores')
                                ->where('seguido_id_users', Auth::user()->id)
                                ->where('seguidor_id_users', $item->id)
                                ->first();
                            ?>
                            <div class="card-sugerencia mb-2">
                                <img src="{{ $item->u_img_profile == '' ? asset('images/3135768.png') : $item->u_img_profile }}"
                                    alt="">
                                <div class="buttons-action">
                                    <a class="fw-bold"
                                        href="{{ URL::to('/' . $item->u_nombre_usuario) }}">{{ $item->u_nombre . ' ' . $item->u_apellido }}</a>
                                    @if ($tocando)
                                        <button class="bn-follow-delete" data-auth="{{ Auth::user()->id }}"
                                            data-tocar="{{ $item->id }}">Dejar de visitar</button>
                                    @else
                                        <button class="bn-follow" data-auth="{{ Auth::user()->id }}"
                                            data-tocar="{{ $item->id }}">Visitar</button>
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>
    @endif
</div>
