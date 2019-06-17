function angle(lon1, lat1, lon2, lat2) {
  var deltaX = lon2 - lon1;
  return 90 - Math.atan2(Math.sin(deltaX), Math.cos(lat1)*Math.tan(lat2) - Math.sin(lat1)*Math.cos(deltaX));
}

function distance(lng1, lat1, lng2, lat2) {
  function radians(deg){
    return deg * Math.PI / 180;
  }

  return 6378.14 * Math.acos(Math.cos(radians(lat1))*
    Math.cos(radians(lat2))*
    Math.cos(radians(lng2)-radians(lng1))+
    Math.sin(radians(lat1))*
    Math.sin(radians(lat2)));
}
function direction(lng1, lat1, lng2, lat2) {
  var Y = Math.cos(lng2 * Math.PI / 180) * Math.sin(lat2 * Math.PI / 180 - lat1 * Math.PI / 180);
  var X = Math.cos(lng1 * Math.PI / 180) * Math.sin(lng2 * Math.PI / 180) - Math.sin(lng1 * Math.PI / 180) * Math.cos(lng2 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180 - lat1 * Math.PI / 180);
  var dirE0 = 180 * Math.atan2(Y, X) / Math.PI;
  if (dirE0 < 0) {
    dirE0 = dirE0 + 360;
  }
  var dirN0 = (dirE0 + 90) % 360;
  return dirN0;
}

$(document).on('turbolinks:load', function() {
  var $compassArrow = $('.js-compassArrow');
  var destData = $compassArrow.data();

  if(document.URL.match(/missions\/\d+/)) {
    var wOptions = {
      "enableHighAccuracy": true,
      "timeout": 5000,
      "maximumAge": 0,
    };

    navigator.geolocation.watchPosition(
      function(data) {
        var _direction = direction(data.coords.longitude, data.coords.latitude, destData.longitude, destData.latitude)
        var _distance = distance(data.coords.longitude, data.coords.latitude, destData.longitude, destData.latitude)
        $('.js-compassArrow').css('transform', 'rotate(' + _direction + 'deg)');
        $('.js-distanceNumber').text(_distance > 1.0 ? Math.round(_distance) : Math.round(_distance*1000.0));
        $('.js-distanceUnit').text(_distance > 1.0? 'KM': 'M');


        if (_distance <= 0.5) {
          $('.js-compassNextBtn').removeClass('disable').text('開く');
        } else {
          $('.js-compassNextBtn').addClass('disable').text('近づいてください');
        }


      },
      function(argErr) {
        switch(argErr.code){
          case 1 : wErrMsg = "位置情報の利用が許可されていません";break;
          case 2 : wErrMsg = "デバイスの位置が判定できません";break;
          case 3 : wErrMsg = "タイムアウトしました";break;
        }
        console.log(wErrMsg);
      }, wOptions
    );
  }
});
