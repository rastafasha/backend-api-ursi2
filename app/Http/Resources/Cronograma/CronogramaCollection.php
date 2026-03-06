<?php

namespace App\Http\Resources\Cronograma;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CronogramaCollection extends ResourceCollection
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
            "data"=> CronogramaResource::collection($this->collection)
        ];
    }
}
