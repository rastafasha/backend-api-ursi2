<?php

namespace App\Http\Resources\Servicio;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ServicioCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
         return [
            "data"=> ServicioResource::collection($this->collection)
        ];
    }
}
