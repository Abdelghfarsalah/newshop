import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_project/home/cubits/managedetails/detailsStates.dart';

class detailscubit extends Cubit<DetailsStates> {
  detailscubit() : super(init());
  int colorindex = 0;
  int sizeindex = 0;
  List<Color> colors = const [
    Color(0xff309DF4),
    Color(0xffD4EBF1),
    Color(0xffEAD8C3),
    Color(0xffFFFFFF),
    Color(0xffF6F6F6),
    Color(0xff262A2E),
    Color(0xff362C23),
    Color(0xff62554D),
  ];
  List<String> Sizes = [
    "14.2",
    "15.8",
    "16.0",
    "16.5",
    "18.5",
  ];
  void changecolor({required int i}) {
    colorindex = i;
    emit(changeccolor());
  }

  void changesize({required int i}) {
    sizeindex = i;
    emit(changeSizeds());
  }
}
