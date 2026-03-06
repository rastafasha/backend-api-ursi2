<?php

namespace App\Http\Controllers;

use App\Models\Aretes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;

class AreteController extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $aretes = Aretes::get();

        return response()->json([
            'code' => 200,
            'status' => 'List aretes',
            'aretes' => $aretes,
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

        return Aretes::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Aretes $arete)
    {

        if (!$arete) {
            return response()->json([
                'message' => 'arete not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'arete' => $arete,
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
        $arete = Aretes::findOrfail($id);
        $arete->title = $request->title;
        $arete->model = $request->model;
        $arete->description = $request->description;
        $arete->price = $request->price;
        $arete->status = $request->status;
        if($request->image){
            $arete->image = $request->image;
        }
        $arete->update();
        return $arete;
    }

    public function updateStatus(Request $request, $id)
    {
        $arete = Aretes::findOrfail($id);
        $arete->status = $request->status;
        $arete->update();
        return $arete;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $arete =  Arete::where('id', $id)->first();

        if(!empty($arete)){

             // borrar
             $arete->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'arete' => $arete
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el arete no existe'
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

             \Storage::disk('aretes')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('aretes')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('aretes')->get($filename);
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
         $arete = Aretes::findOrFail($id);
         \Storage::delete('aretes/' . $arete->image);
         $arete->image = '';
         $arete->save();
         return response()->json([
             'data' => $arete,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
