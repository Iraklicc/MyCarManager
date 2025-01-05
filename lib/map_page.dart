import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();

  static const LatLng _pCurrent = LatLng(37.979293035403195, 23.78309810976252);
  static const LatLng _pGasStation1 = LatLng(37.983762463477696, 23.76897830604288);
  static const LatLng _pGasStation2 = LatLng(37.99825121941401, 23.773112728645934);
  static const LatLng _pGasStation3 = LatLng(38.00257365353175, 23.769648342417632);
  static const LatLng _pGasStation4 = LatLng(37.99051570145732, 23.754636002094994);
  static const LatLng _pGasStation5 = LatLng(37.97891089498528, 23.744820241114805);
  static const LatLng _pGasStation6 = LatLng(37.97003539286546, 23.731540093906315);
  static const LatLng _pGasStation7 = LatLng(38.01485707522052, 23.73471578128226);
  static const LatLng _pGasStation8 = LatLng(38.018951091752285, 23.743088048000654);
  static const LatLng _pGasStation9 = LatLng(38.030322159923685, 23.732117491611035);
  static const LatLng _pGasStation10 = LatLng(38.04942158144059, 23.738180167510563);
  static const LatLng _pGasStation11 = LatLng(38.05692356264811, 23.751460314719047);
  static const LatLng _pGasStation12 = LatLng(38.005714394124745, 23.793122773712657);
  static const LatLng _pGasStation13 = LatLng(37.97555783979752, 23.774368841060205);
  static const LatLng _pGasStation14 = LatLng(37.9955142479135, 23.777544576306394);
  static const LatLng _pGasStation15 = LatLng(38.014324785992464, 23.734524851341593);
  static const LatLng _pGasStation16 = LatLng(38.03229139936418, 23.732215260522725);
  static const LatLng _pGasStation17 = LatLng(38.02433205119243, 23.68977652515279);
  static const LatLng _pGasStation18 = LatLng(38.032064001709145, 23.69814879187119);
  static const LatLng _pGasStation19 = LatLng(37.996808784715334, 23.700747081542413);

  LatLng? _currentP;

  @override
  void initState() {
    customMarker();
    super.initState();
    getLocationUpdates();
  }

  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  void customMarker() async {
  final BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(48, 48)), // Προσαρμογή μεγέθους εικονιδίου
    'assets/blue_dot.png', // Βεβαιώσου ότι το αρχείο υπάρχει
  );
  setState(() {
    customIcon = icon;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Dynamic background color
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor, // Dynamic app bar color
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Map Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
      ),
      body: _currentP == null
          ? const Center(
              child: Text("Unable to get your location"),
            )
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _pCurrent,
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("_current_location"),
                  icon: customIcon,
                  position: _currentP!,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station1"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation1,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station2"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation2,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station3"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation3,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station4"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation4,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station5"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation5,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station6"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation6,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station7"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation7,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station8"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation8,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station9"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation9,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station10"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation10,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station11"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation11,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station12"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation12,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station13"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation13,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station14"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation14,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station15"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation15,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station16"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation16,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station17"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation17,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station18"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation18,
                ),
                const Marker(
                  markerId: MarkerId("_gas_station19"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGasStation19,
                ),
              },
            ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }
}
