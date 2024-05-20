import 'package:flutter/material.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 102,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/background.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "SmartShop: Your Smart Online",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Text(
                "Welcome to SmartShop, the premier platform for smart online shopping! We offer you a distinctive shopping experience that combines ease, convenience, and innovation. At SmartShop, you'll find everything you need, from high-quality products at competitive prices.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Features of SmartShop:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              Text(
                "1-Product Variety",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "2-Ease of Use",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "3-Offers and Discounts",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "4-Outstanding Customer Service",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "5-Secure and Multiple Payment Options",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "6-Fast and Secure Delivery",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "7-Flexible Return Policy",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Join the SmartShop family today and enjoy an unparalleled shopping experience!",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
