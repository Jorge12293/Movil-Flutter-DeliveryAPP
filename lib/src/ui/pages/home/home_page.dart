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
//int _selectedIndex = 0;

@override
void initState() {
  super.initState();
  _controller = TabController(length: 2, vsync: this);
  /*
  _controller.addListener(() {
    setState(() {
      _selectedIndex = _controller.index;
    });
    print("Selected Index: " + _controller.index.toString());
  });
  */
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
            newsTab(),
          ],
        ),

      )
    );
  }
}