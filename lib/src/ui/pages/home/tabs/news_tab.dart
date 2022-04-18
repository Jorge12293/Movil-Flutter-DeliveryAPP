import 'package:flutter/material.dart';

Widget newsTab() {

  return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            leading: Icon(Icons.list),
            trailing: Text("GFG",
                           style: TextStyle(
                             color: Colors.green,fontSize: 15),),
            title:Text("List item $index")
            );
        }
  );

}