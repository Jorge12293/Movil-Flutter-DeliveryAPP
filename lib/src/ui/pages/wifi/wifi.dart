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
