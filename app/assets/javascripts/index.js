$( document ).ready(function() {
  startTime = 0;
  gifTime = 10;

  player = new Plyr('#plyr-youtube', {
    debug: false,
    controls: [],
    muted: true,
    clickToPlay: false,
    fullscreen: { enabled: false }
  });

  //imitate loop with callbacks
  //player.on('ready', event => {
  //  event.detail.plyr.currentTime = startTime;
  //  event.detail.plyr.play();
  //});

  player.on('timeupdate', event => {
    if(event.detail.plyr.currentTime >= (startTime + gifTime)){
      event.detail.plyr.currentTime = startTime;
    }
  });

  player.on('ended', event => {
    event.detail.plyr.currentTime = startTime;
  });

  jrange = $('.range-slider').jRange({
    from: 0,
    to: 100,
    step: 1,
    format: '%s',
    width: 300,
    showLabels: true,
    isRange : true,
    ondragend: function(value){
    	arrayVal = value.split(',');
    	if ((startTime != parseInt(arrayVal[0])) || (gifTime != parseInt(arrayVal[1]))) {
    		player.currentTime = parseInt(arrayVal[0]);
    	}
    	startTime = parseInt(arrayVal[0]);
    	gifTime = parseInt(arrayVal[1]);
    }
  });


  //plyr.setup("#plyr-youtube");

	$("#link-input").bind("paste", function(e){
    setTimeout(function () {
      $.get( "/home/youtube", { url: $('#link-input').val() } )
        .done(function( data ) {
          $('.video-details').removeClass('d-none');
          $('.video-title').text(data.title);
          $('#plyr-youtube').attr('data-plyr-embed-id', data.id);
          $('.range-slider').jRange('updateRange', '0,'+ data.duration.toString(), '0,10');
          player.play();
        });
    },100);
  });
});