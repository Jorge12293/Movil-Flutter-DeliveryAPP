import 'package:appdelivery/src/domain/entities/article.dart';
import 'package:appdelivery/src/domain/repositories/article_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleService extends ArticleRepository {
  
  List<Article> articlesList =[];
  String apiKey = '613b9f3335ba4e6d88cc7393e5d4ace5';
  String headLines= 'top-headlines';

 Future<List<Article>> getNewsArticles() async{
    String urlData ='https://newsapi.org/v2/${headLines}?country=us&apiKey=${apiKey}';
    var url =Uri.parse(urlData);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        print(element);
        articlesList.add(Article.fromJson(element));
      });
    }
     
     return articlesList;
     
   }

  Future<void> getNews()async{
    String urlData ='https://newsapi.org/v2/${headLines}?country=us&apiKey=${apiKey}';
    var url =Uri.parse(urlData);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
   
    if(jsonData['status']=='ok'){

      jsonData['articles'].forEach((element){

        print(element);
      });
    }
     
     
   }


  @override
  Future<List<Article>> listArticles() async {
    
    String urlData ='https://newsapi.org/v2/${headLines}?country=us&apiKey=${apiKey}';
    print(urlData);
    var url =Uri.parse(urlData);
    final resp = await http.get(url);
    
    if (resp.statusCode == 200) {
    
     final jsonResponse = jsonDecode(resp.body);
     final articlesData = jsonResponse['articles'];
     
     print(articlesData);
     /*
     for (var item in articlesData) {
       articlesList.add(Article.fromJson(item));
     }
    */
     return listArticles();
     
    } else {
      debugPrint('Fallo Conexion: ${resp.statusCode}');
      return listArticles();
    }


  }

}