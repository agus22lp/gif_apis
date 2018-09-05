$( document ).ready(function() {
  startTime = 0;
  gifTime = 10;

  player = new Plyr('#plyr-video', {
    debug: false,
    controls: [],
    muted: true,
    clickToPlay: false,
    autoplay: true,
    fullscreen: { enabled: false }
  });

  //imitate loop with callbacks
  player.on('ready', event => {
    event.detail.plyr.currentTime = startTime;
    event.detail.plyr.play();
  });

  player.on('timeupdate', event => {
    if(event.detail.plyr.currentTime >= (startTime + gifTime)){
      event.detail.plyr.currentTime = startTime;
    }
  });

  player.on('ended', event => {
    event.detail.plyr.currentTime = startTime;
  });

  $("#button-create").on("click", function(e){
  	$("#button-create").text('Uploading!');
  	document.getElementById("button-create").disabled = true; 
  	ranges = $('.range-slider').val().split(',');

  	$.post('/home/upload', { url: $('#link-input').val(), start : ranges[0], end: ranges[1]}, 
    	function(returnedData){
        //append gifs section, last created gif
  	    location.reload();
		});
  });

	$("#link-input").bind("paste", function(e){
    setTimeout(function () {
      $.get('/home/video_info', { url: $('#link-input').val() } )
        .done(function(data) {
          if (data.status == 'ok') {
            var video = data.video;
            $('.video-details').removeClass('d-none');
            $('.video-title').text(video.title);
            $('.range-slider').jRange({
              from: 0,
              to: video.duration,
              step: 1,
              format: '%s sec',
              width: 600,
              showLabels: true,
              isRange : true,
              ondragend: function(value){
                arrayVal = value.split(',');
                if ((startTime != parseInt(arrayVal[0])) || (gifTime != parseInt(arrayVal[1] - parseInt(arrayVal[0])))) {
                  player.currentTime = parseInt(arrayVal[0]);
                }
                startTime = parseInt(arrayVal[0]);
                gifTime = parseInt(arrayVal[1]) - parseInt(arrayVal[0]);
              }
            });
            $('.range-slider').jRange('updateRange', '0,'+ video.duration.toString(), '0,10');

            player.source = {type: 'video', sources: [{ src: video.id, provider: video.provider }]};
            player.poster = video.image_url;
          } else {
            alert('error');
          }
        });
    },100);

	});
});