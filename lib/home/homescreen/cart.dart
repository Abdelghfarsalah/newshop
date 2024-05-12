import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardstates.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/itemList.dart';
import 'package:null_project/home/widgets/itemgrid.dart';

class three extends StatefulWidget {
  const three({super.key});

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  bool islist = true;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ManageLove_Cart_states_cubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (!islist) {
                islist = !islist;
                setState(() {});
              }
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 750),
              child: Icon(
                Icons.list,
                size: islist ? 35 : 30,
                color: islist ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              if (islist) {
                islist = !islist;
                setState(() {});
              }
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 750),
              child: Icon(
                FontAwesomeIcons.grip,
                size: !islist ? 30 : 25,
                color: !islist ? Colors.blue : Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          BlocConsumer<ManageLove_Cart_states_cubit, magnageLoveAndCartState>(
            builder: (context, state) {
              return cubit.cartItem.length == 0
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/animaitons/cartempty.json"),
                      ],
                    ))
                  : islist
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: cubit.cartItem.length,
                            itemBuilder: (context, index) => itemlist(
                              isfavorite: false,
                              cart: false,
                              index: index,
                              model: cubit.cartItem[index],
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: cubit.cartItem.length,
                            itemBuilder: (context, index) => Hero(
                              tag: index,
                              child: itemgrid(
                                isfavorite: false,
                                cart: false,
                                model: cubit.cartItem[index],
                              ),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 350, crossAxisCount: 2),
                          ),
                        );
            },
            listener: (context, state) {},
          )
        ],
      ),
    );
  }
}
