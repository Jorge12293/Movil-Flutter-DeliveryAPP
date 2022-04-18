import 'package:appdelivery/src/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewArticle extends StatefulWidget {
  ViewArticle({required this.article});
  
  final Article article;

  @override
  State<ViewArticle> createState() => _ViewArticleState();
}

class _ViewArticleState extends State<ViewArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              widget.article.urlToImage != ''
              ? SizedBox(
                width: 150,
                height: 100,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/cargando.jpeg'),
                  image:NetworkImage(widget.article.urlToImage as String),
                  fit: BoxFit.cover,
                  ),
                )
              : const Text('No hay Imagen'),
              widget.article.urlToImage != ''
              ? Text(widget.article.author as String)
              : Text('No hay Autor'),
            ]
          ),
          
              Text('Description'),
              Text(widget.article.description as String),
              Text('Content'),
              Text(widget.article.content as String),
              Text('Published At'),
              widget.article.publishedAt != ''
              ? Text(DateFormat.Hm().format(widget.article.publishedAt as DateTime))
              : Text('No hay fecha')
        ],

      ),
    );
  }
}