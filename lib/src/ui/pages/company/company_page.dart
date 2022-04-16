import 'package:appdelivery/src/data/firestore/company_service.dart';
import 'package:appdelivery/src/ui/pages/company/widgets/single_child_company_widget.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {

  final CompanyService _companyService = CompanyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context,'companyForm').then((value) =>{
            if(value!=null){ }
          });
        },
        tooltip: 'Increment',
        child:const Icon(Icons.add),
      ),
      body: SingleChildCompanyWidget(companyService: _companyService),
    );
  }
}