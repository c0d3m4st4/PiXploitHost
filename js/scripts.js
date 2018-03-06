$(function(){
	$('#fw_405').click(function() {
	  $('#fw_405').addClass('selected');
	  $('#fw_455').removeClass('selected');
	  switchFW("405");
	});	

	$('#fw_455').click(function() {
	  $('#fw_455').addClass('selected');
	  $('#fw_405').removeClass('selected');
	  switchFW("455");
	});		
});

function switchFW(fw_ver) {	

	switch(fw_ver) {
		case "405":
			$("#exploits_455").css('display', 'none');
			$("#exploits_455").css('visibility', 'hidden');			
			$("#exploits_405").css('display', '-webkit-flex');
			$("#exploits_405").css('display', 'flex');
			$("#exploits_405").css('flex-flow', 'row wrap');
			$("#exploits_405").css('justify-content', 'space-around');
			$("#exploits_405").css('-webkit-justify-content', 'space-around');			
			$("#exploits_405").css('visibility', 'visible');			
			break;
		case "455":
			$("#exploits_405").css('display', 'none');
			$("#exploits_405").css('visibility', 'hidden');		
			$("#exploits_455").css('display', '-webkit-flex');
			$("#exploits_455").css('display', 'flex');
			$("#exploits_455").css('flex-flow', 'row wrap');
			$("#exploits_455").css('justify-content', 'space-around');
			$("#exploits_455").css('-webkit-justify-content', 'space-around');			
			$("#exploits_455").css('visibility', 'visible');
			break;
	}
} 