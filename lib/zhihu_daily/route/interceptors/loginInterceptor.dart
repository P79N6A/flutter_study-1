import 'package:flutter_study/zhihu_daily/constants/pages.dart';
import 'package:flutter_study/zhihu_daily/manager/usrInfoManager.dart';
import '../routeInterceptor.dart';
import '../routeModel.dart';

class LoginInterceptor extends RouteInterceptor {
  @override
  bool intercept(RouteModel routeModel) {
    if (routeModel.path == Pages.COLLECTION) {
      return !UsrInfoManager().hasLogin();
    }
    return false;
  }

  @override
  RouteModel process(RouteModel routeModel) {
    String params = '?nextPage=' + routeModel.uri;
    return RouteModel(Pages.LOGIN + params);
  }
}
