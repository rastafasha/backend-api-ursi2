<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Str;

class CursoController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $cursos = Curso::get();

        return response()->json([
            'code' => 200,
            'status' => 'List cursos',
            'cursos' => $cursos,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function cursoStore(Request $request)
    {
        return Curso::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cursoShow(Curso $curso)
    {

        if (!$curso) {
            return response()->json([
                'message' => 'Post not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'curso' => $curso,
        ], 200);
    }

    public function destacados()
    {
        $cursos = Curso::select([
            "id",
            'name',
            'name_eng',
            'description',
            'description_eng',
        'isFeatured',
        'adicional',
        'adicional_eng',
        'slug',
        'image',
        'price',
        ])
            ->where('isFeatured', $featured=true)
            ->orderBy('id', 'desc')
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar cursos destacados',
                'cursos' => $cursos,
            ], 200);
    }

    public function activos()
    {
        $cursos = Curso::select([
            "id",
            'name',
            'name_eng',
            'description',
            'description_eng',
        'isFeatured',
        'status',
        'adicional',
        'adicional_eng',
        'slug',
        'image',
        'price'
        ])
            ->where('status', $status="PUBLISHED")
            ->orderBy('id', 'desc')
            // ->limit(10)
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar cursos activos',
                'cursos' => $cursos,
            ], 200);
    }

    public function cursoShowSlug($slug)
    {
        // $post = Post::where('slug', $slug)->first();

        $curso = Curso::select([
            "id",
            'name',
            'name_eng',
            'description',
            'description_eng',
        'price',
        'isFeatured',
        'adicional',
        'adicional_eng',
        'slug',
        ])
            ->where('slug', $slug)
            ->orderBy('id', 'desc')
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar Post by slug',
                'curso' => $curso,
            ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cursoUpdate(Request $request, $id)
    {
        $curso = Curso::findOrfail($id);
        $curso->name = $request->name;
        $curso->name_eng = $request->name_eng;
        $curso->description = $request->description;
        $curso->description_eng = $request->description_eng;
        $curso->adicional = $request->adicional;
        $curso->adicional_eng = $request->adicional_eng;
        $curso->price = $request->price;
        $curso->urlVideo = $request->urlVideo;
        $curso->status = $request->status;
        $curso->modal = $request->modal;
        $curso->slug = $request->slug;
        $curso->isFeatured = $request->isFeatured;
        // $curso->image = $request->image;
        if($request->image){
            $curso->image = $request->image;
        }
        $curso->update();
        return $curso;
    }

    public function cursoUpdateStatus(Request $request, $id)
    {
        $curso = Curso::findOrfail($id);
        $curso->status = $request->status;
        $curso->update();
        return $curso;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $curso =  Curso::where('id', $id)->first();

        if(!empty($curso)){
             // borrar
             $curso->delete();
            //  $curso = $this->deleteFotoCurso($id);
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'curso' => $curso
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el curso no existe'
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

             \Storage::disk('cursos')->put($image_name, \File::get($image));

             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'image' => $image_name
             ];

         }

         return response()->json($data, $data['code']);// devuelve un objeto json
     }

     public function uploadImageGallery(Request $request)
     {
         // recoger la imagen de la peticion
         $imageGallery = $request->file('file0');
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
            $extension = $imageGallery->getClientOriginalExtension();
            $image_name = $imageGallery->getClientOriginalName();
            $pathFileName = trim(pathinfo($image_name, PATHINFO_FILENAME));
            $secureMaxName = substr(Str::slug($image_name), 0, 90);
            $image_name = now().$secureMaxName.'.'.$extension;

             \Storage::disk('cursos')->put($image_name, \File::get($imageGallery));

             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'imageGallery' => $image_name
             ];

         }

         return response()->json($data, $data['code']);// devuelve un objeto json
     }

     public function getImage($filename)
     {

         //comprobar si existe la imagen
         $isset = \Storage::disk('cursos')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('cursos')->get($filename);
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

     public function deleteFotoCurso($id)
     {
         $curso = Curso::findOrFail($id);
         \Storage::delete('cursos/' . $curso->image);
         $curso->image = '';
         $curso->save();
         return response()->json([
             'data' => $curso,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }


     public function cursoByCategory()
     {
         // $this->authorize('index', User::class);

         $cursos = Curso::get()
             ->withCount([
                 "categories",
             ])
             ->orderBy('id', 'desc')
             ->get();

             return response()->json([
                 'code' => 200,
                 'status' => 'Listar cursos by Category',
                 'cursos' => $cursos,
             ], 200);
     }

     public function search(Request $request){

        return Curso::search($request->buscar);

    }
}
