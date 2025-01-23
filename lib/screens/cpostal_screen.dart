import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:tasca3/services/cp_service.dart';

class CpostalScreen extends StatefulWidget {
  final dynamic result;
  const CpostalScreen({super.key, required this.result});

  @override
  State<CpostalScreen> createState() => _CpostalScreenState();
}

class _CpostalScreenState extends State<CpostalScreen> {
  //final TextEditingController _inputController = TextEditingController();

  //Para Google Maps
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(41.45, 2.25);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //Valor inicial de initial_screen.dart
  @override
  void initState() {
    super.initState();
    debugPrint(widget.result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostalCodeScreen',
      home: Scaffold(
        resizeToAvoidBottomInset:
            false, //para no reducir el tamaño del mapa con el teclado
        appBar: AppBar(
          title: const Text('Buscador'),
          backgroundColor: Colors.orange.shade400,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: helpBox,
              icon: const Icon(Icons.help),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TextField(),
              const TextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: {
                    Marker(
                      markerId: const MarkerId('marker_Badalona'),
                      position: _center,
                    ),
                  },
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  helpBox() {
    debugPrint("Presionado Help Box");
  }
}
