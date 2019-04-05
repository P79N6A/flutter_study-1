class InterviewEntity {
  var code;
  var msg;
  DataEntity data;
}

class DataEntity {
  var title;
  List<News> list;

  DataEntity(this.list);
}

class News {
  final cover;
  final title;
  final author;
  final date;
  final link;
  final likeCount;
  final commentCount;

  News(
      {this.cover,
      this.title,
      this.author,
      this.date,
      this.link,
      this.likeCount,
      this.commentCount});
}
