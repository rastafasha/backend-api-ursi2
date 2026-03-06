<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Curso\CursoCollection;
use App\Http\Resources\Curso\CursoResource;
use App\Models\Curso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

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
            // 'herramientas' => $herramientas,
            "cursos" => CursoCollection::make($cursos),
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
        $curso_is_valid = Curso::where("id", $request->id)->first();

        if ($curso_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el curso  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("cursos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $curso = Curso::create($request->all());

        $request->request->add([
            "curso_id" => $curso->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cursoShow($id)
    {
        $curso = Curso::find($id);

        return response()->json([
            "curso" => CursoResource::make($curso),

        ]);
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
        if ($request->hasFile('imagen')) {
            if ($curso->avatar) {
                Storage::delete($curso->avatar);
            }
            $path = Storage::putFile("cursos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $curso->update($request->all());


        return response()->json([
            "message" => 200,
            // "herramienta"=>HerramientaResource::make($herramienta)
            "curso" => $curso
        ]);
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

        $curso =  curso::where('id', $id)->first();

        $curso = curso::findOrFail($id);
        if ($curso->avatar) {
            Storage::delete($curso->avatar);
        }
        $curso->delete();
        return response()->json([
            "message" => 200
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
