<?php

namespace App\Http\Resources\Cronograma;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
class CronogramaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
         return [
            "id"=>$this->resource->id,
            "title"=>$this->resource->title,
            "title_eng"=>$this->resource->title_eng,
            "description"=>$this->resource->description,
            "description_eng"=>$this->resource->description_eng,
            "modo"=>$this->resource->modo,
            "modo_eng"=>$this->resource->modo_eng,
            "fecha"=>$this->resource->fecha,
            "fecha_eng"=>$this->resource->fecha_eng,
            "hora"=>$this->resource->hora,
            "hora_eng"=>$this->resource->hora_eng,
            "clases"=>$this->resource->clases,
            "clases_eng"=>$this->resource->clases_eng,
            "proyecto"=>$this->resource->proyecto,
            "proyecto_eng"=>$this->resource->proyecto_eng,
            "duracion"=>$this->resource->duracion,
            "duracion_eng"=>$this->resource->duracion_eng,
            "costo"=>$this->resource->costo,
            "status"=>$this->resource->status,
           
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            // "avatar"=> $this->resource->avatar ? env("APP_URL").$this->resource->avatar : null,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
          

        ];
    }
}
