import 'dart:ui';

import 'package:appdelivery/src/pruebas/students_work/data_student.dart';
import 'package:appdelivery/src/pruebas/students_work/domain/repositories/api_response.dart';
import 'package:appdelivery/src/pruebas/students_work/services_student.dart';
import 'package:flutter/material.dart';

class StudentsWorkPage extends StatefulWidget {
  const StudentsWorkPage({Key? key}) : super(key: key);

  @override
  State<StudentsWorkPage> createState() => _StudentsWorkPageState();
}

class _StudentsWorkPageState extends State<StudentsWorkPage> {
   ServicesStudent servicesStudent = ServicesStudent();
   List<ResultParent> listResultParent=[];

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController _nombre = TextEditingController();
   TextEditingController _apellido = TextEditingController();

  @override
  void initState() {
    loadDataStudent();
    super.initState();
  }

  @override
  void dispose() {
    _nombre.clear();
    _apellido.clear();
    super.dispose();
  }

  void loadDataStudent() async {
    debugPrint('Cargando Data....');
    APIResponse apiResponseStudent = await servicesStudent.loadParent();
    if(!apiResponseStudent.error){
      listResultParent = apiResponseStudent.data as List<ResultParent>;
      listResultParent.forEach((element) {
        element.presentacionRegisterPassangerToList.forEach((element){
          debugPrint(element.nombreEstudiante);
          debugPrint(element.apellidoEstudiante);
        });
      });

    }else{
      debugPrint('No se pudo cargar data');
      debugPrint(apiResponseStudent.errorMensaje);
    }

    
  }

   bool validarCedula(String cedula) {
    // String cedula = '0105338980';
     bool cedulaValida = true;
     for (var element in listResultParent) {
       for (var element in element.presentacionRegisterPassangerToList) {
         if(cedula.trim() == element.cedulaEstudiante.trim()){
           cedulaValida = false;
         } 
       }
     }
     return cedulaValida;
   }


  bool validarNombre(String nombre) {
     bool nombreValido = true;
     for (var element in listResultParent) {
       for (var element in element.presentacionRegisterPassangerToList) {
         if(nombre.toUpperCase() == element.nombreEstudiante.toUpperCase()){
           nombreValido = false;
         } 
       }
     }
     return nombreValido;
  }

  bool validarNombres(String nombre, String apellido) {
     bool nombreValido = true;
     for (var element in listResultParent) {
       for (var element in element.presentacionRegisterPassangerToList) {
         if(nombre.toUpperCase() == element.nombreEstudiante.toUpperCase() && apellido.toUpperCase() == element.apellidoEstudiante.toUpperCase()){
           nombreValido = false;
         } 
       }
     }
     return nombreValido;
  }




  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:Scaffold(
        body: Container(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 60),
                TextFormField(

                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                     hintText:'Cedula',
                     labelText:'Cedula',
                     prefixIcon: Icons.person,
                  ),
                 // onChanged: (value)=> print(value),
                  validator: (value) {
                    if(!validarCedula(value ?? '')){
                      return 'Cedula ya existe';
                    }else if(value == null || value==''){
                      return 'Ingrese la cedula';
                    }else{
                      return null;
                    }    
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _nombre,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.authInputDecoration(
                     hintText:'Nombre',
                     labelText:'Nombre',
                     prefixIcon: Icons.person,
                  ),
                 // onChanged: (value)=> print(value),
                  validator: (value) {
                    if(!validarNombre(value ?? '')){
                      return 'Nombre ya existe';
                    }else if(value == null || value==''){
                      return 'Ingrese la nombre';
                    }else{
                      return null;
                    }   
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _apellido,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecorations.authInputDecoration(
                     hintText:'Apellido',
                     labelText:'Apellido',
                     prefixIcon: Icons.person,
                  ),
                 // onChanged: (value)=> print(value),
                  validator: (value) {
                    if(value == null || value==''){
                      return 'Ingrese el apellido';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                    child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
                  ),
                  onPressed: (){
                    formKey.currentState!.validate();
                    if(!validarNombres(_nombre.text, _apellido.text)){
                      print('Ya existe el nombre');
                    }
                    //print(validarCedula());
                  }
                )
              ],
            )
          ),
        ),
      )
    );
  }
}


class InputDecorations{
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){

    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        ),
      ),
      hintText: hintText,
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.grey
      ),
      prefixIcon:const Icon(Icons.person,color: Colors.deepPurple,) 
    );
  }
}

/*
String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
 
RegExp regExp  = new RegExp(pattern)

*/