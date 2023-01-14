import 'package:flutter/material.dart';
import 'package:prueba/Model/route.dart';

class RoutesBody extends StatelessWidget {
  const RoutesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RouteModel> routes = [
      RouteModel(route: 'Ruta 1', distance: '1.2 Km'),
      RouteModel(route: 'Ruta 2', distance: '200 m'),
      RouteModel(route: 'Ruta 3', distance: '4.8 Km'),
    ];

    return Column(
      children: routes
          .map((e) => Column(
        children: [
          const SizedBox(height: 20),
          CardRoutes(route: e.route, distance: e.distance)
        ],
      ))
          .toList(),
    );
  }
}

class CardRoutes extends StatelessWidget {
  const CardRoutes({Key? key, required this.route, required this.distance})
      : super(key: key);

  final String route;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Image(
            image: NetworkImage(
                'https://img2.freepng.es/20180701/wgb/kisspng-baggage-computer-icons-suitcase-travel-suitcase-icon-5b38e13c6b3cd9.7468140415304543324393.jpg'),
            height: 50,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                route,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                distance,
                style: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
