<div class="modal fade" id="modal-seguidores" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body modal-body-profile">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i=1; ?>
                        @foreach ($tocando_count as $data)
                            <tr>
                                <td><img style="width: 40px; height: 40px; object-fit: cover" src="{{ ($data->u_img_profile == "") ?  asset("images/3135768.png") :  asset($data->u_img_profile)}}" alt=""></td>
                                <td><a href="{{URL::to('/'.$data->u_nombre_usuario)}}">{{$data->u_nombre_usuario}}</a></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
