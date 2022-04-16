import 'package:appdelivery/src/data/firestore/company_service.dart';
import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/domain/enums/status_company.dart';
import 'package:appdelivery/src/ui/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyFormPage extends StatefulWidget {
CompanyFormPage({Key? key, this.company}) : super(key: key); 
  Company? company;
   
  @override
  State<CompanyFormPage> createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  final CompanyService _companyService = CompanyService();

  String idCompany='';
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  TextEditingController locationController = TextEditingController();


  @override
  void initState() {
    if(widget.company != null){
      idCompany = widget.company?.id as String;
      nameController.text = widget.company?.name as String;
      mobileController.text = widget.company?.mobile as String;
      phoneController.text = widget.company?.phone as String;
      directionController.text = widget.company?.direction as String;
      locationController.text = widget.company?.location as String;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         title:const Text('Company..'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color:Colors.black),
                decoration: inputDecoration("Name",nameController),
                controller: nameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style:const TextStyle(color:Colors.black),
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Mobile",mobileController),
                controller: mobileController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style:const TextStyle(color:Colors.black),
                keyboardType: TextInputType.number,
                decoration: inputDecoration("Phone",phoneController),
                controller: phoneController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color:Colors.black),
                decoration: inputDecoration("Direction",directionController),
                controller: directionController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color:Colors.black),
                decoration: inputDecoration("Location",locationController),
                controller: locationController,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: ElevatedButton(
            onPressed: () async {
  
              Company company =  Company(
                id:idCompany, 
                name: nameController.text, 
                mobile: mobileController.text, 
                phone: phoneController.text, 
                direction: directionController.text, 
                status: StatusCompany.active, 
                location: locationController.text, 
              );
              
              if(idCompany.isEmpty){
                await _companyService.addCompany(company); 
              }else{
                await _companyService.updateCompany(company); 
              }
              Navigator.pop(context,true);
            },
            child:(idCompany == '') 
              ?const Text("Save",style: TextStyle(color: Colors.white))
              :const Text("Update",style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }

}