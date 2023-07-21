<?php

namespace App\Http\Controllers;

use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\Facades\DataTables;
use Intervention\Image\Facades\Image;

class UsuarioController extends Controller
{
    public function usuario($nombre)
    {
        try {
            $usuario = DB::table('users')
                ->select('id', 'u_nombre', 'u_apellido', 'u_nombre_usuario', 'email', 'u_descripcion_perfil', 'u_sexo', 'u_ciudad_residencia', 'u_fecha_nacimiento', 'u_estado', 'u_img_profile')
                ->where('u_nombre_usuario', $nombre)
                ->first();
            $post_user = DB::table('post_user')
                ->where('pu_id_user', Auth::user()->id)
                ->get();
            $anuncios = DB::table('anuncios')
                ->where('a_estado', 1)
                ->get();
            $tocando_count = DB::table('seguidores')
                ->select('u_nombre_usuario', 'u_img_profile')
                ->join('users', 'seguidores.seguidor_id_users', 'users.id')
                ->where('seguido_id_users', Auth::user()->id)
                ->get();
            $tocados_count = DB::table('seguidores')
                ->select('u_nombre_usuario', 'u_img_profile')
                ->join('users', 'seguidores.seguido_id_users', 'users.id')
                ->where('seguidor_id_users', Auth::user()->id)
                ->where('seguido_id_users', '!=', Auth::user()->id)
                ->get();
            $tocado = DB::table('seguidores')
                ->where('seguidor_id_users', Auth::user()->id)
                ->get();
            if ($usuario) {
                return view('perfil', compact('usuario', 'post_user', 'anuncios', 'tocando_count', 'tocados_count', 'tocado'));
            } else {
                return back();
            }
        } catch (Exception $e) {
            return redirect("/");
        }
    }

    public function usuario_actualizar_datos(Request $request)
    {
        $id = $request->get('id');
        $idE = Crypt::decrypt($id);

        $actualizar = User::find($idE);

        $u_nombre_usuario =  strtolower(str_replace(" ", ".", $request->get('u_nombre') . $request->get('u_apellido')));

        $consultaUsuario = DB::table('users')->where('u_nombre_usuario', $u_nombre_usuario)->get();

        if ($consultaUsuario->count() > 0) {
            $u_nombre_usuario = $u_nombre_usuario . $consultaUsuario->count();
        } else {
            $u_nombre_usuario = $u_nombre_usuario;
        }

        $actualizar->u_nombre = $request->get('u_nombre');
        $actualizar->u_apellido = $request->get('u_apellido');
        $actualizar->u_nombre_usuario = $request->get('u_nombre_usuario');
        $actualizar->u_fecha_nacimiento = $request->get('u_fecha_nacimiento');
        $actualizar->u_descripcion_perfil = $request->get('pu_descripcion');
        $actualizar->u_ciudad_residencia = $request->get('u_ciudad_residencia');

        $actualizar->save();

        return redirect('/');
    }

    public function actualizar_usuario_pass(Request $request, $id)
    {
        $usuario = DB::table('users')
            ->where('id', $id)
            ->first();

        if (Hash::check($request->get('u_contrasena_actual'), $usuario->password)) {
            DB::table('users')
                ->where('id', $id)
                ->update([
                    'password' => Hash::make($request->get('u_contrasena_nueva')),
                ]);

            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect('/login');

            return back()->with('mensaje', 'Contraseña actualizada');
        } else {
            return back()->with('mensaje', 'Contraseña actual incorrecta');
        }
    }

    public function actualizar_usuario_email(Request $request, $id)
    {
        $datos = DB::table('users')
            ->select('id', 'email')
            ->where('id', $id)
            ->first();
        if ($request->get('email') == $datos->email) {
            return redirect()->back();
        } else {
            DB::table('users')
                ->where('id', $id)
                ->update([
                    'email' => $request->get('email'),
                ]);
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect('/login')->with('success', 'Correo electronico actualizado, su sesión se ha cerrado por seguridad');
        }
    }

    public function actualizar_usuario_estado(Request $request, $id)
    {
        if ($request->get('u_estado') == 1) {
            $estado_new = 0;
        } else {
            $estado_new = 1;
        }
        DB::table('users')
            ->where('id', $id)
            ->update([
                'u_estado' => $estado_new,
            ]);
        return redirect()
            ->back()
            ->with('success', 'Estado actualizado');
    }

    /*eyngel*/

    public function post_store(Request $request)
    {

        if ($request->hasFile('pu_file') == "" && $request->get('pu_descripcion') == "") {
            $message = "Es necesario agregar descripción o cargar un archivo para registrar su publicación";
            return back()->with('message', $message);
        } else {
            if ($request->hasFile('pu_file')) {
                $file = $request->file('pu_file');
                $filename = time() . '-' . $file->getClientOriginalName();
                $extension = $file->getClientOriginalExtension();

                if ($extension == 'mp4') {
                    $ruta = 'videos/';
                } elseif ($extension == 'jpg' || $extension == 'JPG' || $extension == 'png' || $extension == 'jpeg' || $extension == 'webp') {
                    $ruta = 'img/';
                    $imagen = Image::make($file)->encode($extension, 80);
                    $imagen->save($ruta . $filename);
                }

                $uploadSuccess = $request->file('pu_file')->move($ruta, $filename);
            } else {
                $ruta = "";
                $filename = "";
                $extension = "";
            }

            $pu_id_user = Auth::user()->id;
            $pu_descripcion = nl2br($request->get('pu_descripcion'));

            DB::table('post_user')->insert([
                'pu_id_user' => $pu_id_user,
                'pu_descripcion' => $pu_descripcion,
                'pu_file' => $ruta . $filename,
                'pu_extension' => $extension,
                'pu_timestamp' => Carbon::now(),
            ]);

            return redirect('/');
        }
    }

