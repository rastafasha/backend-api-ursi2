<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Anillo;
use App\Http\Requests\AnilloStoreRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AnilloController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $anillos = Anillo::get();

        return response()->json([
            'code' => 200,
            'status' => 'List anillos',
            'anillos' => $anillos,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(AnilloStoreRequest $request)
    {

        return Anillo::create($request->all());

        $validator = Validator::make($data, [
            'title' => 'required|string|min:3|max:150',
            'model' => 'required|string|min:3|max:150',
            'description' => 'required',
            'price' => 'required|string|min:3|max:150',
            'status' => 'required|string|min:3|max:150',
        ]);


        if($validator->fails()){
            return response()->json($validator->errors(), 422);
        }

        $anillo = Anillo::firstOrCreate([
            'title' => $request->title,
            'model' => $request->model,
            'description' => $request->description,
            'price' => $request->price,
            'status' => $request->status,
            'create' => true,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Anillo $anillo)
    {

        if (!$anillo) {
            return response()->json([
                'message' => 'anillo not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'anillo' => $anillo,
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
        $anillo = Anillo::findOrfail($id);
        $anillo->title = $request->title;
        $anillo->model = $request->model;
        $anillo->description = $request->description;
        $anillo->price = $request->price;
        $anillo->status = $request->status;
        if($request->image){
            $anillo->image = $request->image;
        }
        $anillo->update();
        return $anillo;
    }

     protected function anilloInput(string $file = null): array
    {
        return [
            "title" => request("title"),
            "model" => request("model"),
            "description" => request("description"),
            "price" => request("price"),
            "status" => request("status"),
        ];
    }

    public function updateStatus(Request $request, $id)
    {
        $anillo = Anillo::findOrfail($id);
        $anillo->status = $request->status;
        $anillo->update();
        return $anillo;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $anillo =  Anillo::where('id', $id)->first();

        if(!empty($anillo)){

             // borrar
             $anillo->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'anillo' => $anillo
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el anillo no existe'
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

             \Storage::disk('anillos')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('anillos')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('anillos')->get($filename);
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
         $anillo = Anillo::findOrFail($id);
         \Storage::delete('anillos/' . $anillo->image);
         $anillo->image = '';
         $anillo->save();
         return response()->json([
             'data' => $anillo,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }
}
