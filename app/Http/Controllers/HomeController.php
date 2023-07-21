<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function getPost()
    {
        $post_users = DB::table('post_user')->join('users', 'post_user.pu_id_user', '=', 'users.id')->orderBy('pu_timestamp', 'desc')->get();
        return response()->json($post_users);
    }

    public function index(Request $request)
    {
        try {
            if (Auth::user()->u_role == 0) {
                $id = Auth::user()->id;
                $anuncios = DB::table('anuncios')->where('a_estado', 1)->get();
                $usuario = DB::table('users')->where('id', Auth::user()->id)->first();
                $post_users = DB::table('post_user')->join('users', 'post_user.pu_id_user', '=', 'users.id')->orderBy('pu_timestamp', 'desc')->get();
                $friends_city = DB::table('users')->join('seguidores', 'users.id', '=', 'seguidores.seguidor_id_users')->where('id', '!=', Auth::user()->id)->where('u_ciudad_residencia', Auth::user()->u_ciudad_residencia)->get();
                $paises = DB::table('pais')->get();
                $sugerencias = DB::table('users')
                    ->whereNotIn('id', function ($query) use ($id) {
                        $query->select('seguidor_id_users')
                            ->from('seguidores')
                            ->where('seguido_id_users', $id);
                    })
                    ->where('id', '!=', $id)
                    ->where('u_ciudad_residencia', Auth::user()->u_ciudad_residencia)
                    ->get();
                return view('home', compact('usuario', 'anuncios', 'paises', 'post_users', 'friends_city', 'sugerencias'));
            }
        } catch (Exception $e) {
            return back()->with('warning', 'Algo paso, intentalo de nuevo');
        }
    }

    public function postSpecific($user, $video)
    {
        $usuario = DB::table('users')
            ->where('u_nombre_usuario', $user)
            ->first();
        $post = DB::table('post_user')
            ->join('users', 'post_user.pu_id_user', '=', 'users.id')
            ->where('pu_id_user', $usuario->id)
            ->where('pu_id', $video)
            ->first();
        $postComments = DB::table('post_comment')
            ->join('users', 'post_comment.poc_id_user', '=', 'users.id')
            ->where('poc_id_post', $video)
            ->orderBy('poc_timestamp', 'desc')
            ->get();
        return view('post', compact('usuario', 'post', 'postComments'));
    }

    public function postViewUpload()
    {
        $usuario = DB::table('users')->where('id', Auth::user()->id)->first();
        $anuncios = DB::table('anuncios')->where('a_estado', 1)->get();
        return view('cargar-post', compact('usuario', 'anuncios'));
    }

    public function politicaPrivacidad()
    {
        return view('privacidad-datos');
    }

    public function contacto()
    {
        return view('contacto');
    }

    public function actualizarPolitica(Request $request)
    {
        DB::table('users')
            ->where('users.id', Auth::user()->id)
            ->update(['u_term_con' => $request->get('u_term_con')]);
        return redirect('/dashboard')->with('warning', 'Registro de politica de privacidad realizado, puede continuar con sus actividades');
    }
}
