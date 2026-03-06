<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $categories = Category::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos los categories',
            'categories' => $categories,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function categoryStore(Request $request)
    {
       $category_is_valid = Category::where("id", $request->id)->first();

         if ($category_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el category  ya existe'
            ]);
        }

        $category = Category::create($request->all());

        $request->request->add([
            "category_id" => $category->id
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function categoryShow($id)
    {
        //
        $category = Category::find($id);

        return response()->json([
            "category" => $category,

        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function categoryUpdate(Request $request, $id)
    {
        $category = Category::findOrfail($id);
      
        $category->update($request->all());

        return response()->json([
            "message" => 200,
            "category" => $category
        ]);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $category =  Category::where('id', $id)->first();
        $category = Category::findOrFail($id);
       
        $category->delete();
        return response()->json([
            "message" => 200
        ]);
    }

    public function search(Request $request){
        return Category::search($request->buscar);
    }

}
