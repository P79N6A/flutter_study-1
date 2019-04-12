import 'package:flutter/material.dart';
import '../utils/timeline_util.dart';
import '../utils/route_util.dart';
import '../widget/BannerWidgetUI.dart';
import 'SearchPageUI.dart';
import 'DrawerWidgetUI.dart';
import '../api/common_service.dart';

// 首页
class HomePageUI extends StatefulWidget {
  @override
  createState() => HomePageUIState();
}

class HomePageUIState extends State<HomePageUI>
    with AutomaticKeepAliveClientMixin {
  var _datas = List();
  var _scrollController = ScrollController(); // listview的控制器
  var _page = 0; // 加载的页数

  @override
  initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        _getMore();
      }
    });
  }

  Future<Null> getData() async {
    _page = 0;
    print("$_page");
    CommonService().getArticleList((_articleModel) {
      setState(() => _datas = _articleModel.data.datas);
    }, _page);
  }

  Future<Null> _getMore() async {
    _page++;
    print("$_page");

    CommonService().getArticleList((_articleModel) {
      setState(() => _datas.addAll(_articleModel.data.datas));
    }, _page);
  }

  @override
  build(context) => Scaffold(
        body: RefreshIndicator(
          onRefresh: getData,
          child: ListView.separated(
            itemBuilder: _renderRow,
            separatorBuilder: (context, index) =>
                Container(height: 0.5, color: Colors.black26),
            itemCount: _datas.length + 2,
            controller: _scrollController,
          ),
        ),
        drawer: DrawerDemo(),
      );

  Widget _renderRow(context, index) {
    if (index == 0) {
      return Container(
        height: 200,
        color: Colors.purple,
        child: BannerWidgetUI(),
      );
    }

    if (index - 1 < _datas.length) {
      return InkWell(
        onTap: () {
          RouteUtil.toWebView(
              context, _datas[index - 1].title, _datas[index - 1].link);
        },
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      _datas[index - 1].author,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                        child: Text(
                      TimelineUtil.format(_datas[index - 1].publishTime),
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 12),
                    )),
                  ],
                )),
            Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _datas[index - 1].title,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ))
                  ],
                )),
            Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      _datas[index - 1].superChapterName,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ],
        ),
      );
    }
    return _getMoreWidget();  
  }

  onSearchClick() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchPageUI(null)));
  }

  /// 加载更多时显示的组件,给用户提示
  _getMoreWidget() => Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );

  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
