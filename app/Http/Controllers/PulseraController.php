<?php

namespace App\Http\Controllers;

use App\Models\Pulseras;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;

class PulseraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $pulseras = Pulseras::get();

        return response()->json([
            'code' => 200,
            'status' => 'List pulseras',
            'pulseras' => $pulseras,
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

        return Pulseras::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Pulseras $pulsera)
    {

        if (!$pulsera) {
            return response()->json([
                'message' => 'pulsera not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'pulsera' => $pulsera,
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
        $pulsera = Pulseras::findOrfail($id);
        $pulsera->title = $request->title;
        $pulsera->model = $request->model;
        $pulsera->description = $request->description;
        $pulsera->price = $request->price;
        $pulsera->status = $request->status;
        // $pulsera->image = $request->image;
        if($request->image){
            $pulsera->image = $request->image;
        }
        $pulsera->update();
        return $pulsera;
    }

    public function updateStatus(Request $request, $id)
    {
        $pulsera = Pulseras::findOrfail($id);
        $pulsera->status = $request->status;
        $pulsera->update();
        return $pulsera;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $pulsera =  Pulseras::where('id', $id)->first();

        if(!empty($pulsera)){

             // borrar
             $pulsera->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'pulsera' => $pulsera
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el pulsera no existe'
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

             \Storage::disk('pulseras')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('pulseras')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('pulseras')->get($filename);
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
         $pulsera = Pulseras::findOrFail($id);
         \Storage::delete('pulseras/' . $pulsera->image);
         $pulsera->image = '';
         $pulsera->save();
         return response()->json([
             'data' => $pulsera,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
