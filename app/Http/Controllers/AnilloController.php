<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Anillo;
use App\Http\Requests\AnilloStoreRequest;
use Illuminate\Support\Facades\Storage;

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

       $anillo_is_valid = Anillo::where("id", $request->id)->first();

        if ($anillo_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el anillo  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("anillos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $anillo = Anillo::create($request->all());

        $request->request->add([
            "anillo_id" => $anillo->id
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

        $anillo = Anillo::find($id);

        return response()->json([
            "anillo" => $anillo,

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
        $anillo = Anillo::findOrfail($id);
        if ($request->hasFile('imagen')) {
            if ($anillo->avatar) {
                Storage::delete($anillo->avatar);
            }
            $path = Storage::putFile("anillos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $anillo->update($request->all());

        return response()->json([
            "message" => 200,
            "anillo" => $anillo
        ]);
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

         $anillo = Anillo::findOrFail($id);
        if ($anillo->avatar) {
            Storage::delete($anillo->avatar);
        }
        $anillo->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
