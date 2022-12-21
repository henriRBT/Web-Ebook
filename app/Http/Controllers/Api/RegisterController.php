<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Session;

class RegisterController extends Controller
{
    
   /**
     * register
     *
     * @param  mixed $request
     * @return void
     */
    public function register(Request $request)
    {
        $registrationData = $request->all();

        $validate = Validator::make($registrationData,[
            'username'      => 'required|unique:users',
            'email' => 'required|email:rfc,dns|unique:users',
            'password'  => 'required|min:8'
            // 'password'=>'required|regex:"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$@!%&*?]).{8,}"',
            
        ]);

        if($validate->fails())
            return response(['message'=> $validate->errors()],500);
        
        $registrationData['password']= bcrypt($request->password);
        // dd($registrationData);
        $user = User::create($registrationData);
       
        $user->sendEmailVerificationNotification();

        return response([
            'message'=> 'Register Success', 
            'user' => $user
        ], 200);

        // $validator = Validator::make($request->all(), [
        //     'username'      => 'required|unique:users',
        //     'email'     => 'required|email|unique:users',
        //     'password'  => 'required|min:8'
        // ]);

        // if ($validator->fails()) {
        //     return response()->json($validator->errors(), 400);
        // }

        // $user = User::create([
        //     'username'      => $request->username,
        //     'email'     => $request->email,
        //     'password'  => Hash::make($request->password)
        // ]);

        // return response()->json([
        //     'success' => true,
        //     'message' => 'Register Success!',
        //     'data'    => $user  
        // ]);
    }
}
