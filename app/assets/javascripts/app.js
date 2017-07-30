function synchronization(){
	$('#article_text').html($('#editor').html());

};


  // function synchronization(){
  // 	var str = $('#editor').html();

  // 	$('#article_text').html(html_encode(str));
  // };
//   function html_encode(str) {
//     var s = "";
//     if (str.length == 0)
//         return "";
//     // s = str.replace(/&/g, "&gt;");
//     // s = s.replace(/</g, "&lt;");
//     // s = s.replace(/>/g, "&gt;");
//     // s = s.replace(/ /g, "&nbsp;");
//     // s = s.replace(/\'/g, "&#39;");
//     // s = s.replace(/\"/g, "&quot;");
//     // s = s.replace(/\n/g, "<br>");
//     s = str.replace(/ /g, "&nbsp;");
//     return s;
// }

function html_decode(str) {
    var s = "";
    if (str.length == 0){
      return "";
    }  
    // s = str.replace(/&gt;/g, "&");
    s = str.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    // s = s.replace(/&nbsp;/g, " ");
    s = s.replace(/&#39;/g, "\'");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/<br>/g, "\n");
    return s;
}
function show_textarea(){
	var str = $('#article_text').html()
	str = html_decode(str);
	$('#editor').html(str);
	$('#show').html(str);

};
function test_ajax(){
alert(2222)
	$.ajax({ 
		url: "/blog/welcome/test_ajax", 
		data: {test: "test123"},
		type: 'POST', 
		dataType: 'json',
		 timeout: 1000, 
		// context: document.body, 
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
		// context: document.body, 
		success: function(data, textStatus){
	        console.log(data)
		},
		error: function(data){
			alert("/blog/welcome/test_ajax xml error")
		}
	  });

}

// $("#test1234").on('click', function(){
//     alert(2222)
// })
function test_jquery(){

  $("#test_jquery").bind("click",function(){
   alert(2222)
  });

}

