// ignore_for_file: prefer_final_fields, file_names
import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';

import 'package:fast_food_cafe_grill/Screens/CartScreen.dart';
import 'package:fast_food_cafe_grill/Screens/MenuScreen.dart';
import 'package:fast_food_cafe_grill/Screens/HomeScreen.dart';

const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Menu': Icons.restaurant_sharp,
  'Bucket': Icons.add_shopping_cart_outlined,
  'Favorite': Icons.favorite_border,
  'More': Icons.more_vert,
};
int index = 0;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  TabStyle _tabStyle = TabStyle.reactCircle;
  List<Widget> _listpages = <Widget>[
    const HomeScreen(),
    const MenuScreen(),
    const CartScreen(),
    // PreviousRecord(),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            /// perform action here
            print(value);
          },
          activeIcon: Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(
              Icons.camera_alt,
              size: 50,
              color: Colors.orange,
            ),
          ),
          inActiveIcon: Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 50,
              color: Colors.orange,
            ),
          ),
          text: "Camera"),
      activeColor: Colors.blue,
      navBarBackgroundColor: Colors.limeAccent,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.black26,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.blue,
            ),
            inActiveIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.black26,
            ),
            text: 'Wallet'),
      ],
      bodyItems: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.pinkAccent,
        )
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      );
    //   return DefaultTabController(
    //     length: 5,
    //     initialIndex: 0,
    //     child: Scaffold(
    //       body: _pages.elementAt(index),
    //       bottomNavigationBar: ConvexAppBar.badge(
    //         // Optional badge argument: keys are tab indices, values can be
    //         // String, IconData, Color or Widget.
    //         /*badge=*/ const <int, dynamic>{3: '2'},
    //         style: _tabStyle, backgroundColor: const Color(0xFF3F51B5),
    //         activeColor: Colors.white,
    //         color: Colors.white,
    //         items: <TabItem>[
    //           for (final entry in _kPages.entries)
    //             TabItem(icon: entry.value, title: entry.key),
    //         ],
    //         onTap: (int i) => setState(() {
    //           index = i;
    //         }),
    //       ),
    //     ),
    //   );
  }
}
