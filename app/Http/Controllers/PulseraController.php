<?php

namespace App\Http\Controllers;

use App\Models\Pulseras;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class PulseraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $pulseras = Pulseras::get();

        return response()->json([
            'code' => 200,
            'status' => 'List pulseras',
            'pulseras' => $pulseras,
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

        $pulsera_is_valid = Pulseras::where("id", $request->id)->first();

        if ($pulsera_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el pulsera  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("pulseras", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $pulsera = Pulseras::create($request->all());

        $request->request->add([
            "pulsera_id" => $pulsera->id
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
        $pulsera = Pulseras::find($id);

        return response()->json([
            "pulsera" => $pulsera
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
        $pulsera = Pulseras::findOrfail($id);
         if ($request->hasFile('imagen')) {
            if ($pulsera->avatar) {
                Storage::delete($pulsera->avatar);
            }
            $path = Storage::putFile("pulseras", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $pulsera->update($request->all());

        return response()->json([
            "message" => 200,
            "pulsera" => $pulsera
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $pulsera = Pulseras::findOrfail($id);
        $pulsera->status = $request->status;
        $pulsera->update();
        return $pulsera;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $pulsera =  Pulseras::where('id', $id)->first();
        $pulsera = Pulseras::findOrFail($id);
        if ($pulsera->avatar) {
            Storage::delete($pulsera->avatar);
        }
        $pulsera->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
