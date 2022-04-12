import 'package:appdelivery/src/ui/pages/crud_store_prueba/crud_store.dart';
import 'package:appdelivery/src/ui/pages/mapa_prueba/mapa.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery App'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              const Text('OPCIONES'),
              ElevatedButton(
                child: const Text('Ver Mapa'),
                onPressed: (){
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(builder: (context) => const Mapa())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Productos'),
                onPressed: (){
                  Navigator.pushNamed(context,'products');
                }
              ),
              ElevatedButton(
                child: const Text('Crud Store'),
                onPressed: (){
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(builder: (context) => const CrudStrore())
                  );
                }
              ),
               ElevatedButton(
                child: const Text('Mapa'),
                onPressed: (){
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(builder: (context) => const Mapa())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Mapa'),
                onPressed: (){
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(builder: (context) => const Mapa())
                  );
                }
              ),
              ElevatedButton(
                child: const Text('Mapa'),
                onPressed: (){
                  Navigator.push( 
                    context, 
                    MaterialPageRoute(builder: (context) => const Mapa())
                  );
                }
              )

            ]    
          ),
      ),
      
    );
  }
}