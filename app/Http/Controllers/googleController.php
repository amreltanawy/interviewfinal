<?php

namespace App\Http\Controllers;
use Validator;
use Socialite;
use auth;
use App\SocialAccountService;
use registerusers;
use App\User;
class googleController extends Controller
{
    /**
     * Redirect the user to the GitHub authentication page.
     *
     * @return Response
     */
    public function redirectToProvider()
    {
        return Socialite::driver('google')->redirect();
    }

    /**
     * Obtain the user information from GitHub.
     *
     * @return Response
     */
    public function handleProviderCallback()
   {
    $socialize_user = Socialite::with('google')->user();
    $google_user_id = $socialize_user->getId(); // unique facebook user id

   //
       $user = User::where('email', '=', $socialize_user->getEmail())->first();
       
       $rules = array('email' => 'unique:users,email');
       $input['email'] = $socialize_user->getEmail();
       
       $validator = Validator::make($input, $rules);
       
    // register (if no user)
    if (!$validator->fails()) {
        User::create([
            'name' => $socialize_user->getName(),
            'email' => $socialize_user->getEmail(),
            'id' => $socialize_user->getId(),
            'password' => bcrypt('google')
        ]);
        $user = User::find(1);
         Auth::login($user);
    }
       
       Auth::login($user);
 //return redirect('/');
    // login
    //Auth::loginUsingId($google_user_id);
       
/*if (Auth::attempt(array('email' => $socialize_user->getEmail(), 'password' => 'google'), true))
{
    Auth::login($user);
   // return Redirect::intended('dashboard');
     return Redirect::route('home');
}*/
    return redirect('home');
   }

    
   
}