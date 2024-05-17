import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/homescreen/notification.dart';
import 'package:null_project/home/model/productmodel.dart';
import 'package:null_project/home/widgets/detailsbody.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.model});
  final productmodel model;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var cubti = BlocProvider.of<ManageLove_Cart_states_cubit>(context);
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
        actions: [
          GestureDetector(
              onTap: () {
                {
                  print(widget.model.isactive);
                  if (widget.model.isactive) {
                    cubti.removefromLove(item: widget.model);
                  } else {
                    cubti.addtolove(item: widget.model);
                  }
                  widget.model.isactive = !widget.model.isactive;
                  setState(() {});
                }
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Icon(
                  Icons.favorite,
                  color: widget.model.isactive
                      ? Colors.blue
                      : Colors.grey.withOpacity(0.7),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.model.cart) {
                cubti.addtocart(item: widget.model);
              } else {
                cubti.removefromcart(item: widget.model);
              }
              widget.model.cart = !widget.model.cart;
              setState(() {});
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.2),
              child: Icon(
                size: 20,
                FontAwesomeIcons.cartShopping,
                color: widget.model.cart
                    ? Colors.blue
                    : Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Detailsbody(
        model: widget.model,
      ),
    );
  }
}
