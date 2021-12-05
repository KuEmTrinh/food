@extends('layouts.app')

@section('content')
    <div class="login center">
        <h1 class="title txt-center mbt-1">ログイン</h1>
        <form method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
            {{ csrf_field() }}

            <input type="text" class="input txt-center w-100" v-model="name" placeholder="会員番号" id="username"
                name="username" />
            @if ($errors->has('username'))
                <div class="message__error invalid-feedback" role="alert">
                    <strong>{{ $errors->first('username') }}</strong>
                </div>
            @endif
            <input type="password" class="input txt-center w-100" v-model="name" placeholder="パスワード" id="password"
                name="password" />
            @if ($errors->has('password'))
                <div class="message__error" role="alert">
                    <strong>{{ $errors->first('password') }}</strong>
                </div>
            @endif
            {{-- <input id="username" type="text"
                class="input txt-center form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username"
                value="{{ old('username') }}" required autofocus>
            <input id="password" type="password"
                class="input txt-center form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"
                required> --}}
            <button type="submit" class="btn btn-m btn-black w-100 mt-1" @click.prevent="register()">
                ログイン
            </button>

        </form>
    </div>
@endsection
