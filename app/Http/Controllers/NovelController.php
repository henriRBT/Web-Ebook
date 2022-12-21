<?php

namespace App\Http\Controllers;
use App\Http\Resources\NovelResources;
use App\Models\Novel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class NovelController extends Controller
{
    /** 
     * index
     * @return void
     */

    public function index()
    {
        $novel = Novel::all();

        if(count($novel) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $novel
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
         return view('novel.create');
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
            'judul_novel' => 'required',
            'penulis_novel' => 'required',
            'penerbit_novel' => 'required',
            'tahun' => 'required',
            'gambar'=> 'required'
        ]);
        
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
    
            $novel = new Novel;
    
            $judul_novel= $request->judul_novel;
            $penulis_novel = $request->penulis_novel;
            $penerbit_novel = $request->penerbit_novel;
            $tahun = $request->tahun;
            //$gambar = $request->file('gambar');
            $gambar = $request->gambar;
            if ($gambar) {
                $nama_file = $gambar->getClientOriginalName();
                $gambar->move('image', $nama_file);
                $novel->gambar = 'image/'.$nama_file;
            }
            //Fungsi Simpan Data ke dalam Database
            $novel= Novel::create([
                'judul_novel' => $request->judul_novel,
                'penulis_novel' => $request->penulis_novel,
                'penerbit_novel' => $request->penerbit_novel,
                'tahun'=> $request->tahun,
                'gambar'=> $nama_file
            ]);
            return new NovelResources(true, 'Data Novel berhasil diubah!', $novel);
    }


    public function show($id)
    {
        $novel = Novel::find($id);

        if(!is_null($novel)){
            return response([
                'message' => 'Retrieve Novel Success',
                'data' => $novel
            ], 200);
        }

        return response([
            'message' => 'Novel Not Found',
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
           $novel = Novel::where('id', $id)->first();
           return view('novel.update')->with('novel', $novel);
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
                'judul_novel' => 'required',
                'penulis_novel' => 'required',
                'penerbit_novel' => 'required',
                'tahun' => 'required',
            ]);
            $novel= Novel::find($id);
    
            if($novel){
                $novel->update([
                    'judul_novel' => $request->judul_novel,
                    'penulis_novel' => $request->penulis_novel,
                    'penerbit_novel' => $request->penerbit_novel,
                    'tahun'=> $request->tahun,
                    
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
            return new NovelResources(true, 'Data Novel berhasil diubah!', $novel);
    }

    public function destroy(Novel $novel)
    {
        if($novel) {
            $novel->delete();

            return response()->json([
            'success' => true,
            'message' => 'Novel deleted'
            ], 200);
    }

        // return new DepartemenResource(true, 'Data Departemen Berhasil di Delete!', null);
    }
}
