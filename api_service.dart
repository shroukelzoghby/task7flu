import 'dart:convert';

import 'package:NewsApp/model/article_model.dart';
import 'package:http/http.dart';



class ApiService {
  
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey={b2061a2f18c74796ad86a7bc2b70259f}";

  /

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
