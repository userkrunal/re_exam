import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam/covid-19/controller/covid_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    CovidController covidController = Get.put(CovidController());
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(

              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Search",
              ),
              onChanged: (value) {
                covidController.searchcountry(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
              () =>  ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${covidController.l1[index].countryInfo!.flag}"),
                              fit: BoxFit.fill)),),
                    title: Text("${covidController.l1[index].country}"),
                  );
                },
                itemCount: covidController.l1.length,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
