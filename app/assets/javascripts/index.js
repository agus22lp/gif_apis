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

  const jrange = $('.range-slider').jRange({
    from: 0,
    to: 100,
    step: 1,
    format: '%s',
    width: 300,
    showLabels: true,
    isRange : true,
    ondragend: function(value){
    	arrayVal = value.split(',');
    	//if ((startTime != parseInt(arrayVal[0]) || (gifTime != parseInt(arrayVal[1]))) {

    	//}
    	startTime = parseInt(arrayVal[0]);
    	gifTime = parseInt(arrayVal[1]);
    }
  });


  //plyr.setup("#plyr-youtube");

	$("#link-input").bind("paste", function(e){
    setTimeout(function () {
      $('#video-div').html('<div id="plyr-youtube" data-plyr-provider="youtube" data-plyr-embed-id=""></div>');
      $.get( "/home/youtube", { url: $('#link-input').val() } )
        .done(function( data ) {
          $('.video-details').removeClass('d-none');
          $('.video-title').text(data.title);
          //$('#duration').attr('max', data.duration);
          $('#plyr-youtube').attr('data-plyr-embed-id', data.id);
          player.source = {
					    type: 'video',
					    sources: [
					        {
					            src: 'bTqVqk7FSmY',
					            provider: 'youtube',
					        },
					    ],
					};
          console.log(player);
        });
    },100);
  });
});