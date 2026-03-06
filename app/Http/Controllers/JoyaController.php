<?php

namespace App\Http\Controllers;

use App\Models\Joyas;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;

class JoyaController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $joyas = Joyas::get();

        return response()->json([
            'code' => 200,
            'status' => 'List joyas',
            'joyas' => $joyas,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        return Joyas::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Joyas $joya)
    {

        if (!$joya) {
            return response()->json([
                'message' => 'joya not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'joya' => $joya,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $joya = Joyas::findOrfail($id);
        $joya->status = $request->status;
        // $joya->image = $request->image;
        if($request->image){
            $joya->image = $request->image;
        }
        $joya->update();
        return $joya;
    }

    public function updateStatus(Request $request, $id)
    {
        $joya = Joyas::findOrfail($id);
        $joya->status = $request->status;
        $joya->update();
        return $joya;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $joya =  Joyas::where('id', $id)->first();

        if(!empty($joya)){

             // borrar
             $joya->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'joya' => $joya
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el joya no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }


    /**
     * @param UploadedFile $file
     * @return string
     */
    protected function generateFileName(UploadedFile $file): string {
        $extension = $file->getClientOriginalExtension();
        $fullName = $file->getClientOriginalName();
        $pathFileName = trim(pathinfo($fullName, PATHINFO_FILENAME));
        $secureMaxName = substr(Str::slug($pathFileName), 0, 90);
        return sprintf('%s-%s.%s', $secureMaxName, now()->timestamp, $extension);
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

            \Storage::disk('joyas')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('joyas')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('joyas')->get($filename);
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

     public function deleteFoto($id)
     {
         $joya = Joyas::findOrFail($id);
         \Storage::delete('joyas/' . $joya->image);
         $joya->image = '';
         $joya->save();
         return response()->json([
             'data' => $joya,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
