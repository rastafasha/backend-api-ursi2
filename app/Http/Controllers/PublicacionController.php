<?php

namespace App\Http\Controllers;

use App\Models\Publicaciones;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class PublicacionController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $publicaciones = Publicaciones::get();

        return response()->json([
            'code' => 200,
            'status' => 'List publicaciones',
            'publicaciones' => $publicaciones,
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

        $publicacion_is_valid = Publicaciones::where("id", $request->id)->first();

        if ($publicacion_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el publicacion  ya existe'
            ]);
        }

        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("publicacions", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $publicacion = Publicaciones::create($request->all());

        $request->request->add([
            "publicacion_id" => $publicacion->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $publicacion = Publicaciones::find($id);

        return response()->json([
            "publicacion" => $publicacion
        ]);
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
        $publicacion = Publicaciones::findOrfail($id);
       if ($request->hasFile('imagen')) {
            if ($publicacion->avatar) {
                Storage::delete($publicacion->avatar);
            }
            $path = Storage::putFile("publicacions", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $publicacion->update($request->all());

        return response()->json([
            "message" => 200,
            "publicacion" => $publicacion
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $publicacion = Publicaciones::findOrfail($id);
        $publicacion->status = $request->status;
        $publicacion->update();
        return $publicacion;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $publicacion =  Publicaciones::where('id', $id)->first();

        $publicacion = Publicaciones::findOrFail($id);
        if ($publicacion->avatar) {
            Storage::delete($publicacion->avatar);
        }
        $publicacion->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
