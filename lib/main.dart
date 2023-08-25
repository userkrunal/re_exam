import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam/covid-19/view/covid_screen.dart';
import 'package:re_exam/covid-19/view/searsh_screen.dart';
import 'package:re_exam/covid-19/view/show_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(p0) => HomeScreen(),
          '/search':(p0) => SearchScreen(),
          '/show':(p0) => ShowScreen(),
        },
      );
    },)
  );
}