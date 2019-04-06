import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Icon(Icons.fingerprint))),
        drawer: Drawer(child: CustomDrawer()),
        body: Center(child: Text('主页')),
      );
}

class CustomDrawer extends StatelessWidget {
  @override
  build(context) => ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountEmail: Text('xxxx@gmail.com'),
          accountName: Text('用户名'),
          currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://image.pexels.com/photos/406014/pexels-photo-406014.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                  scale: 5.0)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.pexels.com/photos/275289/pexels-photo-275289.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                  fit: BoxFit.fill)),
        ),
        ListTile(
            leading: Icon(Icons.https),
            title: Text('主页'),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle: Text('data'),
            dense: true),
        ListTile(
          title: Text('测试'),
          leading: Icon(Icons.hotel),
          subtitle: Text('data'),
          trailing: Icon(Icons.insert_emoticon),
          selected: true,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('分享'),
          subtitle: Text('data'),
          trailing: Icon(Icons.arrow_forward_ios),
          selected: true,
        ),
      ]);
}
