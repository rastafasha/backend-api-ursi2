<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Blog\BlogResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class PostController extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $posts = Post::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'List Posts',
            'posts' => $posts,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function postStore(Request $request)
    {

        $post_is_valid = Post::where("id", $request->id)->first();

        if ($post_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'la post  ya existe'
            ]);
        }

        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("posts", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $post = Post::create($request->all());

        $request->request->add([
            "post_id" => $post->id
        ]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function postShow($id)
    {

       $post = Post::find($id);

        return response()->json([
            "post" => BlogResource::make($post)
        ]);
    }

    public function postShowWithCategory(Post $post)
    {

        // $post = Post::with('categories')->find($id);

        $post = Post::join('categories', 'posts.category_id', '=', 'categories.id')
        ->select(
            'posts.id as id',
            'categories.name'
            )
        ->get();

        if (!$post) {
            return response()->json([
                'message' => 'post not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'post' => $post,
        ], 200);
    }

    public function postByCategory($category)
    {
        // $this->authorize('index', User::class);

        $posts = Post::with('categories')->where('category_id', $category)->get();
            return response()->json([
                'code' => 200,
                'status' => 'Listar Post by Category',
                'posts' => $posts,
            ], 200);
    }


    public function postShowSlug($slug)
    {
        // $post = Post::where('slug', $slug)->first();

        $post = Post::select([
            "id",
            'title',
            'title_eng',
            'description',
            'description_eng',
        'category_id',
        'slug',
        'image',
        ])
            ->where('slug', $slug)
            ->orderBy('id', 'desc')
            ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar Post by slug',
                'post' => $post,
            ], 200);
    }

     public function recientes()
    {
        $postrecientes = Post::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'postrecientes' => $postrecientes
        ], 200);
    }

    public function destacados()
    {

        $posts = Post::join('categories', 'posts.category_id', '=', 'categories.id')
                ->with(["users"])
                ->where('isFeatured', $featured=true)
                ->get([
                    'posts.*', 'posts.title',
                    'categories.*', 'categories.name',
                ]);
            return response()->json([
                'code' => 200,
                'status' => 'Listar Post destacados',
                'posts' => $posts,
            ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function postUpdate(Request $request, $id)
    {
        $post = Post::findOrfail($id);
        if ($request->hasFile('imagen')) {
            if ($post->avatar) {
                Storage::delete($post->avatar);
            }
            $path = Storage::putFile("posts", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $post->update($request->all());

        return response()->json([
            "message" => 200,
            // "herramienta"=>HerramientaResource::make($herramienta)
            "post" => $post
        ]);
    }

    public function postUpdateStatus(Request $request, $id)
    {
        $post = Post::findOrfail($id);
        $post->status = $request->status;
        $post->update();
        return $post;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $post =  Post::where('id', $id)->first();

        $post = Post::findOrFail($id);
        if ($post->avatar) {
            Storage::delete($post->avatar);
        }
        $post->delete();
        return response()->json([
            "message" => 200
        ]);
    }


     public function search(Request $request){

        return Post::search($request->buscar);

    }
}
