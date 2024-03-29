// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require sync
//= require wiselinks
//= require_tree .

$(function(){ $(document).foundation(); });
$(function(){
	window.wiselinks = new Wiselinks();

	$(document).off('page:loading').on('page:loading', function(event, $target, render, url) {
		console.log('WiseLinks: Page: Loading');
    });

    $(document).off('page:done').on('page:done', function(event, $target, status, url, data) {
        console.log('WiseLinks: Page: Done');
    });
});
