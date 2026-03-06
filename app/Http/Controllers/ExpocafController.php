<?php

namespace App\Http\Controllers;

use App\Models\Expocaf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;

class ExpocafController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $expocafs = Expocaf::get();

        return response()->json([
            'code' => 200,
            'status' => 'List expocafs',
            'expocafs' => $expocafs,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function Store(Request $request)
    {

        return Expocaf::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Expocaf $expocaf)
    {

        if (!$expocaf) {
            return response()->json([
                'message' => 'expocaf not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'expocaf' => $expocaf,
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
        $expocaf = Expocaf::findOrfail($id);
        $expocaf->status = $request->status;
        // $expocaf->image = $request->image;
        if($request->image){
            $expocaf->image = $request->image;
        }
        $expocaf->update();
        return $expocaf;
    }

    public function updateStatus(Request $request, $id)
    {
        $expocaf = Expocaf::findOrfail($id);
        $expocaf->status = $request->status;
        $expocaf->update();
        return $expocaf;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $expocaf =  Expocaf::where('id', $id)->first();

        if(!empty($expocaf)){

             // borrar
             $expocaf->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'expocaf' => $expocaf
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el expocaf no existe'
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

             \Storage::disk('expocafs')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('expocafs')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('expocafs')->get($filename);
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
         $expocaf = Expocaf::findOrFail($id);
         \Storage::delete('expocafs/' . $expocaf->image);
         $expocaf->image = '';
         $expocaf->save();
         return response()->json([
             'data' => $expocaf,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
