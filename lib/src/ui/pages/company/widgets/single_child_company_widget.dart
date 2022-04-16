import 'package:appdelivery/src/data/firestore/company_service.dart';
import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/ui/pages/company/widgets/card_company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SingleChildCompanyWidget extends StatelessWidget {
  const SingleChildCompanyWidget({
    Key? key,
    required CompanyService companyService,
  }) : _companyService = companyService, super(key: key);

  final CompanyService _companyService;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
              StreamBuilder<QuerySnapshot>(
                stream: _companyService.companiesListening(), 
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }  
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return listCompanies(snapshot,context);
              }),
          ],
        )
    );
  }

  ListView listCompanies(AsyncSnapshot<QuerySnapshot<Object?>> snapshot,BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: snapshot.data!.docs.map( (DocumentSnapshot doc) {
          final tempCompany = Company.fromJson(doc.data()  as Map<String, dynamic>);
          tempCompany.id =  doc.id;
          return cardCompany(tempCompany,context);
        }
      ).toList(),
    );
  }
}