$( document ).ready(function() {
  const player = new Plyr('#plyr-youtube', { autoplay: true });

  //plyr.setup("#plyr-youtube");

	$("#link").bind("paste", function(e){
    setTimeout(function () {
      $('#video-div').html('<div id="plyr-youtube" data-plyr-provider="youtube" data-plyr-embed-id=""></div>');
      $.get( "/home/youtube", { url: $('#link-input').val() } )
        .done(function( data ) {
          $('.card').show();
          $('.card-title').text(data.title);
          $('#duration').attr('max', data.duration);
          $('#plyr-youtube').attr('data-plyr-embed-id', data.id);
          new Plyr('#plyr-youtube', {
            autoplay: true
          });
        });
    },100);
  });
});