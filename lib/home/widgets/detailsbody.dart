import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/homescreen/detailsscreen/buypage.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/SelectColor.dart';
import 'package:null_project/home/widgets/custombuttonforbuy.dart';
import 'package:null_project/home/widgets/selectSize.dart';

class Detailsbody extends StatefulWidget {
  const Detailsbody({super.key, required this.model});
  final productmodel model;

  @override
  State<Detailsbody> createState() => _DetailsbodyState();
}

class _DetailsbodyState extends State<Detailsbody> {
  int size = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(height: 150, widget.model.image),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Text(
                      widget.model.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Text(
                      widget.model!.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: Farro,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      widget.model.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: Farro,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "\$ ${widget.model.price} ",
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: Farro,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue),
                    ),
                  ),
                  Row(
                    children: [
                      SelectColor(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Sized",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: Farro,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  size = 0;
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: size == 0 ? Colors.blue : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "S",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Farro,
                                      fontWeight: FontWeight.w400,
                                      color: size == 0
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  size = 1;
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: size == 1 ? Colors.blue : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "M",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Farro,
                                      fontWeight: FontWeight.w400,
                                      color: size == 1
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  size = 2;
                                  setState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: size == 2 ? Colors.blue : null,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "L",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Farro,
                                      fontWeight: FontWeight.w400,
                                      color: size == 2
                                          ? Colors.white
                                          : Colors.grey,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => buybage(
                      model: widget.model,
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                color: Colors.black,
                width: MediaQuery.sizeOf(context).width,
                child: const Row(
                  children: [
                    Text(
                      "  pay now",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: Farro,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 162, 162, 162),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 96, 94, 94),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 56, 55, 55),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Color.fromARGB(255, 30, 30, 30),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
