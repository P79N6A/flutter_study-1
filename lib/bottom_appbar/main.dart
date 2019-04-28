import './fab_with_icons.dart';
import './fab_bottom_app_bar.dart';
import './layout.dart';
import 'package:flutter/material.dart';

main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  build(context) => Scaffold(
        body: Center(
          child: Text(
            _lastSelected,
            style: TextStyle(fontSize: 32.0),
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: 'A',
          color: Colors.grey,
          selectedColor: Colors.red,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
            FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
            FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
            FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFab(context),
      );

  String _lastSelected = 'TAB: 0';

  _selectedTab(index) => setState(() => _lastSelected = 'TAB: $index');

  _selectedFab(index) => setState(() => _lastSelected = 'FAB: $index');

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
