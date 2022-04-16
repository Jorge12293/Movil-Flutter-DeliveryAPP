enum StatusCompany {
 active,
 inactive,
 undefined
}

StatusCompany getStatusCompany(String statusCompany){
  for (StatusCompany value in StatusCompany.values) {
    if(statusCompany == value.toString().split('.').elementAt(1) ){
      return value;
    }
  }
  return StatusCompany.undefined;
}

String getStringStatusCompany(StatusCompany statusCompany){
  return statusCompany.toString().split('.').elementAt(1);
}
