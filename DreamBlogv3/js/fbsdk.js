var ajaxstarted = false;
//var clicked = false;




  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1936088303289631',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.9'
    });
    FB.AppEvents.logPageView();



    FB.getLoginStatus(function(response) {
    
      console.log(response);
      if(response.status === 'connected')
      {
        //connected before clicking....have granted permission earlier...
        //Prevent automatically logging in by providing a link.
        //$("#fbloginbtn").hide();
        
        $("#fbloginbtn").html('<a href="#" onclick="ajaxstarted = true;getFbUserData();"><b>Facebook</b>: You have already granted permission to this app. Click to continue.</a>');

      }
      /*else if (response.status === 'not_authorized') {

        // the user is logged in to Facebook, 
        // but has not authenticated your app
      } */else 
      {
        // the user isn't logged in to Facebook.
         FB.Event.subscribe('auth.login', function(response) {
 
          //window.location.reload(true);
          FB.getLoginStatus(function(response) {
          
            if(response.status === 'connected' && ajaxstarted === false )
            {
              console.log(response);
              ajaxstarted = true;
              getFbUserData();
            }
            else if (response.status === 'not_authorized') {

              // the user is logged in to Facebook, 
              // but has not authenticated your app
            } else 
            {
              // the user isn't logged in to Facebook.

            }
          }); 

        

        });


      }
    }); 
 
  FB.Event.subscribe('auth.logout', function(response) {

  });

};



(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/en_US/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));


function getFbUserData() {
  FB.api('/me', { locale: 'en_US', fields: 'id, first_name,last_name,link, gender, locale, picture'},
    function(response) {
      saveUserData(response);

  });
}


function saveUserData(userData){

  $.ajax({
    type: "POST",
    url: 'userData.php',
    data : {oauth_provider:'facebook',userData: JSON.stringify(userData)},
    timeout : 3000,
    tryCount : 0,
    retryLimit : 3,
    dataType : 'text',
    beforeSend: function() {
      $("#fbloginbtn").hide();
    },
    complete: function() {
    },
    success : function(data) {
      var result = $.trim(data);
      console.log(result);
      if(result == 'no_error')
      {
        //alert("redirecting...");

        window.location.replace('http://localhost/DreamBlogv2/home.php');
      }
      else 
      {
        
        $("#fbloginbtn").show();
        alert('Error: ' + result);
      }

    },
    error: function(xhr, textStatus, errorThrown) {
      if(textStatus==="timeout") {  
          console.log("Call has timed out");
          this.tryCount++;
          if (this.tryCount <= this.retryLimit) {
              //try again
              console.log("Trying again...");
              $.ajax(this);
          } 
          else{

            $("#fbloginbtn").show();
            alert('All attempts failed.');
          }           
      }
      else{
        //other error
        console.log(xhr.status); //gives 0 generally
        ajaxstarted = false;
        $("#fbloginbtn").show();
        alert('Something went wrong...Try again.');
      }
    }

  });


}

