<?php

namespace App\Http\Resources\Herramienta;

use Illuminate\Http\Resources\Json\ResourceCollection;

class HerramientaCollection extends ResourceCollection
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
            "data"=> HerramientaResource::collection($this->collection)
        ];
    }
}
