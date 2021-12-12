// ignore_for_file: prefer_final_fields, file_names

import 'dart:ui';

import 'package:fast_food_cafe_grill/Screens/ItemDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.id,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final double price;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ItemDetailScreen(id, title);
            }));
          },
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              height: 160,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridTile(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 110,
                      width: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
