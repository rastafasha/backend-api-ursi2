<?php

namespace App\Http\Resources\Blog;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
class BlogResource extends JsonResource
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
            "favorite_id"=>$this->resource->favorite_id,
            "category_id"=>$this->resource->category_id,
            "title"=>$this->resource->title,
            "title_eng"=>$this->resource->title_eng,
            "subtitle"=>$this->resource->subtitle,
            "subtitle_eng"=>$this->resource->subtitle_eng,
            "description"=>$this->resource->description,
            "description_eng"=>$this->resource->description_eng,
            "status"=>$this->resource->status,
            "slug"=>$this->resource->slug,
            "isFeatured"=>$this->resource->isFeatured,
           
            "avatar"=> $this->resource->avatar ? env("APP_URL")."storage/".$this->resource->avatar : null,
            // "avatar"=> $this->resource->avatar ? env("APP_URL").$this->resource->avatar : null,
            "created_at"=>$this->resource->created_at ? Carbon::parse($this->resource->created_at)->format("Y-m-d h:i A") : NULL,
          

        ];
    }
}
