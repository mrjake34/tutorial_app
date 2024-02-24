part of 'maps_view.dart';

class _AppleMapWidget extends StatelessWidget {
  _AppleMapWidget({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
  final _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 15,
      ),
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(latitude, longitude),
        ),
      },
    );
  }
}
