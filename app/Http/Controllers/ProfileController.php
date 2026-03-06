<?php

namespace App\Http\Controllers;
use App\Models\Profile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $this->authorize('index', User::class);

        $profiles = Profile::orderBy('created_at', 'DESC')
        ->get();

            return response()->json([
                'code' => 200,
                'status' => 'Listar todos los Perfiles',
                'profiles' => $profiles,
            ], 200);
    }

    public function profileStore(Request $request)
    {
        $profile_is_valid = Profile::where("id", $request->id)->first();

        if ($profile_is_valid) {
            return response()->json([
                "message" => 403,
                "message_text" => 'el profile  ya existe'
            ]);
        }

        if ($request->hasFile('imagen')) {
            $path = Storage::putFile("profiles", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }


        $arete = Profile::create($request->all());

        $request->request->add([
            "arete_id" => $arete->id
        ]);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profileShow($id)
    {
        
        $profile = Profile::find($id);

        return response()->json([
            "profile" => $profile
        ]);
    }

    public function profileShowUser($id)
    {
        // $this->authorize('userShow', User::class);

        $profile = Profile::where('user_id', $id)->first();

        if (!$profile) {
            return response()->json([
                'message' => 'Profile not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'profile' => $profile,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function profileUpdate(Request $request, $id)
    {
        // $this->authorize('userUpdate', User::class);

        $profile = Profile::findOrfail($id);
        
         if ($request->hasFile('imagen')) {
            if ($profile->avatar) {
                Storage::delete($profile->avatar);
            }
            $path = Storage::putFile("profiles", $request->file('imagen'));
            $request->request->add(["avatar" => $path]);
        }

        $profile->update($request->all());

        return response()->json([
            "message" => 200,
            "profile" => $profile
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $profile =  Profile::where('id', $id)->first();

         $profile = Profile::findOrFail($id);
        if ($profile->avatar) {
            Storage::delete($profile->avatar);
        }
        $profile->delete();
        return response()->json([
            "message" => 200
        ]);
    }

    public function recientes()
    {
        // $this->authorize('recientes', User::class);

        $profiles = User::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'profiles' => $profiles
        ], 200);
    }

}
