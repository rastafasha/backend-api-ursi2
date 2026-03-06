<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Servicio\ServicioCollection;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $services = Service::get();

        return response()->json([
            'code' => 200,
            'status' => 'List services',
            "services" => ServicioCollection::make($services),
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function serviceStore(Request $request)
    {

        $servicio_is_valid = Service::where("id", $request->id)->first();

        if ($servicio_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el servicio  ya existe'
            ]);
        }


        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("services", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $servicio = Service::create($request->all());

        $request->request->add([
            "servicio_id" => $servicio->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function serviceShow($id)
    {

       $service = Service::find($id);

        return response()->json([
            "service" => ServicioResource::make($service),

        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function serviceUpdate(Request $request, $id)
    {
        $service = Service::findOrfail($id);

      if ($request->hasFile('imagen')) {
            if ($service->avatar) {
                Storage::delete($service->avatar);
            }
            $path = Storage::putFile("services", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $service->update($request->all());


        return response()->json([
            "message" => 200,
            // "herramienta"=>HerramientaResource::make($herramienta)
            "service" => $service
        ]);
    }

    public function serviceUpdateStatus(Request $request, $id)
    {
        $service = Service::findOrfail($id);
        $service->status = $request->status;
        $service->update();
        return $service;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $service =  Service::where('id', $id)->first();

        $service = Service::findOrFail($id);
        if ($service->avatar) {
            Storage::delete($service->avatar);
        }
        $service->delete();
        return response()->json([
            "message" => 200
        ]);
    }


   
}
