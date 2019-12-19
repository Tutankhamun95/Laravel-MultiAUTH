<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') - {{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
        
    <!-- Custom fonts for this theme -->
    <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  
    <!-- Theme CSS -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="{{asset('assets/frontend/css/freelancer.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/frontend/css/freelancer.css')}}" rel="stylesheet">

    <link rel="stylesheet" href="http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    @stack('css')

</head>
<body>

@include ('layouts.frontend.partial.header')


@yield('content')



@include ('layouts.frontend.partial.footer')



    <!-- Bootstrap core JavaScript -->
    <script src="{{asset('assets/frontend/vendor/jquery/jquery.min.js')}}"></script>
    <script src="{{asset('assets/frontend/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
  
    <!-- Plugin JavaScript -->
    <script src="{{asset('assets/frontend/vendor/jquery-easing/jquery.easing.min.js')}}"></script>
    <script src="http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
        {!! Toastr::message() !!}
  
    
@stack('js')
</body>
</html>
