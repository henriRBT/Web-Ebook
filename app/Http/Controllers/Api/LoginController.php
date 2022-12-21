<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Laravel\Passport\RefreshToken;
use Laravel\Passport\Token;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    
    /**
     * login
     *
     * @param  mixed $request
     * @return void
     */
    public function login(Request $request)
    {

        // $loginData = $request->all();

        // $validate = Validator::make($loginData,[
        //     'email' => 'required|email:rfc,dns',
        //     'password' => 'required'
        //     // 'password'=>'required|regex:"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$@!%&*?]).{8,}"',
        // ]);

        // if($validate->fails())
        //     return response(['message'=> $validate->errors()],400);
        
        // if(!Auth::attempt($loginData))
        //     return response(['message'=> 'Invalid Credentials'], 401);

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400); 
        }

        if($user->email_verified_at == null){
            return response(['message' => "Your Accout Email must be verified before you can continue"],403);
        }
        
        $user = User::where('email', $request->email)->first(); // menngecek email sama atau ngga 

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Login Failed!',
            ]);
        }
        // $user = Auth::user();
        // $token =$user->createToken('Authentication Token')->accessToken;

        return response()->json([
            // 'message'=> 'Authentication', 
            // 'user' => $user,
            // 'token_type'=>'Brear',
            'success' => true,
            'message' => 'Login Success!',
            'data'    => $user,
            // 'access_token'=>$token
            'token'   => $user->createToken('authToken')->accessToken    
        ]);
    }
    
    public function logout(Request $request){
        if ($request->user()) { 
            $request->user()->tokens()->delete();
        }

        return response()->json([
            'success' => true,
            'message' => 'Logout Success!',  
        ]);
        // if(Auth::user()){
        //  $user = Auth::user()->token();
        //  $user->revoke();

        //  $tokens =  $user->id;
        //     Token::where('id', $tokens)->update(['revoked'=>true]);
        //     RefreshToken::where('access_token_id', $tokens)->update(['revoked' => true]);
        //     return response()->json([
        //         'success' => true,
        //         'message' => 'Logout successfully',
        //         ]);
        // } else{
        //  return response()->json([
        //   'success' => false,
        //   'message' => 'Unable to Logout',
        //  ]);
        // }
    }
}