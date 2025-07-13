import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:workrhelp_client/workrhelp_client.dart';

class AbsMap extends StatefulWidget {
  final Location location;
  const AbsMap({super.key, required this.location});

  @override
  State<AbsMap> createState() => _AbsMapState();
}

class _AbsMapState extends State<AbsMap> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FlutterMap(
        options: MapOptions(
          keepAlive: true,
          initialCenter: LatLng(widget.location.latitude,
              widget.location.longitude), // London coords
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.myapp',
            // light transparency for aesthetic feel
          ),
          // Optional minimalist marker example
          MarkerLayer(
            markers: [
              Marker(
                width: 40,
                height: 40,
                point:
                    LatLng(widget.location.latitude, widget.location.longitude),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
