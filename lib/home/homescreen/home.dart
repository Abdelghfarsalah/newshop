import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';
import 'package:null_project/home/homescreen/displayallproduct.dart';
import 'package:null_project/home/homescreen/notification.dart';
import 'package:null_project/home/homescreen/search.dart';
import 'package:null_project/home/widgets/Draweritem.dart';
import 'package:null_project/home/widgets/customproductitem.dart';
import 'package:null_project/home/widgets/loadingconatiner.dart';
import 'package:null_project/home/widgets/selsectCategories.dart';
import 'package:null_project/loginAndRegister/Login.dart';
import 'package:shimmer/shimmer.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<Categorecubit>(context);
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
        leading: IconButton(
          onPressed: () {
            key.currentState!.openDrawer();
          },
          icon: const Image(
            height: 28,
            image: AssetImage("assets/images/icon/menu.png"),
          ),
        ),
        actions: [
          // GestureDetector(
          //     onTap: () {},
          //     child: CircleAvatar(
          //       radius: 20,
          //       backgroundColor: Colors.grey.withOpacity(0.2),
          //       child: const Image(
          //         height: 20,
          //         image: AssetImage("assets/images/icon/shopping bag.png"),
          //       ),
          //     )),
          // const SizedBox(
          //   width: 10,
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => notification()),
              );
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: const Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.grey,
                  ),
                ),
                const Positioned(
                    child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.blue,
                ))
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              // decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  Text("Smart",
                      style: TextStyle(
                          fontFamily: "DancingScript",
                          fontSize: 40,
                          fontWeight: FontWeight.w900)),
                  Text("Shop",
                      style: TextStyle(
                          fontFamily: "DancingScript",
                          fontSize: 40,
                          fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            Draweritem(
                logout: false,
                title: "All Product",
                icon: const Icon(
                  FontAwesomeIcons.productHunt,
                  color: Color.fromARGB(255, 57, 156, 238),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Displayallproduct()));
                }),
            Draweritem(
                logout: false,
                title: "Search",
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 57, 156, 238),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => searchpage()));
                }),
            Draweritem(
                logout: false,
                title: "Cart",
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Color.fromARGB(255, 57, 156, 238),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 2);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 2;
                }),
            Draweritem(
                logout: false,
                title: "Favorite",
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 57, 156, 238),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 1);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 1;
                }),
            Draweritem(
                logout: false,
                title: "Setting",
                icon: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 57, 156, 238),
                ),
                onPressed: () {
                  key.currentState!.closeDrawer();
                  BlocProvider.of<NavBarcubit>(context).changescreen(index: 3);
                  BlocProvider.of<NavBarcubit>(context).currentindex = 3;
                }),
            const Spacer(),
            const Spacer(),
            Draweritem(
                title: "Log Out",
                logout: true,
                icon: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                      (predicate) => false);
                  Fluttertoast.showToast(
                      backgroundColor: Colors.blue,
                      msg: "Logout completed successfully");
                }),
            const Spacer(),
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width,
                  child: CarouselSlider(
                      items: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/Slider/176092Image1.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/Slider/b8118f49bc04df897f1db47f43a6f6bd.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/Slider/pngtree-3d-shopping-promotion-e-commerce-blue-background-picture-image_1908129.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/Slider/pngtree-online-shopping-in-kazakhstan-a-stunning-3d-rendering-for-social-media-image_3684196.jpg"))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/Slider/pngtree-shopping-mall-supermarket-selection-merchandise-poster-background-material-image_133225.jpg"))),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 100))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: selsectCategories(),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocConsumer<Categorecubit, categoriesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is Success) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: ListView.builder(
                        itemCount: state.res.length,
                        itemBuilder: (context, index) => customproductitem(
                              cart: false,
                              isfavorite: false,
                              model: state.res[index],
                            )),
                  ),
                );
              } else if (state is changecategorewithdata) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.res.length,
                      itemBuilder: (context, index) => customproductitem(
                        cart: false,
                        isfavorite: false,
                        model: state.res[index],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    child: ListView(
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                        Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: const loadingconatiner()),
                      ],
                    ));
              }
            },
          ),
        )
      ]),
    );
  }
}
/*
Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => searchpage()));
                          },
                          decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              width: 40,
                              child:
                                  Image.asset("assets/images/icon/Search.png"),
                            ),
                            hintText: "Enter the Name of product ",
                            contentPadding: const EdgeInsets.only(
                                left: 10, top: 0, bottom: 0, right: 0),
                            filled: true,
                            fillColor: Colors.blue.withOpacity(0.05),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ), */