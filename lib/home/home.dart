import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:null_project/constant.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/bottomNavBar/states.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/homescreen/search.dart';
import 'package:null_project/home/widgets/customNavBar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var contr = ZoomDrawerController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<Categorecubit>(context)
        .getcategory(category: "jewelery", index: 0);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NavBarcubit>(context);
    return Scaffold(
        extendBody: true,
        body: BlocConsumer<NavBarcubit, NavBarStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return cubit.screen[cubit.currentindex];
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => searchpage()));
          },
          child: SizedBox(
            width: 40,
            child: Image.asset("assets/images/icon/Search.png"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        bottomNavigationBar: const customNavBar());
  }
}
