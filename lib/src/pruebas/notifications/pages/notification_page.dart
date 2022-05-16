import 'package:appdelivery/src/pruebas/notifications/pages/notification_api.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height:100),
           ElevatedButton(
             onPressed: (){
               NotificationApi.showNotification(
                 id: 1,
                 title: 'Jorge',
                 body: 'Hola Como estas',
                 payload: 'sarah.abs'
               );
             }, 
             child: Text('Simple Notification')
            ),
            const SizedBox(height:100),
           ElevatedButton(
             onPressed: (){

             }, 
             child: Text('Schedule Notification')
            ),
            const SizedBox(height:100),
           ElevatedButton(
             onPressed: (){

             }, 
             child: Text('Remove Notification')
            ),
          ],
        ),
      ),
    );
  }
}