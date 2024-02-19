  
abstract class ReservationRepository {
  Future<void > reserve(String chargePointId , DateTime StartTime , Duration duration );
}

class AccountRepositoryImpl implements ReservationRepository {
  @override
  Future<void > reserve(String chargePointId, DateTime StartTime, Duration duration) async {
       //TODO: implement ther reserve function here 
  }
 
 
}