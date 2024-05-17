import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/loginAndRegister/widgets/custombutton.dart';

class editscreen extends StatelessWidget {
  const editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Personal information",
          style: TextStyle(
              //color: Colors.grey.withOpacity(0.8),
              fontSize: 22,
              fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                clipBehavior: Clip.none,
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
                        backgroundImage:
                            AssetImage("assets/images/icon/9434619.png"),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 130,
                      left: 110,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue, width: 3),
                            shape: BoxShape.circle),
                        child: GestureDetector(
                            onTap: () {},
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.camera,
                                color: Colors.white,
                                size: 15,
                              ),
                            )),
                      )),
                ],
              ),
              const Changeinfo(
                  title: "First Name", hint: "abdelghfar", pass: false),
              const Changeinfo(title: "Last Name", hint: "salah", pass: false),
              const Changeinfo(
                  title: "Email", hint: "abdelghfar8@gmail.com", pass: false),
              const Changeinfo(title: "Password", hint: "012354", pass: false),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Column(
                              children: [
                                const Text(
                                  "Congratulations",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w900),
                                ),
                                const Text(
                                  "Your profile has been updated successfully",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(250, 40),
                                          backgroundColor: Colors.blue),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Go To Your Profile",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900),
                                      )),
                                )
                              ],
                            ),
                            icon: Image.asset("assets/ic_launcher.png"),
                          ));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  decoration: const BoxDecoration(
                    color: Color(0xff2296F3),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "Change",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Changeinfo extends StatelessWidget {
  const Changeinfo(
      {super.key, required this.title, required this.hint, required this.pass});
  final String title;
  final String hint;
  final bool pass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              hintText: hint,
            ),
            obscureText: pass,
          )
        ],
      ),
    );
  }
}
