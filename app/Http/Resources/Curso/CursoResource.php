<?php

namespace App\Http\Resources\Curso;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class CursoResource extends JsonResource
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
            "user_id"=>$this->resource->user_id,
            "name"=>$this->resource->name,
            "name_eng"=>$this->resource->name_eng,
            "adicional"=>$this->resource->adicional,
            "adicional_eng"=>$this->resource->adicional_eng,
            "description"=>$this->resource->description,
            "description_eng"=>$this->resource->description_eng,
            "status"=>$this->resource->status,
            "price"=>$this->resource->price,
            "modal"=>$this->resource->modal,
            "slug"=>$this->resource->slug,
            "urlVideo"=>$this->resource->urlVideo,
            "isFeatured"=>$this->resource->isFeatured,
           
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            // "avatar"=> $this->resource->avatar ? env("APP_URL").$this->resource->avatar : null,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
          

        ];
    }
}
