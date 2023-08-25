import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam/covid-19/controller/covid_controller.dart';
import 'package:re_exam/covid-19/model/covid_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CovidController controller=Get.put(CovidController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      body: FutureBuilder(
        future: controller.getApi(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              List coronaList=snapshot.data!;
             // print("--------------------------------------${coronaList.length}---------------------");
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 7.h,
                      width: 95.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Search.....",style: TextStyle(color: Colors.grey.shade400,fontSize: 18),),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/search');
                              },
                                child: Icon(Icons.search,size: 30)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                     return InkWell(
                       onTap: () {
                         //CovidModel model=CovidModel(country: list)
                         Get.toNamed('/show',arguments: index);
                       },
                       child: ListTile(
                          leading: Container(height: 50,width: 50,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                             image: DecorationImage(image: NetworkImage("${coronaList[index].countryInfo!.flag}"),fit: BoxFit.fill)
                            ),
                          ),
                          title: Text("${coronaList[index].country}"),
                        ),
                     );
                    },itemCount: coronaList.length),
                  ),
                ],
              );
            }

          return Center(child: CircularProgressIndicator());
      },),
    ));
  }
}
