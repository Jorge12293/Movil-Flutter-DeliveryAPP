import 'package:appdelivery/src/provider/providers/map_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapLocationPage extends StatefulWidget {
  const MapLocationPage({Key? key}) : super(key: key);
  @override
  State<MapLocationPage> createState() => _MapLocationPageState();
}

class _MapLocationPageState extends State<MapLocationPage> {

  GoogleMapController? _googleMapController;
  Marker? _companyLocationMarker;
  LatLng? posActual;

  static const _initialCameraPoisition = CameraPosition(
    target:LatLng(-2.90055, -79.00453),
    zoom: 15
  );
 
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapaProvider = Provider.of<MapLocationProvider>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
           GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPoisition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if(_companyLocationMarker != null) _companyLocationMarker as Marker,
            },
            onTap:(LatLng pos){
              _addMarkerLocation(pos,mapaProvider); 
            }
          ),
          (mapaProvider.descriptionLocation != '')
          ? Positioned(
              top: 40,
              child: Container(
                width: 300.0,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20),
                    topRight:Radius.circular(20),
                    bottomLeft:Radius.circular(20),
                    bottomRight:Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Ubicacion: ',style: TextStyle(color:Colors.white)),
                      Text( mapaProvider.descriptionLocation,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color:Colors.white)),
                    ],
                  )
                ),
              )
            )
            :Container()

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        onPressed: (){
         Navigator.pushNamed(context,'companyForm');
        },
        child: const Icon(Icons.select_all_rounded),
      ), 
    );
  }
  
  void _addMarkerLocation(LatLng pos,MapLocationProvider mapaProvider) async{
    posActual = pos;
    var placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude); 
    String address ='${ placemarks.first.name!.isNotEmpty ?placemarks.first.name! + ', ' : ''}${placemarks.first.thoroughfare!.isNotEmpty ? placemarks.first.thoroughfare! + ', ' : ''}${placemarks.first.subLocality!.isNotEmpty ? placemarks.first.subLocality!+ ', ' : ''}${placemarks.first.locality!.isNotEmpty ? placemarks.first.locality!+ ', ' : ''}${placemarks.first.subAdministrativeArea!.isNotEmpty ? placemarks.first.subAdministrativeArea! + ', ' : ''}${placemarks.first.postalCode!.isNotEmpty ? placemarks.first.postalCode! + ', ' : ''}${placemarks.first.administrativeArea!.isNotEmpty ? placemarks.first.administrativeArea : ''}';
    mapaProvider.descriptionLocation = address;
    mapaProvider.locationPosition = pos;

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


