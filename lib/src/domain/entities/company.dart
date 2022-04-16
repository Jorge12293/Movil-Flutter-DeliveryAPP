import 'package:appdelivery/src/domain/enums/status_company.dart';

class Company {
  final String name;
  final String mobile;
  final String phone;
  final String direction;
  final StatusCompany status;
  final String location;
  String? id;

  Company({
    required this.name,
    required this.mobile,
    required this.phone,
    required this.direction,
    required this.status,
    required this.location, 
    this.id,
  });

  Company.fromJson(Map<String, dynamic> data): 
    name     = data['name'],
    mobile   = data['mobile'],
    phone    = data['phone'],
    direction= data['direction'],
    status   = getStatusCompany(data['status']),
    location = data['location'];

  Map<String, dynamic> toJson() {
    return {
      'name'     : name,
      'mobile'   : mobile,
      'phone'    : phone,
      'direction': direction,
      'status'   : getStringStatusCompany(status),
      'location' : location,
    };
  }
   Company copy() => Company(
      name     : name,
      mobile   : mobile,
      phone    : phone,
      direction: direction,
      status   : status,
      location : location,
    );
}