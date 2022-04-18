import 'package:appdelivery/src/data/http/article_service.dart';
import 'package:appdelivery/src/ui/pages/home/tabs/news_tab.dart';
import 'package:appdelivery/src/ui/pages/home/tabs/options_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>  with TickerProviderStateMixin{
late TabController _controller;

@override
void initState() {
  _controller = TabController(length: 2, vsync: this);
  super.initState();
}
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            tabs: const [
              Tab(text: 'Options'),
              Tab(text: 'News'),
            ],
          ),
          title: const Text('AppDelivery'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            optionsTab(context),
            const NewsTab(),
          ],
        ),

      )
    );
  }
}