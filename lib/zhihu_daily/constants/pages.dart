import 'package:flutter/widgets.dart';
import '../route/routeGenerator.dart';
import '../pages/splash.dart';
import '../pages/home.dart';
import '../pages/storyDetail.dart';
import '../pages/comment.dart';
import '../pages/collection.dart';
import '../pages/login.dart';

class Pages {
  static const String SPLASH = '/splash';
  static const String HOME = '/home';
  static const String STORY_DETAIL = '/story_detail';
  static const String COMMENT = '/comment';
  static const String LOGIN = '/login';
  static const String COLLECTION = '/collection';

  static Map<String, PageBuilder> routes = {
    SPLASH: (context, params) => PageSplash(),
    HOME: (context, params) => PageHome(),
    STORY_DETAIL: (context, params) => PageStoryDetail.fromParams(params),
    COMMENT: (context, params) => PageStoryComment.fromParams(params),
    LOGIN: (context, params) => PageLogin.fromParams(params),
    COLLECTION: (context, params) => PageCollection()
  };

  static Widget firstPage(BuildContext context) {
    if (routes.length > 0) {
      return routes.entries.first.value(context, null);
    }
    return Container();
  }
}