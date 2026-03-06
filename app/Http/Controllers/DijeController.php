<?php

namespace App\Http\Controllers;

use App\Models\Dijes;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class DijeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $dijes = Dijes::get();

        return response()->json([
            'code' => 200,
            'status' => 'List dijes',
            'dijes' => $dijes,
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

         $dije_is_valid = Dijes::where("id", $request->id)->first();

        if ($dije_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el dije  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("dijes", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $dije = Dijes::create($request->all());

        $request->request->add([
            "dije_id" => $dije->id
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

       $dije = Dijes::find($id);

        return response()->json([
            "dije" => $dije
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
        $dije = Dijes::findOrfail($id);
         if ($request->hasFile('imagen')) {
            if ($dije->avatar) {
                Storage::delete($dije->avatar);
            }
            $path = Storage::putFile("dijes", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $dije->update($request->all());

        return response()->json([
            "message" => 200,
            "dije" => $dije
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $dije = Dijes::findOrfail($id);
        $dije->status = $request->status;
        $dije->update();
        return $dije;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $dije =  Dijes::where('id', $id)->first();

        $dije = Dijes::findOrFail($id);
        if ($dije->avatar) {
            Storage::delete($dije->avatar);
        }
        $dije->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
