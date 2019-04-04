import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  build(context) => Scaffold(
        primary: true,
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFF1F7FB)),
          child: Center(
            child: PageView(
              physics: BouncingScrollPhysics(),
              pageSnapping: false,
              controller: PageController(viewportFraction: 0.6),
              children: [
                CardWidget('篮球节！',
                    'https://d7ieeqxtzpkza.cloudfront.net/wp-content/uploads/2018/11/foto-baschet.jpg'),
                CardWidget('让我们踢足球吧！',
                    'https://media2.fdncms.com/eastbayexpress/imager/u/original/17703015/soccer-ball-ss-img.jpg'),
                CardWidget('美式橄榄球',
                    'https://www.history.com/.image/ar_16:9,c_fill,cs_srgb,fl_progressive,g_faces:center,q_auto:good,w_620/MTU3ODc4NjAwMDI2ODkxNTkz/the-nfl-begins-football-grass-2014-hero-2.jpg'),
              ],
            ),
          ),
        ),
      );
}
