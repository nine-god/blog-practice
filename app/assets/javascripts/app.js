// $(document).ready(function(){
// 	// alert("1111")


// });

// // $(document).on "turbolinks:load", ->
// //   alert "page has loaded!"
// document.addEventListener("turbolinks:load", function() {
// 	$('.banner').unslider({
// 		autoplay:true, // 定义轮播是否自动执行，默认值不自动执行
// 		speed: 500, // 每个幻灯片动画速度(以毫秒为单位)
// 		delay: 5000, // 幻灯片动画之间的延迟(毫秒)
// 		keys: true, // 启用键盘快捷键(左、右)箭头
// 		nav: true,
// 		arrows:{},
// 		animation : "horizontal" // 规定动画效果 'horizontal', 从从左到右,'vertical'从上至下,'fade',淡入淡出

// 	});
// })
// $('#editor').wysiwyg();
 // $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      $('#voiceBtn').hide();
      // if ("onwebkitspeechchange"  in document.createElement("input")) {
      //   var editorOffset = $('#editor').offset();
      //   $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      // } else {
      //   $('#voiceBtn').hide();
      // }
    };

  // });

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
    if (str.length == 0)
        return "";
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