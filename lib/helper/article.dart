import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    String url ="http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=ade50868159a4cd1a43834dc081e1209";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] != null){
          ArticleModel articleModel = new ArticleModel(
            title: element["title"],
            urlToImage: element["urlToImage"],
            //author: element["author"],
            description: element["description"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }

  }
}
