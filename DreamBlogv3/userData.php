<?php

//Load the database configuration file
include 'config.php';
session_start();

if(isset($_POST['oauth_provider']))
{
    $oauth_provider = $_POST['oauth_provider'];
    $_SESSION['oauth_provider'] = $_POST['oauth_provider'];
    if($oauth_provider == 'facebook')
    {
        if(!empty($_POST['userData'])){
            $userData = json_decode($_POST['userData']);
            //Check whether user data already exists in database
            $prevQuery = "SELECT * FROM users WHERE oauth_provider = '".$oauth_provider."' AND oauth_uid = '".$userData->id."'";

            $prevResult = $db->query($prevQuery);
            if($prevResult->num_rows > 0){ 
                //Update user data if already exists
                $query = "UPDATE users SET first_name = '".$userData->first_name."', last_name = '".$userData->last_name."',  gender = '".$userData->gender."', locale = '".$userData->locale."', picture = '".$userData->picture->data->url."', link = '".$userData->link."', modified = '".date("Y-m-d H:i:s")."' WHERE oauth_provider = '".$oauth_provider."' AND oauth_uid = '".$userData->id."'";
                $update = $db->query($query);
            }else{
                //Insert user data
                $query = "INSERT INTO users SET oauth_provider = '".$oauth_provider."', oauth_uid = '".$userData->id."', first_name = '".$userData->first_name."', last_name = '".$userData->last_name."', gender = '".$userData->gender."', locale = '".$userData->locale."', picture = '".$userData->picture->data->url."', link = '".$userData->link."', created = '".date("Y-m-d H:i:s")."', modified = '".date("Y-m-d H:i:s")."'";
                $insert = $db->query($query);
            }
            //set session
            $_SESSION['login_user'] = $userData->id;
            echo 'no_error';

        }
        else 
            die('empty_string');


    }
    else if($oauth_provider == 'google')
    {
        require_once ('vendor/autoload.php');
        $CLIENT_ID = '1089456065411-d9cg2b0lrsrkt5g0n1miehdfuf1t90a1.apps.googleusercontent.com';
        $id_token = $_POST['idtoken'];
        $client = new Google_Client(['client_id' => $CLIENT_ID]);
        $payload = $client->verifyIdToken($id_token);
        if ($payload && $payload['aud']=== $CLIENT_ID) {
          $userid = $payload['sub'];
          $_SESSION['login_user'] = $userid;
           
            $prevQuery = "SELECT * FROM users WHERE oauth_provider = '".$oauth_provider."' AND oauth_uid = '".$userid."'";

            $prevResult = $db->query($prevQuery);
            if($prevResult->num_rows > 0){ 
                //Update user data if already exists
                $query = "UPDATE users SET first_name = '".$payload['given_name']."', last_name = '".$payload['family_name']."', locale = '".$payload['locale']."', picture = '".$payload['picture']."', modified = '".date("Y-m-d H:i:s")."' WHERE oauth_provider = '".$oauth_provider."' AND oauth_uid = '".$userid."'";
                $update = $db->query($query);
            }else{
                //Insert user data
                $query = "INSERT INTO users SET oauth_provider = '".$oauth_provider."', oauth_uid = '".$userid."', first_name = '".$payload['given_name']."', last_name = '".$payload['family_name']."', locale = '".$payload['locale']."', picture = '".$payload['picture']."', created = '".date("Y-m-d H:i:s")."', modified = '".date("Y-m-d H:i:s")."'";
                $insert = $db->query($query);
            }
          echo 'no_error';

        } else {
            echo 'invalid_google_id_token';
        }

    }

}
else 
    die('oauth_provider_not_set');

    
?>