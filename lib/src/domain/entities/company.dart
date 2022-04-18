import 'package:appdelivery/src/domain/enums/status_company.dart';

class Company {
  final String name;
  final String mobile;
  final String phone;
  final String direction;
  final StatusCompany status;
  final LocationCompany location;
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
    location = LocationCompany.fromJson(data['location'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() {
    return {
      'name'     : name,
      'mobile'   : mobile,
      'phone'    : phone,
      'direction': direction,
      'status'   : getStringStatusCompany(status),
      'location' : location.toJson(),
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

class LocationCompany {
  final double latitude;
  final double longitude;

  LocationCompany({
    required this.latitude,
    required this.longitude
  });

  LocationCompany.fromJson(Map<String, dynamic> data): 
    latitude = data['latitude'],
    longitude= data['longitud'];

  Map<String, dynamic> toJson(){
    return {
      'latitude':latitude,
      'longitud':longitude,
    };
  }

  LocationCompany copy() => LocationCompany(
    latitude:latitude,
    longitude: longitude,
  );

}