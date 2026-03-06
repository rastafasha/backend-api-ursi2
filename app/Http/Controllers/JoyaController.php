<?php

namespace App\Http\Controllers;

use App\Models\Joyas;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class JoyaController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $joyas = Joyas::get();

        return response()->json([
            'code' => 200,
            'status' => 'List joyas',
            'joyas' => $joyas,
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

       $joya_is_valid = Joyas::where("id", $request->id)->first();

        if ($joya_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el joya  ya existe'
            ]);
        }

        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("joyas", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $joya = Joyas::create($request->all());

        $request->request->add([
            "joya_id" => $joya->id
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
        $joya = Joyas::find($id);

        return response()->json([
            "joya" => $joya
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
        $joya = Joyas::findOrfail($id);
        if ($request->hasFile('imagen')) {
            if ($joya->avatar) {
                Storage::delete($joya->avatar);
            }
            $path = Storage::putFile("joyas", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $joya->update($request->all());

        return response()->json([
            "message" => 200,
            "joya" => $joya
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $joya = Joyas::findOrfail($id);
        $joya->status = $request->status;
        $joya->update();
        return $joya;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $joya =  Joyas::where('id', $id)->first();

       $joya = Joyas::findOrFail($id);
        if ($joya->avatar) {
            Storage::delete($joya->avatar);
        }
        $joya->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
