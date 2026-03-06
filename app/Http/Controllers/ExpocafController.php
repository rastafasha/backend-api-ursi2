<?php

namespace App\Http\Controllers;

use App\Models\Expocaf;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ExpocafController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $expocafs = Expocaf::get();

        return response()->json([
            'code' => 200,
            'status' => 'List expocafs',
            'expocafs' => $expocafs,
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

         $expocaf_is_valid = Expocaf::where("id", $request->id)->first();

        if ($expocaf_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el expocaf  ya existe'
            ]);
        }

        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("expocafs", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $expocaf = Expocaf::create($request->all());

        $request->request->add([
            "expocaf_id" => $expocaf->id
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

       $expocaf = Expocaf::find($id);

        return response()->json([
            "expocaf" => $expocaf
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
        $expocaf = Expocaf::findOrfail($id);
         if ($request->hasFile('imagen')) {
            if ($expocaf->avatar) {
                Storage::delete($expocaf->avatar);
            }
            $path = Storage::putFile("expocafs", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $expocaf->update($request->all());

        return response()->json([
            "message" => 200,
            "expocaf" => $expocaf
        ]);
    }

    public function updateStatus(Request $request, $id)
    {
        $expocaf = Expocaf::findOrfail($id);
        $expocaf->status = $request->status;
        $expocaf->update();
        return $expocaf;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {
        $expocaf =  Expocaf::where('id', $id)->first();

        $expocaf = Expocaf::findOrFail($id);
        if ($expocaf->avatar) {
            Storage::delete($expocaf->avatar);
        }
        $expocaf->delete();
        return response()->json([
            "message" => 200
        ]);
    }

}
