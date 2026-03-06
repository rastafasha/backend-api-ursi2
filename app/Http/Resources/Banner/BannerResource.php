<?php

namespace App\Http\Resources\Banner;

use Illuminate\Http\Resources\Json\JsonResource;

class BannerResource extends JsonResource
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
            "description"=>$this->resource->description,
            "status"=>$this->resource->status,
            "target"=>$this->resource->target,
            "url"=>$this->resource->url,
            "gotBoton"=>$this->resource->gotBoton,
            "botonName"=>$this->resource->botonName,
           
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            // "avatar"=> $this->resource->avatar ? env("APP_URL").$this->resource->avatar : null,
            "avatarmovil"=> $this->resource->avatarmovil ? env("APP_URL")."storage/".$this->resource->avatarmovil : null,
            // "avatarmovil"=> $this->resource->avatarmovil ? env("APP_URL").$this->resource->avatarmovil : null,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
          

        ];
    }
}
