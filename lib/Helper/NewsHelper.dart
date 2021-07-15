import 'dart:convert';

import 'package:project/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsHelper{

  List<NewsModel> news = [];

  Future<void> getNews() async{
    
    String apiUrl = "https://api.first.org/data/v1/news";
    var response = await http.get(Uri.parse(apiUrl));

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="OK"){
      jsonData["data"].forEach((element){
        if(element["title"]!= null && element["summary"]!=null){

          NewsModel newsModel = NewsModel(
            title: element["title"],
            summary: element["summary"],
            url: element["link"],
            published: element["published"],
            isFav: "False",
            );

            news.add(newsModel);
        }
      });
    }
  }
}