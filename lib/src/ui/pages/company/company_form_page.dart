import 'package:appdelivery/src/data/firestore/company_service.dart';
import 'package:appdelivery/src/domain/entities/company.dart';
import 'package:appdelivery/src/domain/enums/status_company.dart';
import 'package:appdelivery/src/ui/widgets/input_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class CompanyFormPage extends StatefulWidget {
const CompanyFormPage({Key? key, this.company}) : super(key: key); 
  final Company? company;
   
  @override
  State<CompanyFormPage> createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  final CompanyService _companyService = CompanyService();
  
  GoogleMapController? _googleMapController;
  Marker? _companyLocationMarker;
  LatLng? posActual;
  String address ='';
  String idCompany='';

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController directionController = TextEditingController();
  LocationCompany? locationCompany;

  @override
  void initState() {
    if(widget.company != null){
      idCompany = widget.company?.id as String;
      nameController.text = widget.company?.name as String;
      mobileController.text = widget.company?.mobile as String;
      phoneController.text = widget.company?.phone as String;
      directionController.text = widget.company?.direction as String;
      locationCompany = widget.company?.location as LocationCompany;
    }else{
        directionController.text = '';
    }
    super.initState();
  }


  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    phoneController.dispose();
    directionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final mapaProvider = Provider.of<MapLocationProvider>(context);

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
              const Text('Ubicacion: ',style: TextStyle(color: Colors.blueAccent)),
              Text(directionController.text),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                width: 450,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  border: Border.all(color: Colors.blueAccent),
                   borderRadius: const BorderRadius.all(Radius.circular(25))
                ),
                child: crearMapa()
              ),
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
                location: LocationCompany(
                 latitude:posActual?.latitude as double,
                 longitude:posActual?.longitude as double,  
                ) 
              );
              
              if(idCompany.isEmpty){
                await _companyService.addCompany(company); 
              }else{
                await _companyService.updateCompany(company); 
              }
              
              //mapaProvider.cleanMapLocationProvider();
              Navigator.pushNamed(context,'company');
            },
            child:(idCompany == '') 
              ?const Text("Save",style: TextStyle(color: Colors.white))
              :const Text("Update",style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }

  Widget crearMapa(){

  // ignore: unused_local_variable
  GoogleMapController? _googleMapController;
  // ignore: unused_local_variable
  LatLng? newCameraPosition;

  const camaraPosition = CameraPosition(
    target: LatLng(-2.897326, -79.004616), //Parque Calderon
    zoom: 15
  );

  return GoogleMap(
      myLocationEnabled: false,
      initialCameraPosition:camaraPosition,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (controller) => _googleMapController = controller ,
      markers: {
        if(_companyLocationMarker != null) _companyLocationMarker as Marker,
      },
      onTap:(LatLng pos){
        _addMarkerLocation(pos); 
      }
  
  );
  
}
  void _addMarkerLocation(LatLng pos) async{
    posActual = pos;
    var placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude); 
    directionController.text ='${ placemarks.first.name!.isNotEmpty ?placemarks.first.name! + ', ' : ''}${placemarks.first.thoroughfare!.isNotEmpty ? placemarks.first.thoroughfare! + ', ' : ''}${placemarks.first.subLocality!.isNotEmpty ? placemarks.first.subLocality!+ ', ' : ''}${placemarks.first.locality!.isNotEmpty ? placemarks.first.locality!+ ', ' : ''}${placemarks.first.subAdministrativeArea!.isNotEmpty ? placemarks.first.subAdministrativeArea! + ', ' : ''}${placemarks.first.postalCode!.isNotEmpty ? placemarks.first.postalCode! + ', ' : ''}${placemarks.first.administrativeArea!.isNotEmpty ? placemarks.first.administrativeArea : ''}';
    
    _companyLocationMarker = Marker(
      markerId: const MarkerId('Location'),
      infoWindow: const InfoWindow(title:'Company Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueGreen
      ),
      position: pos,
    );

    _googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: pos,
        zoom: 15
      ))
    );
    
    setState(() {});
  }
}





