$( document ).ready(function() {
	$("#link").bind("paste", function(e){
	    setTimeout(function () {
	    	$.get( "/home/youtube", { url: $('#link').val() } )
				  .done(function( data ) {
				  	alert(data);
				    $('.card-title').text(data.title);
				    $('.card-text').text(data.duration);
				  });
    }, 100);
	} );
});