import 'package:appdelivery/src/pruebas/students_work/data_student.dart';
import 'package:appdelivery/src/pruebas/students_work/domain/repositories/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class ServicesStudent {

  Future<APIResponse> loadParent() async{
   try { 
    var url =Uri.parse('https://mibusetabackend.com:8443/MiBusetaBackend/rest/serviciosMovil/v1.0/mfindAvisor/pedrorios@gmail.com'); 
    final resp = await http.get(url);
    print(resp.statusCode);
    if(resp.statusCode == 200){
      Map<String, dynamic> data = Map<String, dynamic>.from(convert.jsonDecode(resp.body));
      if(data['result'] != null){
        ResponseParent responseParent = ResponseParent.fromMap(data);  
        return APIResponse(
          data:responseParent.resultParent,
          error:false,
          errorMensaje:'',
        );
      }else{
        return APIResponse(
          data:null,
          error:true,
          errorMensaje:'No hay data',
        );
      }
    }else if(resp.statusCode == 404){
      return APIResponse(
        data:null,
        error:true,
        errorMensaje:'Pagina no Encontrada StatusCode: ${resp.statusCode}',
      );
    }
    return APIResponse(
      data:null,
      error:true,
      errorMensaje:'Ocurred an Error StatusCode: ${resp.statusCode}',
    );

   }catch(e) { 
    return APIResponse(
      data:null,
      error:true,
      errorMensaje:e.toString(),
    ); 
   } 
  }

}
  



