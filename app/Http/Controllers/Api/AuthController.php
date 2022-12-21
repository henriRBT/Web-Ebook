<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Laravel\Passport\Token;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\AuthResource;
use Illuminate\Auth\Events\Verified;

class AuthController extends Controller
{
     
    public function index()
    {
        $user = User::all();

        if(count($user)>0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $user
            ], 200);
        }

        return response([
            'message'=> 'Empty',
            'data' =>null
        ], 400);
       
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'username' => 'required|',
            'email' => 'required|email:rfc,dns|unique:users',
            'password'=>'required',
        ]);
 
        if($validate->fails())
            return response(['message'=> $validate->errors()],400);

        $employee = Employee::create($storeData);

        return response([
            'message'=> 'Add Employees Success', 
            'data' => $employee
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);
        
        if(!is_null($user)){
            return response([
                'message'=> 'Retrieve User Success',
                'data' => $user
            ],200);
        }
      

        return response([
            'message'=> 'User Not Found', 
            'data' => null
        ], 404);
    }

    public function register(Request $request){

        $validator = Validator::make($request->all(), [
            'username'      => 'required|unique:users',
            'email'     => 'required|email|unique:users',
            'password'  => 'required|min:8'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $user = User::create([
            'username'      => $request->username,
            'email'     => $request->email,
            'password'  => Hash::make($request->password)
        ]);

        $user->sendEmailVerificationNotification();

        return response()->json([
            'success' => true,
            'message' => 'Register Success!',
            'data'    => $user  
        ]);

        //guieded
        // $registrationData = $request->all();

        // $validate = Validator::make($registrationData,[
        //     'username' => 'required|unique:users',
        //     'email' => 'required|email:rfc,dns|unique:users',
        //     'password'=>'required',
        // ]);
       
      
        // if($validate->fails())
        //     return response(['message'=> $validate->errors()],500);
        
        // $registrationData['password']= bcrypt($request->password);
        // // dd($registrationData);
        // $user = User::create($registrationData);
       
        // // $user->sendEmailVerificationNotification();

        // return response([
        //     'message'=> 'Register Success', 
        //     'user' => $user
        // ], 200);
    }

    public function login(Request $request){
         /// penggunaan Guided tidak berhasil 
         
        // $loginData = $request->all();

        // $validate = Validator::make($loginData,[
        //     'email' => 'required|email:rfc,dns',
        //     'password'=>'required|',
        // ]);

        // if($validate->fails())
        //     return response(['message'=> $validate->errors()],400);
        
        // if(!Auth::attempt($loginData))
        //     return response(['message'=> 'Invalid Credentials'], 401);

        // $user = Auth::user();
        // $token =$user->createToken('Authentication Token')->accessToken;

        // return response([
        //     'message'=> 'Authentication', 
        //     'user' => $user,
        //     'token_type'=>'Brear',
        //     'access_token'=>$token
        // ]);

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400); 
        }

        // if($user->email_verified_at == null){
        //     return response(['message' => "Your Accout Email must be verified before you can continue"],403);
        // }
        
        $user = User::where('email', $request->email)->first(); // menngecek email sama atau ngga 

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Login Failed!',
            ]);
        }
        
        return response()->json([
           
            'success' => true,
            'message' => 'Login Success!',
            'data'    => $user,
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

        /// penggunaan Guided tidak berhasil 
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
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $user = User::find($id);
        
        if(is_null($user)){
            return response([
                'message'=> 'User Not Found',
                'data' => null
            ],404);
        }
        
        $updateData = $request->all();
        $validate = Validator::make($updateData,[
            'username' => 'required',
            'email' => 'required|email:rfc,dns|unique:users',
            'password'=>'required|',
        ]);

        
        if($validate->fails())
            return response(['message' =>$validate->errors(), 400]);

        $user->username = $updateData['username'];
        $user->email = $updateData['email'];
        $user->password = $updateData['password'];

        if($user->save()){
            return response([
                'message' =>'Update User Success',
                'data' =>$user
            ],200);
        }

        return response([
            'message'=> 'Update User Success', 
            'data' => null
        ], 400);
    }


    //cara verifikasi email 

    public function verify(Request $request) {
        $user = User::findOrFail($request->id);

        if (! hash_equals((string) $request->hash, sha1($user->getEmailForVerification()))) {
            return response()->json([
                "message" => "Unauthorized",
                "success" => false
            ]);
        }

        if ($user->hasVerifiedEmail()) {
            return response()->json([
                "message" => "User already verified!",
                "success" => false
            ]);
        }

        if ($user->markEmailAsVerified()) {
            event(new Verified($user));
        }

        return response()->json([
            "message" => "Email verified successfully!",
            "success" => true
        ]);
    }
}
