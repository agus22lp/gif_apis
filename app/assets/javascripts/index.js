$( document ).ready(function() {

  var startTime = 170;
  var gifTime = 3;

  const player = new Plyr('#plyr-youtube', {
    debug: true,
    controls: [],
    muted: true,
    clickToPlay: false,
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



  $("#link-submit").on('click',function (e) {
    e.preventDefault();
    e.stopPropagation();

    //player.currentTime = 15;
    //player.duration = 10;

    player.play();

    return false;
  });


  //plyr.setup("#plyr-youtube");
/*
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
*/
});