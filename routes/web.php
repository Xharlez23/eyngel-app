<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
*/

Route::get('/', function (Request $request) {
    if (Auth::check() && $request->user()->hasVerifiedEmail()) {
        return redirect('/para-ti');
    } else {
        $ip = $request->ip();
        return view('auth.login', compact('ip'));
    }
});

Route::get('/login', function (Request $request) {
   
    if (Auth::check()) {
        $user = DB::table('users')->where('id', Auth::user()->id)->first();
        return view('home', compact('user'));
    }else{
        $ip = $request->ip();
        return view('auth.login', compact('ip'));
    }
});

Auth::routes(['verify' => true]);


Route::prefix('admin')
    ->middleware(['auth', 'isAdmin'])
    ->group(function () {
        /*Tienda*/
        Route::get('/tienda/', [App\Http\Controllers\TiendaController::class, 'index_admin']);
        Route::get('/tienda/crear-producto/{nombre}', [App\Http\Controllers\TiendaController::class, 'create']);
        Route::get('/tienda/crear-empresa', [App\Http\Controllers\TiendaController::class, 'create_empresa']);
        Route::post('/tienda/registro-empresa', [App\Http\Controllers\TiendaController::class, 'registroEmpresa']);
        Route::post('/tienda/registro-producto', [App\Http\Controllers\TiendaController::class, 'registroProducto']);
        Route::delete('/tienda/eliminar-empresa/{nombre}', [App\Http\Controllers\TiendaController::class, 'eliminarEmpresa']);
        Route::delete('/tienda/eliminar-producto/{nombre}', [App\Http\Controllers\TiendaController::class, 'eliminarProducto']);
        /*Productos */
        Route::get('/productos/', [App\Http\Controllers\TProductoController::class, 'index']);
        Route::get('/crear-productos', [App\Http\Controllers\TProductoController::class, 'create']);
        Route::delete('/eliminar-productos/{id}', [App\Http\Controllers\TProductoController::class, 'destroy']);
        Route::post('/productos-store', [App\Http\Controllers\TProductoController::class, 'store'])->name('productos.store');
        Route::get('/productos/{id}', [App\Http\Controllers\TProductoController::class, 'edit'])->name('productos.edit');
        Route::put('/productos-actualizar/{id}', [App\Http\Controllers\TProductoController::class, 'update'])->name('productos.update');
        /* Anuncios */
        Route::get('/anuncio', [App\Http\Controllers\AnuncioController::class, 'index']);
        Route::get('/crear-anuncio', [App\Http\Controllers\AnuncioController::class, 'create']);
        Route::delete('/eliminar-anuncio/{id}', [App\Http\Controllers\AnuncioController::class, 'destroy']);
        Route::post('/anuncios-store', [App\Http\Controllers\AnuncioController::class, 'store'])->name('anuncios.store');
        Route::get('/anuncios/{id}', [App\Http\Controllers\AnuncioController::class, 'edit'])->name('anuncios.edit');
        Route::put('/anuncios-actualizar/{id}', [App\Http\Controllers\AnuncioController::class, 'update'])->name('anuncios.update');

        /* Peliculas */
        Route::get('/crear-pelicula', [App\Http\Controllers\MovieController::class, 'create']);
        Route::delete('/eliminar-pelicula/{id}', [App\Http\Controllers\MovieController::class, 'destroy']);
        Route::post('/pelicula-store', [App\Http\Controllers\MovieController::class, 'store'])->name('movies.store');
        Route::get('/pelicula/{id}', [App\Http\Controllers\MovieController::class, 'edit'])->name('anuncios.edit');
        Route::put('/pelicula-actualizar/{id}', [App\Http\Controllers\MovieController::class, 'update'])->name('anuncios.update');
    });

Route::get('/politica-privacidad', function () {
    return view('privacidad-datos');
});

Route::get('/politica-de-cookies', function () {
    return view('politica-cookies');
});

Route::post('/register-bussines', [App\Http\Controllers\EmpresaController::class, 'store'])->name('empresa.store');

