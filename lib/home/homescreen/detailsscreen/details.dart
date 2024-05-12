import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/homescreen/notification.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/detailsbody.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.model});
  final productmodel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text("Smart",
                style: TextStyle(
                    fontFamily: "DancingScript",
                    fontSize: 27,
                    fontWeight: FontWeight.w900)),
            Text("Shop",
                style: TextStyle(
                    fontFamily: "DancingScript",
                    fontSize: 27,
                    fontWeight: FontWeight.w900)),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: const Image(
                  height: 20,
                  image: AssetImage("assets/images/icon/shopping bag.png"),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: const Icon(
                size: 20,
                FontAwesomeIcons.cartShopping,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Detailsbody(
        model: model,
      ),
    );
  }
}
