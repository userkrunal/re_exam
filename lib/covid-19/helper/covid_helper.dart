import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:re_exam/covid-19/model/covid_model.dart';

class CovidHelper
{

  static CovidHelper helper=CovidHelper._();
  CovidHelper._();

  Future<List<CovidModel>> covidApi()
  async {
    String? link='https://corona.lmao.ninja/v2/countries';
    var response=await http.get(Uri.parse(link));
    List json=jsonDecode(response.body);
    List <CovidModel> covidData=[];
    covidData=json.map((e) => CovidModel.fromJson(e)).toList();
    return covidData;
  }

}