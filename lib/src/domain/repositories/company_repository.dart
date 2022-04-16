

import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/domain/enums/status_company.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CompanyRepository{
  Future<bool> addCompany(Company company);
  Future<bool> deleteCompany(String idCompany);
  Future<bool> updateCompany(Company company);
   Future<bool> updateStatusCompany(String idCompany,StatusCompany statusCompany);

  Future<List<Company>> listCompanies();
  Stream<QuerySnapshot> companiesListening();
}