// import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Station with ClusterItem {
//   final String stationId;

//   final double longitude;
//   final double latitude;
//   final String status;
//   Station({
//     required this.stationId,

//     required this.longitude,
//     required this.latitude,
//     required this.status,
//   });
// factory Station.fromJson(Map<String, dynamic> json) {
//     return Station(
//       stationId: json['stationId'] as String,
//       longitude: json['longitude']  ,
//       latitude: json['latitude'] ,
//       status: json['status'] ?? 'null',
//     );
//   }
//   @override
//   LatLng get location => LatLng(latitude, longitude);
// }

import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class Station with ClusterItem {
  final String stationId;
  final String tenatId;
  final String chargePointId;
  final double longitude;
  final double latitude;
  final String status;
  // create other constructor

  Station({
    required this.stationId,
    required this.tenatId,
    required this.chargePointId,
    required this.longitude,
    required this.latitude,
    required this.status,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      stationId: json['_id'] as String,
      tenatId: json['_id'] as String,
      chargePointId: json['_id'] as String,
      longitude: parseJsonNumberAsDouble(json['longitude'].toString()),
      latitude: parseJsonNumberAsDouble(json['latitude'].toString()),
      status: json['status'] ?? 'null',
    );
  }

  @override
  LatLng get location => LatLng(latitude, longitude);
}

// import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:ismart/common/utils/logger.dart';

// class Station with ClusterItem {
//   final String stationId;
//   final String chargerName;
//   final double longitude;
//   final double latitude;
//   final String status;
//   final String chargerModel;
//   Station ({
//     required this.stationId,
//     required this.chargerModel,
//     required this.chargerName,
//     required this.longitude,
//     required this.latitude,
//     required this.status,
//   });

// factory Station.fromJson(Map<String, dynamic> json) {
//   log.fine( json['_id']  , json) ;

//     return Station(
//       stationId: json['_id'] as String,
//       chargerName : json['chargerName'] ?? 'no name yet',
//       longitude:generateRandomLatitude(),
//       latitude:generateRandomLongitude() ,
//       status: json['status'] ?? 'null',
//         chargerModel : json['chargerModel'] ,
//     );

//   }

//   @override
//   LatLng get location => LatLng(latitude, longitude);
// }

double parseJsonNumberAsDouble(String jsonValue) {
  if (jsonValue.contains(".")) {
    return double.parse(jsonValue); // Parse as double
  } else {
    return double.parse(
        jsonValue + ".0"); // Append .0 to handle cases without a decimal point
  }
}

double generateRandomLatitude() {
  final random = Random();
  return random.nextDouble() * 12.0; // Range: -90.0 to +90.0
}

// Generate a random longitude within the valid range
double generateRandomLongitude() {
  final random = Random();
  return -80.0 + random.nextDouble() * 160.0; // Range: -180.0 to +180.0
}

fakedata() {
  List<Station> stations = [
    Station(
      stationId: "864478314",
      tenatId: "12",
      chargePointId: "ch12",
      longitude: -7.611380, // Casablanca
      latitude: 33.592792,
      status: "available",
    ),
    Station(
      stationId: "860498802",
      tenatId: "12",
      chargePointId: "ch33",
      longitude: -6.858490, // Rabat
      latitude: 34.020882,
      status: "available",
    ),
    Station(
      stationId: "1338421081",
      tenatId: "12",
      chargePointId: "ch23",
      longitude: -4.008256, // Marrakech
      latitude: 31.629472,
      status: "charging",
    ),
    Station(
      stationId: "zxKvSBsc7n",
      tenatId: "12",
      chargePointId: "ch9",
      longitude: -5.575754, // Fes
      latitude: 34.033286,
      status: "offline",
    ),
    Station(
      stationId: "oi2KaRAcPK",
      tenatId: "12",
      chargePointId: "ch43",
      longitude: -4.424076, // Agadir
      latitude: 30.422036,
      status: "offline",
    ),
    Station(
      stationId: "1414278204",
      tenatId: "123-456-7890",
      chargePointId: "Example Charger",
      longitude: -6.841650, // Tangier
      latitude: 35.759465,
      status: "offline",
    ),
    Station(
      stationId: "eCxR0w77g",
      tenatId: "13",
      chargePointId: "charger576",
      longitude: -9.224047, // Ouarzazate
      latitude: 30.940637,
      status: "offline",
    ),
    Station(
      stationId: "f23-7rEeh",
      tenatId: "13",
      chargePointId: "ch154",
      longitude: -7.611380, // Casablanca (for variety)
      latitude: 33.592792,
      status: "offline",
    ),
    Station(
      stationId: "-U4MY38Z3t",
      tenatId: "14",
      chargePointId: "dpdvxpx",
      longitude: -6.267494, // Essaouira
      latitude: 31.508492,
      status: "offline",
    ),
  ];
  return stations;
}
