import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/domain/enums/status_company.dart';
import 'package:appdelivery/src/domain/repositories/company_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompanyService extends CompanyRepository {

  final CollectionReference _collectionReference = FirebaseFirestore.instance
    .collection('companies');

    @override
  Stream<QuerySnapshot<Object?>> companiesListening() {
    return  _collectionReference.snapshots();
  }

  @override
  Future<List<Company>> listCompanies() async{
    QuerySnapshot companies = await _collectionReference.get();
    List<Company> listCompanies = [];
    
    if(companies.docs.isNotEmpty){
      for (var doc in companies.docs) { 
        final tempCompany = Company.fromJson(doc.data()  as Map<String, dynamic>);
        tempCompany.id =  doc.id;
        listCompanies.add(tempCompany);
      }
    }
    return listCompanies;
  }


  @override
  Future<bool> addCompany(Company company) async{
    try{
       Company tempCompany = company.copy();
      await _collectionReference.add(tempCompany.toJson());
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }
  
    @override
  Future<bool> deleteCompany(String idCompany) async{
    try{
      await _collectionReference.doc(idCompany).delete();
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

    @override
  Future<bool> updateCompany(Company company) async{
    try{
      Company tempCompany = company.copy();
      await _collectionReference.doc(company.id as String).update(tempCompany.toJson());
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> updateStatusCompany(String idCompany, StatusCompany statusCompany) async{
    try{
      await _collectionReference.doc(idCompany).update({
       'status':getStringStatusCompany(statusCompany)
      });
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

}