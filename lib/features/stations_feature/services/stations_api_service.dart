import 'package:ismart/common/network/network.dart';

import '../../../common/utils/logger.dart';
import '../models/station_model.dart';

abstract class StationsApiService {
  final ApiClient _apiClient;

  StationsApiService(this._apiClient);

  Future<List<Station>> fetchStations();
}

class StationsApiServiceImpl implements StationsApiService {
  final String _stationsPath = '/chargePoints';
  @override
  final ApiClient _apiClient;
  StationsApiServiceImpl(this._apiClient);
  @override
  Future<List<Station>> fetchStations() async {
    try {
      return fakedata();
    } catch (e) {
      log.severe('____________________________>fetchStations error: $e');
      rethrow;
    }
  }
}
