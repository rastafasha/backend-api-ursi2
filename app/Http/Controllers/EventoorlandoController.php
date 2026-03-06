<?php

namespace App\Http\Controllers;

use App\Models\Eventoorlando;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class EventoorlandoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $eventoorlandos = Eventoorlando::get();

        return response()->json([
            'code' => 200,
            'status' => 'List eventoorlandos',
            'eventoorlandos' => $eventoorlandos,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function eventoorlandoStore(Request $request)
    {
        return Eventoorlando::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function eventoorlandoShow(Eventoorlando $eventoorlando)
    {

        if (!$eventoorlando) {
            return response()->json([
                'message' => 'eventoorlando not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'eventoorlando' => $eventoorlando,
        ], 200);
    }










}
