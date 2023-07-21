<div class="card-custom-icons mt-2" id="card-custom-icons">
    <div class="card-custom-icons-min">
        <button class="button-red-min {{($post_auth_like) ? 'button-check-delete' : 'button-check'}} " id="button-action-{{$post->pu_id}}" data-auth="{{ Auth::user()->id }}"
            data-video="{{ $post->pu_id }}"></button>
    </div>
    <?php $route = request()
        ->route()
        ->getName(); ?>
    <div class="card-custom-icons-min">
        <button class="button-red-min post" data-id="{{ $post->pu_id }}" data-bs-toggle="modal"
            data-bs-target="#opinion"><i class="bi bi-chat-left-dots"></i></button>
    </div>
    <div class="card-custom-icons-min">
        <div class="dropdown">
            <button class="button-red-min dropdown-btn" title="Propangar"><i class="bi bi-share"></i></button>
            <div class="dropdown-content">
                <a href="https://wa.me/?text={{ URL::to('/' . $post->u_nombre_usuario . '/post/' . $post->pu_id) }}"
                    target="_blank"><i class="bi bi-whatsapp"></i> Compartir por
                    WhatsApp</a>
                <a href="{{ URL::to('/' . $post->u_nombre_usuario . '/post/' . $post->pu_id) }}"><i
                        class="bi bi-link"></i> Copiar enlace</a>
            </div>
        </div>
    </div>
</div>
