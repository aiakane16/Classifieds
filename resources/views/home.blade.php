@extends('layouts.app')

@section('content')
{!! ssr('js/app-server.js')->fallback('<div id="app"></div>')->render() !!}
@endsection
