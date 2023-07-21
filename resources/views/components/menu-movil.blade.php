<div class="btn-movil-menu shadow-sm bg-white">
    <div class="content">
        <a href="{{ URL::to('/' . Auth::user()->u_nombre_usuario . '/') }}"
            style="display: flex; align-items: center; padding-left: 20px; font-size: 14px"><img class="logo-icon-header"
                src="{{ Auth::user()->u_img_profile == '' ? asset('images/3135768.png') : asset(Auth::user()->u_img_profile) }}"
                alt="img-profile"></a>
        <a href="{{ URL::to('/cargar') }}"
            style="display: flex; align-items: center; padding-left: 20px; font-size: 14px"><i class="bi bi-patch-plus"
                style="font-size: 25px; padding-right: 10px"></i></a>
        <a href="{{ URL::to('/tienda') }}"
            style="display: flex; align-items: center; padding-left: 10px; font-size: 14px"><i class="bi bi-shop"
                style="font-size: 25px; padding-right: 10px"></i></a>
        <a href="#" class="ver-notificaciones-btn" id="ver-notificaciones-btn"
            style="display: flex; align-items: center; padding-left: 20px; font-size: 14px"><i class="bi bi-bell"
                style="font-size: 25px; padding-right: 10px"></i> <span
                class="position-relative top-0 translate-middle badge rounded-pill bg-danger" id="count-notify-mobile">
                <span class="visually-hidden"><i class="bi bi-bell"></i></span>
            </span></a>
        <a href="{{ route('logout') }}"
            onclick="window.localStorage.setItem('logeado', false); event.preventDefault();
        document.getElementById('logout-form').submit();"
            style="display: flex; align-items: center; padding-left: 10px; font-size: 14px"><i class="bi bi-door-closed"
                style="font-size: 25px; padding-right: 10px"></i></a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
            @csrf
        </form>
    </div>
    <div class="card content-notify-mobile p-1 border-0 shadow mb-2" id="content-notify-mobile"></div>
</div>