Route::middleware(['auth','verified'])->group(function () {

    Route::put('/actualizar-politica', [App\Http\Controllers\HomeController::class, 'actualizarPolitica']);

    //Usuarios - actualizar datos
    Route::get('/datos-basicos/{id}', [App\Http\Controllers\HomeController::class, 'mostrar_datos_usuario']);
    Route::put('/actualizar-usuario/{id}', [App\Http\Controllers\UsuarioController::class, 'actualizar_datos']);
    Route::get('/correo-electronico/{id}', [App\Http\Controllers\HomeController::class, 'mostrar_correo']);
    Route::put('/actualizar-usuario-email/{id}', [App\Http\Controllers\UsuarioController::class, 'actualizar_usuario_email']);
    Route::get('/cambio-contrasena/{id}', [App\Http\Controllers\HomeController::class, 'mostrar_contrasena']);
    Route::put('/actualizar-usuario-pass/{id}', [App\Http\Controllers\UsuarioController::class, 'actualizar_usuario_pass']);

    /*Tienda*/
    Route::get('/tienda', [App\Http\Controllers\TiendaController::class, 'index'])->name('tienda.index');
    Route::get('/tienda/dashboard-tienda', [App\Http\Controllers\TiendaController::class, 'dashboard']);
    Route::get('/tienda/{nombre}', [App\Http\Controllers\TiendaController::class, 'show_producto']);
    Route::get('/tienda/{empresa}/producto/{nombre}', [App\Http\Controllers\TiendaController::class, 'producto_vista']);
    /*Productos */
    Route::get('/productos', [App\Http\Controllers\TProductoController::class, 'index']);
    /*Peliculas*/
    Route::get('/sala-de-entretenimiento', [App\Http\Controllers\MovieController::class, 'index']);
    Route::get('/sala-de-entretenimiento/{slug}', [App\Http\Controllers\MovieController::class, 'show'])->name('peliculas.video');

    Route::put('/cambiar-foto-perfil', [App\Http\Controllers\UsuarioController::class, 'cambiarFotoPerfil']);
    Route::put('/eliminar-foto-perfil', [App\Http\Controllers\UsuarioController::class, 'eliminarFotoPerfil']);
    
    Route::get('/post', [App\Http\Controllers\HomeController::class, 'getPost']);

    Route::get('/para-ti', [App\Http\Controllers\HomeController::class, 'index'])->name('para-ti');
    Route::get('/{usuario}/post/{video}', [App\Http\Controllers\HomeController::class, 'postSpecific'])->name('post.view');
    Route::get('/cargar', [App\Http\Controllers\HomeController::class, 'postViewUpload'])->name('post.cargar');
    Route::post('/card-post-store', [App\Http\Controllers\UsuarioController::class, 'post_store']);
    Route::delete('/post-delete', [App\Http\Controllers\UsuarioController::class, 'post_delete']);
    Route::post('/follow-user', [App\Http\Controllers\UsuarioController::class, 'seguirUsuario']);
    Route::post('/post-commet', [App\Http\Controllers\UsuarioController::class, 'postComment']);
    Route::delete('/post-delete', [App\Http\Controllers\UsuarioController::class, 'postDelete'])->name('post.delete');
    Route::get('/post-opinion', [App\Http\Controllers\UsuarioController::class, 'postInfo']);
    Route::get('/post-view-comment', [App\Http\Controllers\UsuarioController::class, 'postViewComment']);

    Route::put('/{nombre}/update-profile', [App\Http\Controllers\UsuarioController::class, 'usuario_actualizar_datos']);

    /*Buscador*/
    Route::get('/buscar', [App\Http\Controllers\UsuarioController::class, 'buscando']);
    /*Fin*/

    /*PostAction*/
    Route::get('/post-count', [App\Http\Controllers\PostActionController::class, 'getLikes']);
    Route::post('/post-action', [App\Http\Controllers\PostActionController::class, 'postAction']);
    Route::delete('/post-action-delete', [App\Http\Controllers\PostActionController::class, 'postActionDelete']);
    Route::get('/notificaciones', [App\Http\Controllers\PostActionController::class, 'obtenerNofificacionesComentarios']);
    Route::post('/tokens-one', [App\Http\Controllers\PostActionController::class, 'tokens_inicio']);
    Route::delete('/post-delete', [App\Http\Controllers\PostActionController::class, 'postDelete']);
    Route::put('/post-edit', [App\Http\Controllers\PostActionController::class, 'postEdit']);
    Route::put('/post-most-notify', [App\Http\Controllers\PostActionController::class, 'checkNotificacion']);
    /*End*/


    Route::delete('/delete-follow-user', [App\Http\Controllers\UsuarioController::class, 'eliminarUsuario']);

    /*Monetización*/
    Route::get('/{nombre}/monetizacion', [App\Http\Controllers\UsuarioController::class, 'infoMonetizacion']);
    /*Fin*/

    /*configuracion-privacidad-perfil*/
    Route::delete('/delete-count', [App\Http\Controllers\UsuarioController::class, 'eliminarCuenta']);
    /*Fin*/

    /*promocionar publicidad*/
    Route::get('/centro-de-promocion/crear', [App\Http\Controllers\CentroPromocionController::class, 'index'])->name('promocionar.index');
    /**/

    Route::get('/{nombre}', [App\Http\Controllers\UsuarioController::class, 'usuario']);
});
