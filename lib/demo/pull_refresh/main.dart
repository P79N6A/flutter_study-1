import 'dart:async';

import 'package:flutter/material.dart';
import './list_refresh.dart' as listComp;
import 'first_page_item.dart';
import 'list_view_item.dart';
import 'net_utils.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage()));

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  get headerView => Row(
        children: <Widget>[
          Text('xasdfsadfsadf'),
          Text('xasdfsadfsadf'),
          Text('xasdfsadfsadf'),
          Text('xasdfsadfsadf'),
          Text('xasdfsadfsadf'),
        ],
      );

  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    const juejin_flutter =
        'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param = {'page': pageIndex, 'pageSize': 20, 'sort': 'rankIndex'};
    var responseList = [];
    var pageTotal = 0;
    try {
      var response = await NetUtils.get(juejin_flutter, params: _param);
      responseList = response['d']['entrylist'];
      pageTotal = response['d']['total'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
    } catch (e) {}
    pageIndex += 1;
    List resultList = List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        FirstPageItem cellData = FirstPageItem.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {
      "list": resultList,
      'total': pageTotal,
      'pageIndex': pageIndex
    };
    return result;
  }

  Widget makeCard(index, item) {
    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';
    return ListViewItem(
      itemUrl: codeUrl,
      itemTitle: myTitle,
      data: myUsername,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: listComp.ListRefresh(getIndexListData, makeCard, headerView));
}
