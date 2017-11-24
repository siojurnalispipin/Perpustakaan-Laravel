@extends('template')
@section('content')
<div class="row">
    <div class="col-md-12">
        <table style="width: 50%" class="table table-striped">
            <tr>
                <th>Id</th>
                <th>Nama</th>
                <th>Action</th>
                
            </tr>
            <a href="{{route('pengarang.create')}}"><i class="glyphicon glyphicon-plus"></i> Tambah</a></br></br>

            <?php $no=1; ?>
            @foreach($pengarangs as $pengarang)
            
            <tr>
                <td>{{$no++}}</td>
                <td>{{$pengarang->nama_pengarang}} </td>
                <td>
                    <form action="{{route('pengarang.destroy',$pengarang->id)}} " method="post">
                        <input type="hidden" name="_method" value="delete">
                        <input type="hidden" name="_token" value="{{ csrf_token()}} ">
                        <a href="{{route('pengarang.edit',$pengarang->id)}}" class="btn btn-sm btn-success"> <i class="glyphicon glyphicon-edit"></i></a>
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Apakah anda yakin akan menghapus data ?')" name="name"><i class="glyphicon glyphicon-remove"></i></button>
                    </form> 
                </td>
            </tr>
            @endforeach
        </table>
    </div>
</div>
@stop