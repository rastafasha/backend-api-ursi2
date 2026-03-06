<?php

namespace App\Http\Controllers;

use App\Models\Aretes;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
class AreteController extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $aretes = Aretes::get();

        return response()->json([
            'code' => 200,
            'status' => 'List aretes',
            'aretes' => $aretes,
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

         $arete_is_valid = Aretes::where("id", $request->id)->first();

        if ($arete_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el arete  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("aretes", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $arete = Aretes::create($request->all());

        $request->request->add([
            "arete_id" => $arete->id
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

       $arete = Arete::find($id);

        return response()->json([
            "arete" => $arete
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
        $arete = Aretes::findOrfail($id);
         if ($request->hasFile('imagen')) {
            if ($arete->avatar) {
                Storage::delete($arete->avatar);
            }
            $path = Storage::putFile("aretes", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $arete->update($request->all());

        return response()->json([
            "message" => 200,
            "arete" => $arete
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $arete = Aretes::findOrfail($id);
        $arete->status = $request->status;
        $arete->update();
        return $arete;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $arete =  Arete::where('id', $id)->first();

        $arete = Aretes::findOrFail($id);
        if ($arete->avatar) {
            Storage::delete($arete->avatar);
        }
        $arete->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
