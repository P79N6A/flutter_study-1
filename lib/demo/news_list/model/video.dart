class VideoUrlModel {
  var code;
  var msg;
  var data;
  factory VideoUrlModel(jsonStr) => VideoUrlModel.fromJson(jsonStr);
  VideoUrlModel.fromJson(res) {
    data = Data.fromJson(res['data']);
  }
}

class Data {
  var title;
  var playList = [];
  Data.fromJson(res) {
    for (var item in res['play_list']) {
      playList.add(Video.fromJson(item));
    }
  }
}

class Video {
  var playUrl;
  var title;
  Video.fromJson(res) {
    playUrl = res['playUrl'];
    title = res['title'];
  }
}
