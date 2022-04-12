import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);
  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  
  static const _initialCameraPoisition = CameraPosition(
    target:LatLng(37.773972, -122.431297),
    zoom: 11.5
  );

  GoogleMapController? _googleMapController;
  Marker? _origin;
  Marker? _destination;

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery App'),
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
              if(_origin != null) _origin as Marker,
              if(_destination != null) _destination as Marker,
            },
                        /*
            polylines: {
              if(_info != null)
                Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color:Colors.red,
                  width:5,
                  points: _info!.polylinePoints!.map((e) => LatLng(e.latitude, e.longitude)).toList()
                )
            },
            */
            //onLongPress: _addMarker,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: ()=> _googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPoisition)
        ),
        child: const Icon(Icons.center_focus_strong),
      ), 
    );
  }
}

/*
  void _addMarker(LatLng pos) async{

      if(_origin == null || (_origin != null && _destination !=null)){
        setState(() {
          
          _origin = Marker(
            markerId: const MarkerId('Origin'),
            infoWindow: const InfoWindow(title:'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen
            ),
            position: pos,
          );
          _destination= null;
          _info = null;
        });
      }else{
        setState(() {
          _destination = Marker(
            markerId: const MarkerId('Destinatino'),
            infoWindow: const InfoWindow(title:'Destination'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueBlue
            ),
            position: pos,
          );
        });

        final directions = await DirectionsRepository().getDirections(
          origin: _origin!.position, 
          destination: pos
        );

        setState(()=> _info = directions);
      }
  }
}
*/