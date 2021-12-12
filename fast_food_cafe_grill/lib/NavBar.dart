// ignore_for_file: prefer_final_fields, file_names
import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const BottomAppBar(
          elevation: 0.3,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          color: Color(0xff1c1f26),
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: SizedBox(
            width: double.infinity,
            height: 60,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
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
