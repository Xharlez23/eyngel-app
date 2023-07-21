@extends('layouts.app')
@section('content')
    <div class="content-post">
        <div class="post-media {{ $post->pu_extension == 'mp4' ? 'media-50' : 'media-60' }}">
            @if ($post->pu_extension == 'mp4')
                <video class="card-custom-video" id="card-custom-video" src="{{ asset($post->pu_file) }}" controls></video>
            @else
                <img class="card-image-custom-post" src="{{ asset($post->pu_file) }}" alt="img-post">
            @endif
        </div>
        <div class="post-info {{ $post->pu_extension == 'mp4' ? 'media-50' : 'media-40' }} bg-white shadow-sm">
            <div class="content-post-comment">
                <div class="profile">
                    <div class="profile-post">
                        @include('components.complement-profile')
                        <img class="img-profile-min"
                            src="{{ $post->u_img_profile == '' ? asset('images/3135768.png') : asset($post->u_img_profile) }}"
                            alt="Imagen perfil">
                        <a class="text-default fw-bold"
                            href="{{ URL::to('/' . $post->u_nombre_usuario) }}">{{ Str::ucfirst($post->u_nombre_usuario) }}
                            <br> <small class="text-muted" style="font-size: 11px">{{ $post->created_at }}</small></a>

                    </div>
                    @if (Auth::user()->id != $post->pu_id_user)
                        <?php
                        $consulta_seguidor = DB::table('seguidores')
                            ->where('seguido_id_users', Auth::user()->id)
                            ->where('seguidor_id_users', $post->pu_id_user)
                            ->first();
                        ?>
                        @if ($consulta_seguidor)
                            <div class="bn-follow-content">
                                <button class="bn-follow-delete" data-auth="{{ Auth::user()->id }}"
                                    data-tocar="{{ $post->pu_id_user }}"><img style="width: 20px; height: 20px;"
                                        src="{{ asset('images/icons/te-visitan-color.png') }}" alt=""></button>
                            </div>
                        @else
                            <div class="bn-follow-content">
                                <button class="bn-follow" data-auth="{{ Auth::user()->id }}"
                                    data-tocar="{{ $post->pu_id_user }}"><img style="width: 20px; height: 20px;"
                                        src="{{ asset('images/icons/te-visitan-white.png') }}" alt=""></button>
                            </div>
                        @endif
                    @endif
                </div>
                <div class="profile-post-descripcion">
                    <?php echo $post->pu_descripcion; ?>
                </div>
                <!-- action counts-->
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
                $post_users = DB::table('post_user')
                    ->select('pu_extension', 'pu_file', 'u_nombre_usuario', 'id', 'pu_id', 'pu_id_user', 'pu_descripcion')
                    ->join('users', 'post_user.pu_id_user', '=', 'users.id')
                    ->where('pu_id_user', $usuario->id)
                    ->get();
                ?>
                <div class="d-flex justify-content-end mt-1">
                    <span class="badge rounded-pill text-bg-light" id="likes-count-{{ $post->pu_id }}"><strong><small>
                            </small></strong></span>
                </div>
                <div class="content-post-body">
                    @include('components.button-icons-action')
                </div>
                <div class="content-comment">
                    @if ($postComments->count() > 0)
                        @foreach ($postComments as $comment)
                            <div class="profile-comment">
                                <div class="profile-info">
                                    <img class="img-profile-min-post"
                                        src="{{ $comment->u_img_profile == '' ? asset('images/3135768.png') : asset($comment->u_img_profile) }}"
                                        alt="Imagen perfil">
                                    <a class="post-title-user"
                                        href="{{ URL::to($comment->u_nombre_usuario) }}"><strong>{{ $comment->u_nombre_usuario }}</strong></a>
                                </div>
                                <p class="profile-descripcion"><?php echo $comment->poc_comment; ?></p>
                            </div>
                        @endforeach
                    @else
                        <p class="d-flex justify-content-center mt-4">¡Sé el primero en opinar!</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @include('components.modal-edit-post')
    @include('components.modal-d-post')
    @include('components.modal-opinar')
@endsection
