<?php

/**
 * Description of UseController
 *
 * @author Riyas
 * @Date :09/10/209
 * This Class is used for User role managment
 */
namespace App\Http\Controllers\UserRole;
use Illuminate\Http\Request;
use App\User;
use Validator;
class UserRoleController{
    
   
    public function index()
      {
 
      $users  = User::all();
 
      return response()->json($users);
 
      }

  
  
  public function createUser(Request $request){
      $messages=NULL;
      $user=NULL;
        $rules = array(
                 'user_name'    => 'required|max:50',
                 'password' => 'required',
                 );
        $validator = Validator::make($request->all(), $rules);

    if ($validator->passes()) 
        {
        if("1"==$request->input('role_id'))
        {
             $messages="Cant change Super Admin's Role";
        }
        else
        {
            $user = new User;
            $user->user_name = $request->input('user_name');
            
            $plainPassword = $request->input('password');
            
            $user->password = app('hash')->make($plainPassword);
            $user->role_id =  $request->input('role_id');
            $existingUser = User::where('user_name', $request->input('user_name')) ->get();
           
           
              $checkIfexists=$existingUser->count(); 
              if($checkIfexists==0)
              {
                   try {
                    $user->save();
                    $messages = "User created";
                } catch (\Exception $e) {
                    $messages = "Something went wrong" . $e;
                }
            }
              else
              {
                   $messages="User Already exists";
              }
        }
          
        } 
   else {
      
            $messages = $validator->messages();
          
         }
      
           

        return response()->json(['message' => $messages]);
      
 
  }
    public function updateUser($userid,Request $request)
    {
      $messages=NULL;
      $user=NULL;
      
         $data = ['id' => $userid];
         $rules = array(
                 'id'    => 'required',
                 
                 );
        $validator = Validator::make($data, $rules);

    if ($validator->passes()) 
        {
      
            if("1"==$userid)
           {
                $messages="Cant change Super Admin's Role";
           }
           else
           {
            $user= User::find($userid);
                if($user === null)
                {
                       $messages = "No user found";
                
                }
                else {
                   $user->role_id =  $request->input('role_id');

                       try {
                        $user->save();
                        $messages = "User Updated";
                    } catch (\Exception $e) {
                        $messages = "Something went wrong" . $e;
                    }
                }
             }
          
        } 
   else {
      
            $messages = $validator->messages();
          
         }
      
           

        return response()->json(['message' => $messages]);
      
 
  }

}
