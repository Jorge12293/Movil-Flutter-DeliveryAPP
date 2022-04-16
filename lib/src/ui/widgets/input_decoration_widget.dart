  import 'package:flutter/material.dart';

InputDecoration inputDecoration (String labelTexto,TextEditingController textController){
    return InputDecoration(
      labelStyle:const TextStyle(color: Colors.blue),
      labelText: labelTexto,
      focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:const BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide:const BorderSide(
          color: Colors.black12,
          width: 2.0
        ),
      ),
      suffixIcon: textController.text.isNotEmpty ? IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => WidgetsBinding.instance
          ?.addPostFrameCallback((_) => textController.clear())) : null,
    );
  }