import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/bottomNavBar/states.dart';

class customNavBar extends StatefulWidget {
  const customNavBar({super.key});

  @override
  State<customNavBar> createState() => _customNavBarState();
}

class _customNavBarState extends State<customNavBar> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NavBarcubit>(context);
    return BlocBuilder<NavBarcubit, NavBarStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: cubit.currentindex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          elevation: 10,
          selectedLabelStyle: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800),
          onTap: (index) {
            BlocProvider.of<NavBarcubit>(context).changescreen(index: index);
          },
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                icon: customnavbaritem(
                  icon: FontAwesomeIcons.house,
                  index: 0,
                )),
            BottomNavigationBarItem(
                label: "Favorite",
                icon: customnavbaritem(
                  icon: Icons.favorite,
                  index: 1,
                )),
            BottomNavigationBarItem(
                label: "Cart",
                icon: customnavbaritem(
                  icon: FontAwesomeIcons.cartShopping,
                  index: 2,
                )),
            // BottomNavigationBarItem(
            //     label: "Search",
            //     icon: customnavbaritem(
            //       icon: Icons.search,
            //       index: 1,
            //     )),
            BottomNavigationBarItem(
                label: "Profile",
                icon: customnavbaritem(
                  icon: FontAwesomeIcons.user,
                  index: 3,
                )),
            // BottomNavigationBarItem(
            //   label: "",
            //   icon: customnavbaritem(
            //     icon: FontAwesomeIcons.user,
            //     index: 4,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

class customnavbaritem extends StatelessWidget {
  const customnavbaritem({super.key, required this.index, this.icon});
  final int index;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NavBarcubit>(context);
    return Icon(
      icon,
    );
  }
}
