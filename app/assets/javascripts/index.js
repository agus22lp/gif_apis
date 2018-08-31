$( document ).ready(function() {
  const player = new Plyr('#plyr-youtube', {
    debug: true,
    controls: [],
    muted: true,
    clickToPlay: false,
    //resetOnEnd: true,
    autoplay: true,
    fullscreen: { enabled: false }
  });



  
  //imitate loop with callbacks
  player.on('ready', event => {
    event.detail.plyr.currentTime = 170;
  });

  player.on('timeupdate', event => {
    if(event.detail.plyr.currentTime >= 175){
      event.detail.plyr.currentTime = 170;
    }
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