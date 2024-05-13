import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/constant.dart';

class searchpage extends StatelessWidget {
  const searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onTap: () {},
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.x,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/icon/Search.png"))),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Recent search",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  recentsearchitem(title: "Car"),
                  recentsearchitem(title: "Dress"),
                  recentsearchitem(title: "Nike"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular search terms",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Trend",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Dress",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Bag",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Tshirt",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Accessories",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Beauty",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Farro,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class recentsearchitem extends StatelessWidget {
  const recentsearchitem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.x,
                size: 18,
                color: Colors.grey.withOpacity(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
