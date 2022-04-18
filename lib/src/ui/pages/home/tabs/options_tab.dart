import 'package:flutter/material.dart';

Widget optionsTab(BuildContext context) {

  return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              const Text('OPCIONES'),
              ElevatedButton(
                child: const Text('Productos'),
                onPressed: (){
                  Navigator.pushNamed(context,'products');
                }
              ),
              ElevatedButton(
                child: const Text('Companies'),
                onPressed: (){
                  Navigator.pushNamed(context,'company');
                }
              ),

            ]    
          ),
      );

}