var gid = parseInt($('#gid').text()), mid = 0, msg = $("#msg");
function show()
{

	console.log("showing..."); 
	$.getJSON('refresh_chat.php',{gid: gid, mid: mid },function(data){
		var show = $('#show');
		$.each(data, function(key, val){
			mid =  val.ChatMessageID ;
			var sid = val.ChatSenderID;
			show.append('<li style="width:100%;">' +
                    '<div class="msj-rta macro">' +
                        '<div class="text text-r">' +
                            '<p>'+val.ChatText+'</p>' +
                            '<p><small>'+val.ChatMessageTime+'</small></p>' +
                        '</div>' +
                    '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+you.avatar+'" /></div>' +                                
              '</li>' );
		});
	});
	setTimeout(show,1000);

}


function send()
{
	$.getJSON('submit_chat.php',{msg:msg.val(),gid: gid });
	msg.val('');
}
	
msg.on('keydown',function(e){
	if(e.keyCode == 13){
		$('#send').trigger('click');
	}
});

$('#send').on('click submit', send);

$(show);




var you = {};
you.avatar = "https://a11.t26.net/taringa/avatares/9/1/2/F/7/8/Demon_King1/48x48_5C5.jpg";           
