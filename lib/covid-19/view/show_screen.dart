import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam/covid-19/controller/covid_controller.dart';
import 'package:re_exam/covid-19/model/covid_model.dart';
import 'package:sizer/sizer.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override

  Widget build(BuildContext context) {

    CovidController controller=Get.put(CovidController());
    int index=Get.arguments;
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text("${controller.covid[index].country}",style: TextStyle(fontSize: 30),),
          Container(
           height: 15.h,
            width: 100.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${controller.covid[index].countryInfo!.flag}"),
                          fit: BoxFit.fill)),),
              ],
            )
          ),
          Divider(color: Colors.black87,thickness: 1),
          Text("Country:- ${controller.covid[index].country}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("Cases:- ${controller.covid[index].cases}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("TodayCases:- ${controller.covid[index].todayCases}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("Active:- ${controller.covid[index].active}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("Deaths:- ${controller.covid[index].deaths}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("Population:- ${controller.covid[index].population}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),
          Text("Continent:- ${controller.covid[index].continent}",style: TextStyle(fontSize: 20),),
          Divider(color: Colors.black87,thickness: 1),

        ],
      ),
    ));
  }
}

// Column(
//
// children: [
// SizedBox(height: 20),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//
// ],
// ),
// SizedBox(height: 20),
//
//
// ],
// ),