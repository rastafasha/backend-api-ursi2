<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Banner\BannerResource;
use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BannerController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $banners = Banner::get();

        return response()->json([
            'code' => 200,
            'status' => 'List banners',
            'banners' => $banners,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function bannerStore(Request $request)
    {

        $banner_is_valid = Banner::where("id", $request->id)->first();

        if ($banner_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el banner  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("banners", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        if ($request->hasFile('imagemovil')) {
            $path = Storage::putFile("banners", $request->file('imagen'));
            $request->request->add(["avatarmovil" => $path]);
        }


        $herramienta = Banner::create($request->all());

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
    public function bannerShow($id)
    {

         $banner = Banner::find($id);

        return response()->json([
            "banner" => $banner
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function bannerUpdate(Request $request, $id)
    {
        $banner = Banner::findOrfail($id);


        if ($request->hasFile('imagen')) {
            if ($banner->avatar) {
                Storage::delete($banner->avatar);
            }
            $path = Storage::putFile("banners", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        if ($request->hasFile('imagemovil')) {
            if ($banner->avatarmovil) {
                Storage::delete($banner->avatarmovil);
            }
            $path = Storage::putFile("banners", $request->file('imagemovil'));
            $request->request->add(["avatarmovil" => $path]);
        }

        $banner->update($request->all());

        return response()->json([
            "message" => 200,
            // "herramienta"=>HerramientaResource::make($herramienta)
            "banner" => $banner
        ]);
    }

    public function bannerUpdateStatus(Request $request, $id)
    {
        $banner = Banner::findOrfail($id);
        $banner->status = $request->status;
        $banner->update();
        return $banner;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $banner =  Banner::where('id', $id)->first();

        $banner = Banner::findOrFail($id);
        if ($banner->avatar) {
            Storage::delete($banner->avatar);
        }
        if ($banner->avatarmovil) {
            Storage::delete($banner->avatarmovil);
        }
        $banner->delete();
        return response()->json([
            "message" => 200
        ]);
    }


}
