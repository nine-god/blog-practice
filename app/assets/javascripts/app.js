function synchronization(){
	$('textarea[name="article[text]"]').html($('#editor').html());
};



function test_ajax(){
	$.ajax({ 
		url: "/blog/welcome/test_ajax", 
		data: {test: "test123"},
		type: 'POST', 
		dataType: 'json',
		 timeout: 1000, 
		success: function(data, textStatus){
	        console.log(data)
		},
		error: function(data){
			alert("/blog/welcome/test_ajax json error")
		}
	  });

	$.ajax({ 
		url: "/blog/welcome/test_ajax", 
		data: {test: "test123"},
		type: 'GET', 
		dataType: 'xml',
		 timeout: 1000, 
		success: function(data, textStatus){
	        console.log(data)
		},
		error: function(data){
			alert("/blog/welcome/test_ajax xml error")
		}
	  });

};


function goto_url(url,limit){
	offset = ($('#page_num').val()-1)*limit
	window.location.href=url+"?"+"offset="+offset+"&&"+ "limit="+limit;
}
