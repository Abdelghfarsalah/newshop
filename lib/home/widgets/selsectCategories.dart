import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/categories/states.dart';

class selsectCategories extends StatelessWidget {
  const selsectCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<Categorecubit>(context);
    return BlocConsumer<Categorecubit, categoriesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SelsectCategoriesitem(
                category: "jewelery",
                title: "Gewelery",
                index: 0,
                isactive: cubit.index == 0,
              ),
              SelsectCategoriesitem(
                category: "electronics",
                index: 1,
                title: "Electronics",
                isactive: cubit.index == 1,
              ),
              SelsectCategoriesitem(
                category: "men's clothing",
                index: 2,
                title: "Men's clothing",
                isactive: cubit.index == 2,
              ),
              SelsectCategoriesitem(
                category: "women's clothing",
                index: 3,
                title: "Women's clothing",
                isactive: cubit.index == 3,
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelsectCategoriesitem extends StatelessWidget {
  const SelsectCategoriesitem(
      {super.key,
      required this.isactive,
      required this.title,
      required this.index,
      required this.category});
  final bool isactive;
  final String category;
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 5),
      child: GestureDetector(
        onTap: () {
          var cubit = BlocProvider.of<Categorecubit>(context);
          if (!cubit.getornot[category]!) {
            BlocProvider.of<Categorecubit>(context).changecategors(i: index);
            cubit.getcategory(category: category, index: index);
          } else {
            BlocProvider.of<Categorecubit>(context).changecategors(i: index);
            cubit.changecategorswithdata(category: category);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          width: MediaQuery.sizeOf(context).width * 0.3,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 182, 222, 255)),
            color: isactive ? Colors.blue : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: isactive ? Colors.white : Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
