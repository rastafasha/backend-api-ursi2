<?php

namespace App\Http\Resources\Curso;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CursoCollection extends ResourceCollection
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
            "data"=> CursoResource::collection($this->collection)
        ];
    }
}
