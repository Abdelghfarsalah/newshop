import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managedetails/detailsStates.dart';
import 'package:null_project/home/cubits/managedetails/detailscubit.dart';
import 'package:null_project/home/widgets/Selectcoloritem.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({super.key});

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<detailscubit>(context);
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Text(
            "Color",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 16, color: Colors.grey),
          ),
        ),
        BlocConsumer<detailscubit, DetailsStates>(
          listener: (context, st) {},
          builder: (context, st) {
            var cubit = BlocProvider.of<detailscubit>(context);
            return SizedBox(
              height: 100,
              width: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cubit.colors.length,
                itemBuilder: (context, index) => Selectcoloritem(
                  isactive: cubit.colorindex == index,
                  i: index,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
