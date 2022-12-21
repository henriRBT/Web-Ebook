<?php

namespace App\Http\Controllers;
use App\Http\Resources\ComicResources;
use App\Models\Comic;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ComicController extends Controller
{
    
    /** 
     * index
     * @return void
     */

    public function index(){
        // get pots 
        //$comic = Comic::latest()->get();

        $comic = Comic::all();

        if(count($comic) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $comic
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
         return view('comic.create');
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
            'nama' => 'required',
            'pengarang' => 'required',
            'penerbit' => 'required',
            'penejemah' => 'required',
            'gambar' => 'required',
        ]);
        
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
    
            $comic = new Comic;
    
            $nama= $request->nama;
            $pengarang = $request->pengarang;
            $penerbit = $request->penerbit;
            $penejemah = $request->penejemah;
            //$gambar = $request->file('gambar');
            $gambar = $request->gambar;
            if ($gambar) {
                $nama_file = $gambar->getClientOriginalName();
                $request->gambar->move('image', $nama_file);
                $comic->gambar = 'image/'.$nama_file;
            }
    
            
            //Fungsi Simpan Data ke dalam Database
            $comic = Comic::create([
                'nama' => $request->nama,
                'pengarang' => $request->pengarang,
                'penerbit' => $request->penerbit,
                'penejemah'=> $request->penejemah,
                'gambar'=> $nama_file,
            ]);
    
            
            return response()->json([ 
                'data'   => asset("image/$nama_file"),
            ]); 
            return new ComicResources(true, 'Data Comic Berhasil Ditambahkan!', $comic);
    }

    public function show($id)
    {
        $comic = Comic::find($id);

        if(!is_null($comic)){
            return response([
                'message' => 'Retrieve Comic Success',
                'data' => $comic
            ], 200);
        }

        return response([
            'message' => 'Comic Not Found',
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
           $comic = Comic::where('id', $id)->first();
           return view('comic.update')->with('comic', $comic);
    }

    /**
    * store
    *
    * @param Request $request
    * @return void
    */
    public function update(Request $request, $id){
           //Validasi Formulir
            
           $validator = Validator::make($request->all(), [
            'nama' => 'required',
            'pengarang' => 'required',
            'penerbit' => 'required',
            'penejemah' => 'required',
            'gambar' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $comic = Comic::find($id);

        $comicBaru = new Comic;

        $gambar = $request->gambar;
        if ($gambar) {
            $nama_file = 'buku1.jpg';
            //$request->gambar->move('image', $nama_file);
            $comicBaru->gambar = 'image/'.$nama_file;
        }

        if($comic){
            $comic->update([
                'nama' => $request->nama,
                'pengarang' => $request->pengarang,
                'penerbit' => $request->penerbit,
                'penejemah'=> $request->penejemah, 
                'gambar' =>$nama_file      
        ]);

        // return new DepartemenResource(true, 'Data Departemen Berhasil di Update!', $departemen);
        }

       

        return response()->json([
            'success' => false,
            'message' => 'Post not found'
        ], 404);
        return new ComicResources(true, 'Data Comic berhasil diubah!', $comic);
       
    }

    public function destroy(Comic $comic)
    {
        if($comic) {
            $comic->delete();

            return response()->json([
            'success' => true,
            'message' => 'Comic deleted'
            ], 200);
    }

        // return new DepartemenResource(true, 'Data Departemen Berhasil di Delete!', null);
    }
}
