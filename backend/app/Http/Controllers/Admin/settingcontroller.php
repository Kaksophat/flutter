<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{
    public function index($id, Request $request)
    {
        $setting = Setting::find($id);
        return response()->json([
            "status" => 200,
            "setting" => $setting
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "image_logo" => "required|image",
            "about_us" => "required|string",
            "image_about_us" => "required|image",
            "image_favicon" => "required|image",
            "phone" => "required|string",
            "email" => "required|email",
            "address" => "required|string",
            "map" => "required|string",
            "facebook" => "required|string",
            "instagram" => "required|string",
            "twitter" => "required|string",
            "youtube" => "required|string",
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $setting = new Setting();

        $setting->image_logo = $this->uploadFile($request->file('image_logo'));
        $setting->image_about_us = $this->uploadFile($request->file('image_about_us'));
        $setting->image_favicon = $this->uploadFile($request->file('image_favicon'));

        $setting->about_us = $request->about_us;
        $setting->phone = $request->phone;
        $setting->email = $request->email;
        $setting->address = $request->address;
        $setting->map = $request->map;
        $setting->facebook = $request->facebook;
        $setting->instagram = $request->instagram;
        $setting->twitter = $request->twitter;
        $setting->youtube = $request->youtube;

        $setting->save();

        return response()->json([
            "status" => 201,
            "setting" => $setting
        ]);
    }

    public function show($id)
    {
        $setting = Setting::find($id);
        return response()->json([
            "status" => 200,
            "setting" => $setting
        ]);
    }

    public function update($id, Request $request)
    {
        $setting = Setting::find($id);

        if (!$setting) {
            return response()->json([
                "status" => 404,
                "message" => "Setting not found"
            ], 404);
        }

        if ($request->hasFile('image_logo')) {
            $setting->image_logo = $this->uploadFile($request->file('image_logo'));
        }

        if ($request->hasFile('image_about_us')) {
            $setting->image_about_us = $this->uploadFile($request->file('image_about_us'));
        }

        if ($request->hasFile('image_favicon')) {
            $setting->image_favicon = $this->uploadFile($request->file('image_favicon'));
        }

        $setting->about_us = $request->about_us ?? $setting->about_us;
        $setting->phone = $request->phone ?? $setting->phone;
        $setting->email = $request->email ?? $setting->email;
        $setting->address = $request->address ?? $setting->address;
        $setting->map = $request->map ?? $setting->map;
        $setting->facebook = $request->facebook ?? $setting->facebook;
        $setting->instagram = $request->instagram ?? $setting->instagram;
        $setting->twitter = $request->twitter ?? $setting->twitter;
        $setting->youtube = $request->youtube ?? $setting->youtube;

        $setting->save();

        return response()->json([
            "status" => 200,
            "message" => "Settings updated successfully",
            "setting" => $setting
        ]);
    }

    private function uploadFile($file)
    {
        $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
        $file->move(public_path('/uploads'), $filename);
        return $filename;
    }
}
