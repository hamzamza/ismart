import 'package:equatable/equatable.dart';
 

class ReseravationState extends Equatable {
 final  bool? loading   ; 

  const ReseravationState({ 
    required this.loading 
  });

  ReseravationState copyWith({    bool? loading   }) {
    return ReseravationState( 
 loading:  loading 
    );
  }

  @override
  List<Object?> get props => [
        loading ,
      ];
}
