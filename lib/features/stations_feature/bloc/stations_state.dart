import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/station_model.dart';

enum StationStatus { initial, loading, loaded, error }

class StationsState extends Equatable {
  final bool ischarging;
  final int page;
  final double durationrRemined;
  final StationStatus status;
  final List<Station> stations;
  final MapType mapType;
  final CameraPosition cameraPosition;
  final List<Station> favorites;
  final Station? selectedStation;
  final String searchQuery;
  final List<Station> recentSearches;

  const StationsState({
    this.page = 0,
    this.ischarging = false,
    this.status = StationStatus.initial,
    this.durationrRemined = 0,
    // you can get the remined data from the shared pref eather
    // // or get it from the socket io if it's connected , //
    //this message is for the developer who will finish this ,
    // the code may be a little bit not organized but it's not my bad ,
    // it's becaues i was just editing this code not me who created this from scratch ,
    // but app wasne't woking at all
    //, now at least it's working and working good i'll try my best to finish it in this week ,
    this.stations = const <Station>[],
    this.mapType = MapType.normal,
    this.cameraPosition = const CameraPosition(
      target: LatLng(31.791702, -7.09262),
      zoom: 8,
    ),
    this.favorites = const <Station>[],
    this.selectedStation,
    this.searchQuery = '',
    this.recentSearches = const <Station>[],
  });

  StationsState copyWith({
    int? page,
    double? durationrRemined,
    StationStatus? status,
    List<Station>? stations,
    bool? ischarging,
    MapType? mapType,
    CameraPosition? cameraPosition,
    List<Station>? favorites,
    Station? selectedStation,
    bool clearSelectedStation = false,
    String? searchQuery,
    List<Station>? recentSearches,
  }) {
    return StationsState(
      page: page ?? this.page,
      durationrRemined: durationrRemined ?? this.durationrRemined,
      ischarging: ischarging ?? this.ischarging,
      status: status ?? this.status,
      stations: stations ?? this.stations,
      mapType: mapType ?? this.mapType,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      favorites: favorites ?? this.favorites,
      selectedStation:
          clearSelectedStation ? null : selectedStation ?? this.selectedStation,
      searchQuery: searchQuery ?? this.searchQuery,
      recentSearches: recentSearches ?? this.recentSearches,
    );
  }

  @override
  List<Object?> get props => [
        durationrRemined,
        ischarging,
        page,
        status,
        stations,
        mapType,
        cameraPosition,
        favorites,
        selectedStation,
        searchQuery,
        recentSearches,
      ];
}
