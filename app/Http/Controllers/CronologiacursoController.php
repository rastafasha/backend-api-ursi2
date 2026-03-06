<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Cronograma\CronogramaCollection;
use App\Http\Resources\Cronograma\CronogramaResource;
use App\Models\Cronologiacurso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CronologiacursoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $cronologiacursos = Cronologiacurso::get();

       return response()->json([
            'code' => 200,
            'status' => 'List herramientas',
            "cronologiacursos" => CronogramaCollection::make($cronologiacursos),
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function cronologiacursoStore(Request $request)
    {

        $cronologiacurso_is_valid = Cronologiacurso::where("id", $request->id)->first();

        if ($cronologiacurso_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el cronologiacurso  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("cronologiacursos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $cronologiacurso = Cronologiacurso::create($request->all());

        $request->request->add([
            "cronologiacurso_id" => $cronologiacurso->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cronologiacursoShow($id)
    {

        $cronologiacurso = Cronologiacurso::find($id);

        return response()->json([
            "cronologiacurso" => CronogramaResource::make($cronologiacurso),

        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cronologiacursoUpdate(Request $request, $id)
    {
        $cronologiacurso = Cronologiacurso::findOrfail($id);
       if ($request->hasFile('imagen')) {
            if ($cronologiacurso->avatar) {
                Storage::delete($cronologiacurso->avatar);
            }
            $path = Storage::putFile("cronologiacursos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $cronologiacurso->update($request->all());

        return response()->json([
            "message" => 200,
            "cronologiacurso" => $cronologiacurso
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $cronologiacurso =  Cronologiacurso::where('id', $id)->first();

        if(!empty($cronologiacurso)){

             // borrar
             $cronologiacurso->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'cronologiacurso' => $cronologiacurso
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el cronologiacurso no existe'
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

             \Storage::disk('cronologiacursos')->put($image_name, \File::get($image));

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
         $isset = \Storage::disk('cronologiacursos')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('cronologiacursos')->get($filename);
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

     public function deleteFotoCronologiacurso($id)
     {
         $cronologiacurso = Cronologiacurso::findOrFail($id);
         \Storage::delete('cronologiacursos/' . $cronologiacurso->image);
         $cronologiacurso->image = '';
         $cronologiacurso->save();
         return response()->json([
             'data' => $cronologiacurso,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }

      public function cronologiacursoUpdateStatus(Request $request, $id)
    {
        $cronologiacurso = Cronologiacurso::findOrfail($id);
        $cronologiacurso->status = $request->status;
        $cronologiacurso->update();
        return $cronologiacurso;
    }


     public function activos()
    {
        $cronologiacursos = Cronologiacurso::where('status', $status="PUBLISHED")
            ->orderBy('id', 'desc')
            // ->limit(10)
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar cursos activos',
                'cronologiacursos' => $cronologiacursos,
            ], 200);
    }

     public function search(Request $request){

        return Cronologiacurso::search($request->buscar);

    }
}
