<?php

namespace App\Http\Controllers;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $this->authorize('index', User::class);

        $profiles = Profile::orderBy('created_at', 'DESC')
        ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar todos los Perfiles',
                'profiles' => $profiles,
            ], 200);
    }

    public function profileStore(Request $request)
    {
        return Profile::create($request->all());
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profileShow(Profile $profile)
    {
        // $this->authorize('userShow', User::class);

        if (!$profile) {
            return response()->json([
                'message' => 'Profile not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'profile' => $profile,
        ], 200);
    }

    public function profileShowUser($id)
    {
        // $this->authorize('userShow', User::class);

        $profile = Profile::where('user_id', $id)->first();

        if (!$profile) {
            return response()->json([
                'message' => 'Profile not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'profile' => $profile,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profileUpdate(Request $request, $id)
    {
        // $this->authorize('userUpdate', User::class);

        $profile = Profile::findOrfail($id);
        $profile->user_id = $request->user_id;
        $profile->nombre = $request->nombre;
        $profile->surname = $request->surname;
        $profile->direccion = $request->direccion;
        $profile->estado = $request->estado;
        $profile->ciudad = $request->ciudad;
        $profile->telhome = $request->telhome;
        $profile->telmovil = $request->telmovil;
        $profile->facebook = $request->facebook;
        $profile->instagram = $request->instagram;
        $profile->twitter = $request->twitter;
        $profile->linkedin = $request->linkedin;
        $profile->status = $request->status;
        // $profile->image = $request->image;
        if($request->image){
            $profile->image = $request->image;
        }
        $profile->update();
        return $profile;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $profile =  Profile::where('id', $id)->first();

        if(!empty($profile)){

             // borrar
             $profile->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'profile' => $profile
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el profile no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }

    protected function profileInput(): array
    {
        return [
            "nombre" => request("nombre"),
            "surname" => request("surname"),
            "direccion" => request("direccion"),
            "pais" => request("pais"),
            "estado" => request("estado"),
            "ciudad" => request("ciudad"),
            "telhome" => request("telhome"),
            "telmovil" => request("telmovil"),
            "facebook" => request("facebook"),
            "instagram" => request("instagram"),
            "twitter" => request("twitter"),
            "linkedin" => request("linkedin"),
            "image" => request("image"),
            "email" => request("email"),
            "status" => request("status"),
        ];
    }

    public function recientes()
    {
        // $this->authorize('recientes', User::class);

        $profiles = User::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'profiles' => $profiles
        ], 200);
    }

    public function upload(Request $request)
     {
         // recoger la imagen de la peticion
         $image = $request->file('file0');
         // validar la imagen
         $validate = \Validator::make($request->all(),[
             'file0' => 'required|image|mimes:jpg,jpeg,png,gif'
         ]);
         //guardar la imagen en un disco
         if(!$image || $validate->fails()){
             $data = [
                 'code' => 400,
                 'status' => 'error',
                 'message' => 'Error al subir la imagen'
             ];
         }else{
            $extension = $image->getClientOriginalExtension();
            $image_name = $image->getClientOriginalName();
            $pathFileName = trim(pathinfo($image_name, PATHINFO_FILENAME));
            $secureMaxName = substr(Str::slug($image_name), 0, 90);
            $image_name = now().$secureMaxName.'.'.$extension;

             \Storage::disk('profiles')->put($image_name, \File::get($image));

             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'image' => $image_name
             ];

         }

         return response()->json($data, $data['code']);// devuelve un objeto json
     }

     public function getImage($filename)
     {

         //comprobar si existe la imagen
         $isset = \Storage::disk('profiles')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('profiles')->get($filename);
             return new Response($file, 200);
         } else {
             $data = array(
                 'status' => 'error',
                 'code' => 404,
                 'mesaje' => 'Imagen no existe',
             );

             return response()->json($data, $data['code']);
         }

     }

     public function deleteFotoProfile($id)
     {
         $profile = Profile::findOrFail($id);
         \Storage::delete('profiles/' . $profile->image);
         $profile->image = '';
         $profile->save();
         return response()->json([
             'data' => $profile,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
