$( document ).ready(function() {
  const player = new Plyr('#plyr-youtube', { autoplay: true, hideControls: true, controls: [] });
  setTimeout(() => {
	player.poster = 'https://img.youtube.com/vi/jhyANGHDDH8/0.jpg';
}, 500)
  player.on('ready', () => { 
    player.toggleControls(false); 
	});
  //plyr.setup("#plyr-youtube");

$('.range-slider').jRange({
    from: 0,
    to: 100,
    step: 1,
    format: '%s',
    width: 300,
    showLabels: true,
    isRange : true
});

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
            autoplay: true,
            hideControls: true, controls: []
          });
        });
    },100);
  });
});