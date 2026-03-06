<?php

namespace App\Http\Controllers;

use App\Models\Galleryschool;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class GalleryschoolController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $galleryschools = Galleryschool::get();

        return response()->json([
            'code' => 200,
            'status' => 'List galleryschools',
            'galleryschools' => $galleryschools,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function galleryschoolStore(Request $request)
    {

         $galleryschool_is_valid = Galleryschool::where("id", $request->id)->first();

        if ($galleryschool_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el galleryschool  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("cursos", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $galleryschool = Galleryschool::create($request->all());

        $request->request->add([
            "galleryschool_id" => $galleryschool->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function galleryschoolShow($id)
    {

      $galleryschool = Galleryschool::find($id);

        return response()->json([
            "galleryschool" => $galleryschool,

        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function GalleryschoolUpdate(Request $request, $id)
    {
        $galleryschool = Galleryschool::findOrfail($id);
        if ($request->hasFile('imagen')) {
            if ($galleryschool->avatar) {
                Storage::delete($galleryschool->avatar);
            }
            $path = Storage::putFile("galleryschools", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $galleryschool->update($request->all());

        return response()->json([
            "message" => 200,
            "galleryschool" => $galleryschool
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

        $galleryschool =  Galleryschool::where('id', $id)->first();

        $galleryschool = Galleryschool::findOrFail($id);
        if ($galleryschool->avatar) {
            Storage::delete($galleryschool->avatar);
        }
        $galleryschool->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
