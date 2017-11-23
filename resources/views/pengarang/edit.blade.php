@extends('template')
@section('content')
<div class="row">
    <div class="col-md-12">
        <h1>Edit Data</h1>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <form class="" action="{{route('pengarang.update',$pengarang->id)}}" method="post">
            <input type="hidden" name="_method" value="PATCH">
            {{csrf_field()}}


            <div class="form-grup{{ ($errors->has('nama_pengarang')) ? $errors->first('nama_pengarang'):''}}">
                <input type="text" name="nama_pengarang" class="form-control" placeholder="Masukkan Nama Pengarang" value="{{$pengarang->nama_pengarang}}">
                {!! $errors->first('nama','<p class="help-block">:message</p>') !!}
            </div>
            
            
            
            <div class="form-grup">
                <input type="submit" class="btn btn-primary" value="Update">
            </div>
        </form>
    </div>
</div>


@stop

