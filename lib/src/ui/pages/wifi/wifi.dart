import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class PageWifi extends StatefulWidget {
  const PageWifi({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PageWifi> createState() => _PageWifiState();
}

class _PageWifiState extends State<PageWifi> {
  int _counter = 0;
  String status ='Waiting...';


  @override
  void initState() {
    super.initState();
    //checkConnectivity();
    checkRealTimeConnection();
  }

  Connectivity _connectivity = Connectivity();

  void checkConnectivity() async{
    var connectionResult = await _connectivity.checkConnectivity();

    if(connectionResult == ConnectivityResult.mobile){
      status = "MobileData";
    }else if(connectionResult== ConnectivityResult.wifi){
      status = "Wifi";
    }else {
      status = "Not Connect";
    }

    setState(() { });

  }

  void checkRealTimeConnection(){
    
    bool listenInternet = false;
  
   _connectivity.onConnectivityChanged.listen((event) {
      listenInternet = true;
      if(event == ConnectivityResult.mobile){
        status = "MobileData";
      }else if(event == ConnectivityResult.wifi){
        status = "Wifi";
      }else {
        status = "Not Connect";
      }

    setState(() { });
   });
   
   if(!listenInternet){
     checkConnectivity();
   }

  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              status,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
         // checkConnectivity();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
