import 'package:flutter/material.dart';

class HomePageDialog extends StatefulWidget {
  HomePageDialog({Key? key}) : super(key: key);
  bool salidaBool = true;
  bool entradaCheck = true;

  bool _value = false;

  @override
  State<HomePageDialog> createState() => _HomePageDialogState();
}

class _HomePageDialogState extends State<HomePageDialog> {


@override
Widget build(BuildContext context) {




void selectTypeRoutingInfo(){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        titlePadding: EdgeInsets.symmetric(vertical: 40),
       // titlePadding: EdgeInsets.zero,
        title:Column(
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: const Text('x'),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.black,
                    ),
                ),
              ],
            ),
            const Text('Solicitud de Eliminacion')
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
            child: const Text("Aceptar"),
            style: ElevatedButton.styleFrom(
               primary: const Color(0xFF3DC815),
                shape: const StadiumBorder()
            )),
        ],
        content:RichText(
          text:const TextSpan(
            style:TextStyle(color: Colors.black),
              children: <InlineSpan>[
                TextSpan (text: 'La solicitud del alumno '),
                TextSpan (
                  text: 'Juan Perez',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan (text:' de la Ruta '),
                TextSpan (
                  text: 'ANT 1 ENTRADA',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan (text:' a sido enviada, tiene que ser aprobada por el administrador.'),
              ]
          ),
        )
      );
    }
  );
}




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dialogs'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
              checkColor: Colors.black,
              value: widget._value,
               onChanged: (valor) {
                 print(valor);
                  if (valor != null) widget._value = valor;
                  setState(() {});
                
                }
              ),
              ElevatedButton(
                onPressed: (){
                  showConfirmationDialog(context);
                  //selectTypeRouting(context);
                }, 
                child:const Text('Dialog 1')
              )
            ],
          ),
        ),
      )
    );
  }



  showConfirmationDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomDialog();
      },
    );
  }

}


class CustomDialog extends StatefulWidget {
  CustomDialog({Key? key}) : super(key: key);
  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  bool salidaCheck = true;
  bool entradaCheck = true;




  void selectTypeRoutingInfo(){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title:Column(
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                       Navigator.pop(context);
                       Navigator.pop(context);
                    },
                    child: const Text('x'),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.black,
                    ),
                ),
              ],
            ),
            const Text('Solicitud de Eliminacion')
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Aceptar"),
            style: ElevatedButton.styleFrom(
               primary: const Color(0xFF3DC815),
                shape: const StadiumBorder()
            )),
        ],
        content:RichText(
          text:const TextSpan(
            style:TextStyle(color: Colors.black),
              children: <InlineSpan>[
                TextSpan (text: 'La solicitud del alumno '),
                TextSpan (
                  text: 'Juan Perez',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan (text:' de la Ruta '),
                TextSpan (
                  text: 'ANT 1 ENTRADA',
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan (text:' a sido enviada, tiene que ser aprobada por el administrador.'),
              ]
          ),
        )
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Seleccione el recorrido que desea eliminar al alumno"),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFFE0106),
            shape: const StadiumBorder()
          )),
          ElevatedButton(onPressed: (){

            if(salidaCheck && entradaCheck){
              print('Combinado');
              selectTypeRoutingInfo();
            }else if(entradaCheck){
              print('Entrad');
              selectTypeRoutingInfo();
            }else if(salidaCheck){
              print('salida');
              selectTypeRoutingInfo();
            }else{
              messageAlert(context);
            }
            //selectTypeRoutingInfo();
          },
          child: const Text("Aceptar"),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF3DC815),
              shape: const StadiumBorder()
          )),
     ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
          checkColor: Colors.black,
          value: entradaCheck,
          onChanged: (value) {
            setState(() {
              entradaCheck = value!;
            
            });
          },
          title: const Text('Entrada'),
        ),
         CheckboxListTile(
          checkColor: Colors.black,
          value: salidaCheck,
          onChanged: (value) {
            setState(() {
              salidaCheck = value!;
            
            });
          },
          title: const Text('Salida'),
        ),
        ],
      ),
  );

}

  Future<dynamic> messageAlert(BuildContext context) {
    return showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Ingrese una opcion"),
                  actionsAlignment: MainAxisAlignment.spaceEvenly,
                  actions: [
                      ElevatedButton(onPressed: (){
                         Navigator.pop(context);
                      },
                      child: const Text("Aceptar"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF3DC815),
                          shape: const StadiumBorder()
                      )),
                ]
                );
              },
            );
  }
  
  }