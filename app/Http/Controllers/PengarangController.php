<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Pengarang;

class PengarangController extends Controller
{
    public function index()
    {
        //Show data 
        $pengarangs = Pengarang::all();
        return view('pengarang.index',['pengarangs' => $pengarangs]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //create 
        return view('pengarang.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // validation 
        $this->validate($request,['nama_pengarang'=>'required']);
        $pengarang = new pengarang;
        $pengarang->nama_pengarang = $request->nama_pengarang;
        $pengarang->save();
        return redirect()->route('pengarang.index')->with('alert-succces','Data Pengarang telah disimpan!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
       
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // return to the edit view
        $pengarang = Pengarang::findOrFail($id);
        return view('pengarang.edit',compact('pengarang'));
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
        // validation 
        $this->validate($request,['nama_pengarang'=>'required']);
        $pengarang = Pengarang::findOrFail($id);
        $pengarang->nama_pengarang = $request->nama_pengarang;
        $pengarang->save();
        return redirect()->route('pengarang.index')->with('alert-succces','Data Pengarang telah diubah!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // delete data
        $pengarang = Pengarang::findOrFail($id);
        $pengarang->delete();
        return redirect()->route('pengarang.index')->with('alert-succces','Data Pengarang telah dihapus!');
    }
}
