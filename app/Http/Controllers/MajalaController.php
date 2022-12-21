<?php

namespace App\Http\Controllers;
use App\Http\Resources\MajalahResources;
use App\Models\Majalah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MajalaController extends Controller
{
    /** 
     * index
     * @return void
     */
    public function index()
    {
        $majalah = Majalah::all();

        if(count($majalah) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $majalah
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 400);
    }

    /**
    * create
    *
    * @return void
    */
    public function create()
    {
         return view('majalah.create');
    }

    /**
      * store
      *
      * @param Request $request
      * @return void
    */
    public function store(Request $request){
       //Validasi Formulir
       $validator = Validator::make($request->all(), [
        'judul' => 'required',
        'penulis' => 'required',
        'penerbit' => 'required',
        'tahun_terbit' => 'required',
        'gambar' => 'required'
    ]);
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $majalah = new Majalah;
        $judul= $request->judul;
        $penulis = $request->penulis;
        $penerbit = $request->penerbit;
        $tahun_terbit = $request->tahun_terbit;
        //$gambar = $request->file('gambar');
        $gambar = $request->gambar;
        if ($gambar) {
            $nama_file = $gambar->getClientOriginalName();
            $gambar->move('image', $nama_file);
            $majalah->gambar = 'image/'.$nama_file;
        }
        //Fungsi Simpan Data ke dalam Database
        $majalah = Majalah::create([
            'judul' => $request->judul,
            'penulis' => $request->penulis,
            'penerbit' => $request->penerbit,
            'tahun_terbit'=> $request->tahun_terbit,
            'gambar'=> $nama_file,
        ]);
        return response()->json([ 
            'data'   => asset("image/$nama_file"),
        ]); 
        return new MajalahResources(true, 'Data Majalah berhasil diubah!', $majalah);
    }


    public function show($id)
    {
        $majalah = Majalah::find($id);

        if(!is_null($majalah)){
            return response([
                'message' => 'Retrieve Majalah Success',
                'data' => $majalah
            ], 200);
        }

        return response([
            'message' => 'Majalah Not Found',
            'data' => null
        ], 404);
    }



    /**
    * store
        *
        * @param Request $request
        * @return void
    */

    public function edit($id)
    {
           $majalah = Majalah::where('id', $id)->first();
           return view('majalah.update')->with('majalah', $majalah);
    }

    /**
    * store
    *
    * @param Request $request
    * @return void
    */
    public function update(Request $request, $id){
            //Validasi Formulir
            
            $request->validate([
                'judul' => 'required',
                'penulis' => 'required',
                'penerbit' => 'required',
                'tahun_terbit' => 'required',
            ]);
            $majalah = Majalah::find($id);
    
            if($majalah){
                $majalah->update([
                    'judul' => $request->judul,
                    'penulis' => $request->penulis,
                    'penerbit' => $request->penerbit,
                    'tahun_terbit'=> $request->tahun_terbit,
                    
            ]);
    
            // return new DepartemenResource(true, 'Data Departemen Berhasil di Update!', $departemen);
            }
    
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
    
            return response()->json([
                'success' => false,
                'message' => 'Post not found'
            ], 404);
            return new MajalahResources(true, 'Data Majalah berhasil diubah!', $majalah);
             
    }

    public function destroy(Majalah $majalah)
    {
        if($majalah) {
            $majalah->delete();

            return response()->json([
            'success' => true,
            'message' => 'Majalah deleted'
            ], 200);
    }

        // return new DepartemenResource(true, 'Data Departemen Berhasil di Delete!', null);
    }


}
