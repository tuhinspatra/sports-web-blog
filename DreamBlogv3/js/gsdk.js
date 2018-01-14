var clicked = false;

$(function(){
	$('#myg-signin2').on('click',function(){
		clicked = true;
	});
});


function onSuccess(googleUser) {
	if(clicked === true)
	{
		var id_token = googleUser.getAuthResponse().id_token;

	  	$.ajax({
		    type: "POST",
		    url: 'userData.php',
		    data : {oauth_provider:'google', idtoken:id_token},
		    timeout : 3000,
		    tryCount : 0,
		    retryLimit : 3,
		    dataType : 'text',
		    beforeSend: function() {
		      $("#gloginbtn").hide();
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
		        $("#gloginbtn").show();
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

		            $("#gloginbtn").show();
		            alert('All attempts failed.');
		          }           
		      }
		      else{
		        //other error
		        console.log(xhr.status); //gives 0 generally
		        ajaxstarted = false;
		        $("#gloginbtn").show();
		        alert('Something went wrong...');
		      }
		    }
		 
		});
	}
}
function onFailure(error) {
  console.log(error);
}
function renderButton() {
  gapi.signin2.render('myg-signin2', {
    'scope': 'profile email',
    'width': 270,
    'height': 40,
    'longtitle': true,
    'theme': 'dark',
    'onsuccess': onSuccess,
    'onfailure': onFailure
  });
}
