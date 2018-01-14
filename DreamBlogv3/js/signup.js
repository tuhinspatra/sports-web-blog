
var plc = $('#intload');
var inpInt = $("#inputInterests");
$(function(){

	inpInt.on('keyup', function(){
		//first clear list...
		plc.hide();
		plc.html('<div class="list-group">');
		
		//now include new entries
		var interest = inpInt.val();
		if(interest != '')
		{
			$.getJSON('reg-Interests.php',{interest: interest},function(data){
				$.each(data, function(key, val){
					tid =  val.TopicID ;
					var tp = val.Topic;
					plc.append('<a href="javascript:void(0)" onClick="choose(\'' + tp + '\');" id="topic-' + tp + '" class="list-group-item">' + tp + '</a>');
				});
			});
		}
		plc.append('</div>');
		//now show the list
		plc.show();




	});


	var inpUsr = $("#inputUsername");
	inpUsr.on('keydown', function() {
		$("#msg").children().slideUp();
	});

	inpUsr.on('blur', function(){
		var unm = inpUsr.val();
		if(unm != '')
		{
			$.ajax({
			    type: "POST",
			    url: 'registered-users.php',
			    data : { user_name: unm},
			    timeout : 3000,
			    tryCount : 0,
			    retryLimit : 3,
			    dataType : 'text',
			    success : function(data) {
			      var result = $.trim(data);
			      console.log(result);
			      var msg =  $("#msg");

			      if(result == 'available')
			      {
			        msg.html('<span class=" form-control alert alert-success">This username is available. Good to go!</span>').hide().slideDown();
			      }
			      else if(result == 'taken')
			      {
			        msg.html('<span class=" form-control alert alert-warning">This username is taken. Try Something else.</span>').hide().slideDown();
			      }
			      else
			      {
			      	console.log(result);
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

			            alert('All attempts failed.');
			          }           
			      }
			      else{

			        //other error
			        console.log(xhr.status); //gives 0 generally
			        alert('Something went wrong...');
			      }
			    }
			 
			});
			

		}
	});
});

/*
$('a').on('mousein',function(){
	alert("mousein");
	$(this).addClass('active');
});
$('a').on('mouseout',function(){
	$(this).removeClass('active');
});
$('a').on('click',function(){
	inpInt.val($(this).text());
	plc.hide();
});
*/

function choose(tp)
{
	inpInt.val(tp);
	plc.hide();
}