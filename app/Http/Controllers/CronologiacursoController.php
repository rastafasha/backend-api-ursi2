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
            // "cronologiacursos" => CronogramaCollection::make($cronologiacursos),
            "cronologiacursos" => $cronologiacursos,
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
            "cronologiacurso" => $cronologiacurso,

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
        $cronologiacurso = Cronologiacurso::findOrFail($id);
        if ($cronologiacurso->avatar) {
            Storage::delete($cronologiacurso->avatar);
        }
        $cronologiacurso->delete();
        return response()->json([
            "message" => 200
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
