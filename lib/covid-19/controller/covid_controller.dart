import 'package:get/get.dart';
import 'package:re_exam/covid-19/helper/covid_helper.dart';
import 'package:re_exam/covid-19/model/covid_model.dart';

class CovidController extends GetxController
{
  List <CovidModel>covid=<CovidModel>[].obs;
  Future<List> getApi()
  async {
    covid=await CovidHelper.helper.covidApi();
    return covid;
  }

  List<CovidModel> l1=<CovidModel>[].obs;
  List<CovidModel> filtered=<CovidModel>[].obs;

  void searchcountry(String search) {
    if (search.isEmpty) {
      l1 = covid;
    }
    else {
      filtered.clear();
      for (var c in covid) {
        if (c.country!.toLowerCase().contains(search.toLowerCase())) {
          filtered.add(c);
        }
      }
      l1 = filtered;
    }
  }

}