    public function tocando()
    {
    }

    public function seguirUsuario(Request $request)
    {
        $userAuth = $request->input('userAuth');
        $userFollow = $request->input('userFollow');

        DB::table('seguidores')->insert([
            'seguido_id_users' => $userAuth,
            'seguidor_id_users' => $userFollow,
            'seguidor_timestamp' => Carbon::now(),
        ]);

        DB::table('post_action')->insert([
            'poac_id_user' => $userAuth,
            'poac_id_post' => $userFollow,
            'poac_action' => 3,
            'poac_timestamp' => Carbon::now(),
        ]);

        return response()->json(['mensaje' => 'Datos guardados exitosamente']);
    }

    public function eliminarUsuario(Request $request)
    {
        $userAuth = $request->input('userAuth');
        $userFollow = $request->input('userFollow');

        $consulta_seguidor = DB::table('seguidores')
            ->where('seguido_id_users', $userAuth)
            ->where('seguidor_id_users', $userFollow)
            ->first();

        if ($consulta_seguidor) {
            DB::table('seguidores')
                ->where('seguido_id_users', $userAuth)
                ->where('seguidor_id_users', $userFollow)
                ->delete();

            DB::table('post_action')
                ->where('poac_id_user', $userAuth)
                ->where('poac_id_post', $userFollow)
                ->delete();
        }

        return response()->json(['mensaje' => 'Datos guardados exitosamente']);
    }

    public function postComment(Request $request)
    {
        $post = $request->input('post');
        $user = $request->input('user');
        $comment = $request->input('comment');

        DB::table('post_comment')->insert([
            'poc_id_post' => $post,
            'poc_id_user' => $user,
            'poc_comment' => $comment,
            'poc_timestamp' => Carbon::now(),
        ]);

        DB::table('post_action')->insert([
            'poac_id_user' => $user,
            'poac_id_post' => $post,
            'poac_action' => 2,
            'poac_timestamp' => Carbon::now(),
        ]);

        return response()->json(['mensaje' => 'Datos guardados exitosamente']);
    }

    public function postDelete(Request $request)
    {

        $id = $request->get('id');
        DB::table('post_user')->where('pu_id', $id)->delete();
        return back();
    }

    public function cambiarFotoPerfil(Request $request)
    {
        if ($request->hasFile('img-profile')) {
            $imagen = $request->file('img-profile');
            $ruta = 'images/img-profile-minccy/';
            $filename = time() . '-' . Auth::user()->u_nombre_usuario . '-' . $imagen->getClientOriginalName();
            $uploadSuccess = $request->file('img-profile')->move($ruta, $filename);
        }
        DB::table('users')
            ->where('id', Auth::user()->id)
            ->update([
                'u_img_profile' => $ruta . $filename,
            ]);
        return back();
    }

    public function eliminarFotoPerfil(Request $request)
    {
        $filePath = Auth::user()->u_img_profile;

        $id_user = $request->get('id_user');
        DB::table('users')
            ->where('id', Auth::user()->id)
            ->update([
                'u_img_profile' => '',
            ]);
        unlink($filePath);
        return back();
    }

    public function infoMonetizacion($nombre)
    {
        $usuario = DB::table('users')
            ->select('id', 'u_nombre_usuario', 'email', 'u_descripcion_perfil', 'u_sexo', 'u_ciudad_residencia', 'u_fecha_nacimiento', 'u_estado', 'u_img_profile')
            ->where('u_nombre_usuario', $nombre)
            ->first();
        $tocando_count = DB::table('seguidores')
            ->select('u_nombre_usuario', 'u_img_profile')
            ->join('users', 'seguidores.seguidor_id_users', 'users.id')
            ->where('seguidor_id_users', $usuario->id)
            ->get();
        $tokensCount = DB::table('tokens_count')
            ->join('post_user', 'tokens_count.toc_post_video', '=', 'post_user.pu_id')
            ->where('pu_id_user', Auth::user()->id)
            ->get();
        return view('monetizacion.monetizacion', compact('tocando_count', 'tokensCount'));
    }

    public function eliminarCuenta(Request $request)
    {

        $id = Auth::user()->id;

        $data = DB::table('users')->where('id', $id);

        if ($data) {
            $data->delete();
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            return redirect('/');
        } else {
            return back();
        }
    }

    public function postInfo(Request $request)
    {
        $id = $request->input('id');
        $idUser = $request->input('idUser');
        $postInfo = DB::table('post_user')
            ->join('users', 'post_user.pu_id_user', '=', 'users.id')
            ->where('pu_id', $id)->get();
        return response()->json($postInfo);
    }

    public function postViewComment(Request $request)
    {
        $id = $request->input('id');
        $postViewComment = DB::table('post_comment')
            ->join('users', 'post_comment.poc_id_user', '=', 'users.id')
            ->where('poc_id_post', $id)->orderBy('poc_timestamp', 'desc')->get();
        return response()->json($postViewComment);
    }

    public function buscando(Request $request)
    {

        $q = $request->get('q');

        $qf = trim($q);

        $results = DB::table('users')->select('u_img_profile', 'u_nombre_usuario', 'u_nombre', 'u_apellido', 'u_descripcion_perfil')
            ->where('u_nombre', 'LIKE', '%' . $qf . '%')
            ->orWhere('u_apellido', 'LIKE', '%' . $qf . '%')
            ->orWhere('u_nombre_usuario', 'LIKE', '%' . $qf . '%')
            ->get();

        return view('buscar-usuario', compact('results', 'qf'));
    }


    /*Fin*/
}
