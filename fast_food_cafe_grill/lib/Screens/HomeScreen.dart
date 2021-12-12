// ignore_for_file: prefer_final_fields, file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_food_cafe_grill/Module/Menu.dart';
import 'package:fast_food_cafe_grill/Widget/MenuTile.dart';
import 'package:fast_food_cafe_grill/dummyData.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_typing_uninitialized_variables

  // List<Menu> _listOfMeal = [
  //   Menu(
  //     id: 'm1',
  //     title: 'Spaghetti with Tomato Sauce',
  //     imageUrl:
  //         'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  //     price: 20,
  //     description: 'Meal is Good',
  //     categories: [
  //       'A',
  //       'P',
  //     ],
  //   ),
  //   Menu(
  //     id: 'm2',
  //     title: 'Toast Hawaii',
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
  //     price: 10,
  //     description: 'Something is very good',
  //     categories: [
  //       'c2',
  //     ],
  //   ),
  //   Menu(
  //     id: 'm3',
  //     categories: [
  //       'c2',
  //       'c3',
  //     ],
  //     title: 'Classic Hamburger',
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
  //     price: 45,
  //     description: 'Something is favrite',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontFamily: 'Quicksand', fontWeight: FontWeight.bold, fontSize: 20);
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            //.......................................................................................//////.....
            const ListTile(
              title: Text(
                'Recommended',
                style: textStyle,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...List.generate(
                    listOfMeal.length,
                    (index) => MenuTile(
                      imageUrl: listOfMeal[index].imageUrl,
                      title: listOfMeal[index].title,
                      price: listOfMeal[index].price,
                      id: listOfMeal[index].id,
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            const ListTile(
              title: Text(
                'Favorite',
                style: textStyle,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...List.generate(
                    listOfMeal.length,
                    (index) => MenuTile(
                      imageUrl: listOfMeal[index].imageUrl,
                      title: listOfMeal[index].title,
                      price: listOfMeal[index].price,
                      id: listOfMeal[index].id,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
