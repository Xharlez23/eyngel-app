<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Eyngel') }}</title>
    @vite(['resources/sass/app.scss', 'resources/js/app.js', 'resources/css/app.css'])
    <link rel="shortcut icon" href="{{ asset('images/icons/icon-logo-200.png') }}" type="image/x-icon">
    <!-- Fonts -->
    <link href="https://fonts.cdnfonts.com/css/pp-neue-montreal" rel="stylesheet">
    @yield('css')
</head>

<body>
    @include('sweetalert::alert')
    <div id="app">
        @if (Auth::check())
            <div class="header">
                <div class="form-buscador">
                    <form action="{{ URL::to('/buscar') }}" method="get">
                        <input class="buscador form-control" type="search" name="q" id="q"
                            placeholder="¿A quien estas buscando?">
                    </form>
                </div>
                <?php $route = request()
                    ->route()
                    ->getName(); ?>
                @if ($route != 'post.view')
                    @include('components.filter-profile')
                @endif
                <div class="saludo">
                    <a href="{{ URL::to('/') }}"><img class="img-nav"
                            src="{{ asset('images/icons/logo-eyngel-header.png') }}" alt=""></a>
                </div>
            </div>
            <div>
                @include('components.menu-movil')
            </div>
        @endif
        @if (Auth::check())
            <div style="width: 100%; position: relative; margin-bottom: 70px" id="menu-movil">
                <div class="container-fluid">
                    <div class="row">
                        @if ($route == 'post.view' || $route == 'promocionar.index')
                            <div class="col-md-12 contenido-nueve">
                                @yield('content')
                            </div>
                        @else
                            <div class="col-md-3 contenido-tres">
                                @include('components.menu-lateral-min')
                            </div>
                            <div class="col-md-9 contenido-nueve">
                                @yield('content')
                            </div>
                        @endif
                    </div>
                </div>
                @if ($route == 'para-ti')
                    @include('components.menu-movil-bottom')
                @endif
            </div>
        @else
            <div class="col-md-12">
                @yield('content')
            </div>
        @endif
    </div>

    @if (Auth::check())
        @include('components.modal-d-cuenta')
    @endif
    <!-- Scripts -->
    <script src="https://www.googletagmanager.com/gtag/js?id=G-S7V99SX7H2"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-6331562434973707"
        crossorigin="anonymous"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'G-S7V99SX7H2')

        window.stylesLoaded = false;

        window.addEventListener('load', function() {
            window.stylesLoaded = true;
        });
    </script>
    <script src="{{ asset('js/login.js') }}"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    @yield('js')

    @if (Auth::check())
        <script src="{{ asset('js/_actionVideo.js') }}"></script>
        <script src="{{ asset('js/_followUser.js') }}"></script>
        <script src="{{ asset('js/_postComment.js') }}"></script>
        <script src="{{ asset('js/_deleteFollow.js') }}"></script>
        <script src="{{ asset('js/_viewOpinion.js') }}"></script>
    @endif
</body>

</html>
