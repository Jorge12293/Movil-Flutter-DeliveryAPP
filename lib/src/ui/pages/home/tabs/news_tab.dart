import 'package:appdelivery/src/data/http/article_service.dart';
import 'package:appdelivery/src/domain/entities/article.dart';
import 'package:appdelivery/src/ui/pages/home/tabs/view_article.dart';
import 'package:flutter/material.dart';
class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);
  @override
  State<NewsTab> createState() => _NewsTab();
}

class _NewsTab extends State<NewsTab> {
  late ArticleService articleService = ArticleService();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
          /*
          FutureBuilder<List<Article>>(
            future: articleService.getNewsArticles(),
            builder: (context,snapshot){
              if (snapshot.hasData) {
                List<Article> _listArticle =  snapshot.data as List<Article>;
                return  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _listArticle.length,
                      itemBuilder: (BuildContext context,int index){
                        return _listArticle[index].urlToImage != '' 
                          ?GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewArticle(article:  _listArticle[index])),
                              );
                            },
                            child:FadeInImage(
                                height: 100,
                                placeholder: AssetImage('assets/img/cargando.jpeg'),
                                image:NetworkImage(_listArticle[index].urlToImage as String),
                                fit: BoxFit.cover,
                              ),
                            
                          ): Container();
                      }
                    ),
                  );
              
              }else if(snapshot.hasError){
                return const Text('Error en peticion');
              }else{
                return Container();
              }
            }
        ),
        */
        Container(
          height: 150,
          width: double.infinity,
         child:FutureBuilder<List<Article>>(
            future: articleService.getNewsArticles(),
            builder: (context,snapshot){
              if (snapshot.hasData) {
                List<Article> _listArticle =  snapshot.data as List<Article>;
                return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _listArticle.length,
                      itemBuilder: (BuildContext context,int index){
                        return _listArticle[index].urlToImage != '' 
                          ?GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewArticle(article:  _listArticle[index])),
                              );
                            },
                            child:FadeInImage(
                                height: 100,
                                placeholder: AssetImage('assets/img/cargando.jpeg'),
                                image:NetworkImage(_listArticle[index].urlToImage as String),
                                fit: BoxFit.cover,
                              ),
                            
                          ): Container();
                      });
              
              }else if(snapshot.hasError){
                return const Text('Error en peticion');
              }else{
                return Container();
              }
            }
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Article>>(
          future: articleService.getNewsArticles(),
          builder: (context,snapshot){
            if (snapshot.hasData) {
              List<Article> _listArticle =  snapshot.data as List<Article>;
              return ListView.builder(
                itemCount: _listArticle.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: _listArticle[index].urlToImage != ''
                    ? FadeInImage(
                        placeholder: const AssetImage('assets/img/cargando.jpeg'),
                        image:NetworkImage(_listArticle[index].urlToImage as String),
                        fit: BoxFit.cover,
                      )
                    :Text('No Image',style: TextStyle(color: Colors.blue.shade900 ,fontWeight: FontWeight.bold)),
                    title:Text("${_listArticle[index].title}"),
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewArticle(article:  _listArticle[index])),
                      );
                    }
                  );
                }
              );
            
            }else if(snapshot.hasError){
              return const Text('Error en peticion');
            }else{
              return Center(
                child: const CircularProgressIndicator()
              );
            }
          }
          ),
        ),
      ] 
    );
  }
}
