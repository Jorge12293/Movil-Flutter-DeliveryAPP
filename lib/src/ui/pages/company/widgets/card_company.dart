import 'package:appdelivery/src/data/firestore/company_service.dart';
import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/domain/enums/status_company.dart';
import 'package:appdelivery/src/ui/pages/company/company_form_page.dart';
import 'package:flutter/material.dart';

Widget cardCompany (Company company,BuildContext context) {
  CompanyService _companyService = CompanyService();
  
  return  Dismissible(
    key: UniqueKey(),
    direction: DismissDirection.startToEnd,
    onDismissed: (direcction) {
       _companyService.updateStatusCompany(company.id as String, StatusCompany.inactive);
    },
    background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: const Color(0xffce5a5a),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children:const [
              Icon(Icons.delete, color: Colors.black,size: 50),
              Text("DELETE",style:TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
            ],
          )  
        ),
      ),
    child: ListTile(
      onTap: (){
        
        Navigator.push( 
          context, 
          MaterialPageRoute(builder: (context) => CompanyFormPage(company: company))
        );
        
      },
      leading: const Icon(Icons.list),
      contentPadding: const EdgeInsets.only(right: 40,left: 40),
      title: Text(company.name),
     // subtitle: Text('PU: ${product.price} \$'),
    ),
  );
}