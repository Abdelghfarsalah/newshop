import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/homescreen/userscreen/editscreen.dart';
import 'package:null_project/home/widgets/Draweritem.dart';
import 'package:null_project/loginAndRegister/Login.dart';

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  bool password = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     splashRadius: 30,
        //     icon: const Icon(
        //       FontAwesomeIcons.penToSquare,
        //       size: 28,
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3),
                  shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 77,
                  backgroundImage: AssetImage("assets/images/icon/9434619.png"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Text(
                  "John Wick",
                  style: TextStyle(
                      fontFamily: Farro,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Actor",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue.withOpacity(0.4)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(.4),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => editscreen()));
                              },
                              icon: const Icon(Icons.arrow_forward_ios)),
                          title: const Text("Edit Profile"),
                          leading: const Icon(FontAwesomeIcons.solidCircleUser,
                              color: Colors.blue),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1,
                          endIndent: 10,
                          indent: 10,
                        ),
                        ListTile(
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                          title: const Text("Setting"),
                          leading:
                              const Icon(Icons.settings, color: Colors.blue),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1,
                          endIndent: 10,
                          indent: 10,
                        ),
                        ListTile(
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                          title: const Text("Help Center "),
                          leading: const Icon(FontAwesomeIcons.alignCenter,
                              color: Colors.blue),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1,
                          endIndent: 10,
                          indent: 10,
                        ),
                        ListTile(
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                          title: const Text("About us"),
                          leading: const Icon(FontAwesomeIcons.users,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(.4),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: ListTile(
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()),
                          (predicate) => false);
                      Fluttertoast.showToast(
                          backgroundColor: Colors.blue,
                          msg: "Logout completed successfully");
                    },
                    icon: const Icon(
                      FontAwesomeIcons.rightFromBracket,
                      color: Colors.red,
                    )),
                title: const Text(
                  "LOgouft",
                  style: TextStyle(
                      fontSize: 22, color: Colors.red, fontFamily: Farro),
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
