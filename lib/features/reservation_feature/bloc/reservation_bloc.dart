import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ismart/features/reservation_feature/bloc/reservation_event.dart';
import 'package:ismart/features/reservation_feature/bloc/reservation_state.dart';
import 'package:ismart/features/reservation_feature/repository/reservation_repository.dart';
 

import '../../../common/utils/logger.dart';
 

class ReservationBloc extends Bloc<ReserveEvent , ReseravationState> {
  final ReservationRepository  _reservationRepository ;

  ReservationBloc(this._reservationRepository) : super(const ReseravationState(loading: false )) {
    on<doReserveEvent>(_onReserve);
 
  }

  Future<void> _onReserve(
    doReserveEvent event,
    Emitter<ReseravationState> emit,
  ) async {
    try {
      _reservationRepository.reserve("chargePointId", DateTime.now(), Duration.zero); 
      
    } catch (e) {
      log.severe(e);
    }
  }

 
}
