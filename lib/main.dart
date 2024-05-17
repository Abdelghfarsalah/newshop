import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/firebase_options.dart';
import 'package:null_project/home/cubits/bottomNavBar/cubit.dart';
import 'package:null_project/home/cubits/categories/cubit.dart';
import 'package:null_project/home/cubits/manageLOVEandCARD.dart/manageloveandcardcubit.dart';
import 'package:null_project/home/cubits/managedetails/detailscubit.dart';
import 'package:null_project/home/cubits/managenotificationCubit/managenotificationCubit.dart';
import 'package:null_project/home/home.dart';
import 'package:null_project/loginAndRegister/cubits/logincubit/cubit.dart';
import 'package:null_project/loginAndRegister/cubits/registercubit/cubit.dart';
import 'package:null_project/onboard/Screens/onboardHome.dart';
import 'package:paymob_payment/paymob_payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PaymobPayment.instance.initialize(
    apiKey:
        "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjMk1EYzFMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuYlBOSXRHUjdiN1lSNjEzY0xHN0VZUlJ2QmJLYnl3NWdRS2V1VnItbDYxMU1iMVQ3YjlzaEhuUVE0bExTMjJNS0dQai0ybndqZVlfZlU2VndwdXRXbXc=",
    integrationID: 4574394,
    iFrameID: 845869,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent));
  runApp(const SmartpuyApp());
}

class SmartpuyApp extends StatelessWidget {
  const SmartpuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => registercubit()),
        BlocProvider(create: (context) => logincubit()),
        BlocProvider(create: (context) => NavBarcubit()),
        BlocProvider(create: (context) => Categorecubit()),
        BlocProvider(create: (context) => managenotificationCubit()),
        BlocProvider(create: (context) => ManageLove_Cart_states_cubit()),
        BlocProvider(create: (context) => detailscubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Onboard_home(),
      ),
    );
  }
}
