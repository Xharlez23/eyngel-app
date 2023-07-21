<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PostAction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PostActionController extends Controller
{

    public function getLikes()
    {

        $post_like = DB::table('post_action')->selectRaw('count(*) as like_count, poac_id_post')->where('poac_action', 1)->groupBy('poac_id_post')->get();

        $likes = [];

        foreach ($post_like as $post) {
            $likesT = $post->like_count;
            $likes[$post->poac_id_post] = $likesT;
        }

        return response()->json([
            'likes' => $likes
        ]);
    }

    public function postAction(Request $request)
    {
        $auth = $request->input('auth');
        $video = $request->input('video');

        $postAction = new PostAction();
        $postAction->poac_id_user = $auth;
        $postAction->poac_id_post = $video;
        $postAction->poac_action = 1;
        $postAction->poac_timestamp = Carbon::now();

        $postAction->save();

        $likes = PostAction::where('poac_id_post', $video)->count();

        return response()->json(['likes' => $likes]);
    }

    public function postActionDelete(Request $request)
    {
        $auth = $request->input('auth');
        $video = $request->input('video');

        DB::table('post_action')
            ->where('poac_id_user', $auth)
            ->where('poac_id_post', $video)
            ->delete();

        $likes = PostAction::where('poac_id_post', $video)->count();

        return response()->json(['likes' => $likes]);
    }

    public function postEdit(Request $request)
    {
        $id = $request->input('id');
        $descripcion = $request->input('descripcion');

        $edit = DB::table("post_user")
            ->where('pu_id', $id)
            ->update([
                'pu_descripcion' => nl2br($descripcion)
            ]);

        if($edit){
            return response()->json(['mensaje' => 'actualizado']);
        }else{
            return redirect("/");
        }
    }

    public function notificaciones()
    {
        $contador = DB::table('post_action')
            ->where('poac_id_user', Auth::user()->id)
            ->where('poac_check', '0')
            ->count();
        return response()->json($contador);
    }

    public function obtenerNofificacionesComentarios(){
        $notificaciones = DB::table('users')
            ->select('pu_id','u_nombre_usuario','u_img_profile','poac_id_user','poac_id_post','poac_action','poac_timestamp','poac_check','users.id')
            ->join('post_action','users.id','=','post_action.poac_id_user')
            ->join('post_user','post_action.poac_id_post','=','post_user.pu_id')
            ->where('post_user.pu_id_user', Auth::user()->id)
            ->where('poac_id_user','!=',Auth::user()->id)
            ->where('poac_check', 0)
            ->orderByDesc('poac_timestamp')
            ->get();
        return response()->json(['notificaciones' => $notificaciones]);
    }

    public function checkNotificacion(Request $request){
        $user = $request->input('user');
        $post = $request->input('post');
        $check = DB::table('post_action')
            ->where('poac_id_user', $user)
            ->where('poac_id_post', $post)
            ->update([
                'poac_check' => 1
            ]);
        return response()->json(['check' => $check]);
    }

    public function tokens_inicio(Request $request)
    {

        $idVideo = $request->input('idVideo');
        $idUser = $request->input('idUser');

        $fecha = Carbon::now()->format("Y-m-d");

        $consultaTokensDiario = DB::table('tokens_count')
            ->where('toc_post_video', $idVideo)
            ->where('toc_id_user', Auth::user()->id)
            ->get();

        if ($consultaTokensDiario->count() == 2) {
            return response()->json(['mensaje' => 'Token video recogido']);
        } else {
            DB::table('tokens_count')->insert([
                'toc_post_video' => $idVideo,
                'toc_id_user' => $idUser,
                'toc_id_por_video' => 0.5,
                'toc_fecha' => $fecha,
            ]);

            return response()->json(['mensaje' => $consultaTokensDiario->count()]);
        }
    }

    public function postDelete(Request $request)
    {
        $id = $request->input('id');

        DB::table('post_user')
            ->where('pu_id', $id)
            ->delete();

        return response()->json(['mensaje' => 'Datos guardados exitosamente']);
    }
}
