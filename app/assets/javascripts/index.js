$( document ).ready(function() {
  plyr.setup("#plyr-youtube");

	$("#link").bind("paste", function(e){
	    setTimeout(function () {
	    	$.get( "/home/youtube", { url: $('#link-input').val() } )
				  .done(function( data ) {
				  	$('#iframe-video').attr('src', $('#link-input').val());
				    $('.card').show();
				    $('.card-title').text(data.title);
				    $('#duration').attr('max', data.duration);
				    
				  });
    }, 100);
	} );
});