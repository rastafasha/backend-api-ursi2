<?php

namespace App\Http\Controllers;

use App\Models\Galleryschool;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use App\Http\Requests\PostStoreRequest;
use Illuminate\Support\Str;

class GalleryschoolController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $galleryschools = Galleryschool::get();

        return response()->json([
            'code' => 200,
            'status' => 'List galleryschools',
            'galleryschools' => $galleryschools,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function galleryschoolStore(Request $request)
    {

        return Galleryschool::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function galleryschoolShow(Galleryschool $galleryschool)
    {

        if (!$galleryschool) {
            return response()->json([
                'message' => 'galleryschool not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'galleryschool' => $galleryschool,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function GalleryschoolUpdate(Request $request, $id)
    {
        $galleryschool = Galleryschool::findOrfail($id);
        $galleryschool->title = $request->title;
        // $galleryschool->image = $request->image;
        if($request->image){
            $galleryschool->image = $request->image;
        }
        $galleryschool->update();
        return $galleryschool;
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $galleryschool =  Galleryschool::where('id', $id)->first();

        if(!empty($galleryschool)){

             // borrar
             $galleryschool->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'espocaf' => $galleryschool
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el galleryschool no existe'
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

             \Storage::disk('galleryschools')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('galleryschools')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('galleryschools')->get($filename);
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

     public function deleteFotoGalleryschool($id)
     {
         $galleryschool = Galleryschool::findOrFail($id);
         \Storage::delete('galleryschools/' . $galleryschool->image);
         $galleryschool->image = '';
         $galleryschool->save();
         return response()->json([
             'data' => $galleryschool,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
