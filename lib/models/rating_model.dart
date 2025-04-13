import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final num rate;
  final int count;

  const RatingModel({
    required this.rate,
    required this.count,
  });

 

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
  
   @override
  List<Object?> get props => [rate, count];
}
