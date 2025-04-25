<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Auth;
class UserAuthcontroller extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
        ]);

        $user = customer::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = JWTAuth::fromUser($user);
        return response()->json([
            'status' => 200,
            'data' => $user,
            'token' => $token
            ], 201);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        
        return response()->json([
            'status' => 200,
            'data' => Auth::user(),
            'token' => $token
    ]);
    }

    public function logout()
    {
        Auth::logout();

        return response()->json(['message' => ' logged out']);
    }

   
}
