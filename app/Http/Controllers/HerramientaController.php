<?php

namespace App\Http\Controllers;

use App\Http\Resources\Herramienta\HerramientaCollection;
use App\Http\Resources\Herramienta\HerramientaResource;
use App\Models\Herramienta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class HerramientaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $herramientas = Herramienta::get();

        return response()->json([
            'code' => 200,
            'status' => 'List herramientas',
            // 'herramientas' => $herramientas,
            "herramientas" => HerramientaCollection::make($herramientas),
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function HerramientaStore(Request $request)
    {

        $herramienta_is_valid = Herramienta::where("id", $request->id)->first();

        if ($herramienta_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'la herramienta  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("herramientas", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $herramienta = Herramienta::create($request->all());

        $request->request->add([
            "company_id" => $herramienta->id
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

        $herramienta = Herramienta::find($id);

        return response()->json([
            "herramienta" => HerramientaResource::make($herramienta),

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
        $herramienta = Herramienta::findOrfail($id);


        if ($request->hasFile('imagen')) {
            if ($herramienta->avatar) {
                Storage::delete($herramienta->avatar);
            }
            $path = Storage::putFile("herramientas", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $herramienta->update($request->all());


        return response()->json([
            "message" => 200,
            // "herramienta"=>HerramientaResource::make($herramienta)
            "herramienta" => $herramienta
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $herramienta = Herramienta::findOrfail($id);
        $herramienta->status = $request->status;
        $herramienta->update();
        return $herramienta;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $herramienta = Herramienta::where('id', $id)->first();

        $herramienta = Herramienta::findOrFail($id);
        if ($herramienta->avatar) {
            Storage::delete($herramienta->avatar);
        }
        $herramienta->delete();
        return response()->json([
            "message" => 200
        ]);
    }

    /**
     * @param UploadedFile $file
     * @return string
     */





}
