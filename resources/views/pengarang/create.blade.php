@extends('template')
@section('content')
<div class="row">
	<div class="col-md-12">
		<h1>Create Data</h1>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
            <form class="" action="{{route('pengarang.store')}}" method="post">
			{{csrf_field()}}
			<div class="form-grup{{ ($errors->has('nama_pengarang')) ? $errors->first('nama_pengarang'):''}}">
				<input type="text" name="nama_pengarang" class="form-control" placeholder="Masukkan Nama Pengarang">
				{!! $errors->first('nama_pengarang','<p class="help-block">:message</p>') !!}
			</div>
			<div class="form-grup">
				<input type="submit" class="btn btn-primary" value="Simpan">
			</div>
		</form>
	</div>
</div>


@stop

