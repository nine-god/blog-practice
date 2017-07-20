# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require unslider-min
//= require turbolinks
//= require jquery.hotkeys
//= require bootstrap-wysiwyg
//= require app

$(document).on "turbolinks:load", ->
	$('.banner').unslider(
		autoplay:true # 定义轮播是否自动执行，默认值不自动执行
		speed: 500 # 每个幻灯片动画速度(以毫秒为单位)
		delay: 5000 # 幻灯片动画之间的延迟(毫秒)
		keys: true # 启用键盘快捷键(左、右)箭头
		nav: true
		arrows:{}
		animation : "horizontal" # 规定动画效果 'horizontal', 从从左到右,'vertical'从上至下,'fade',淡入淡出

	)