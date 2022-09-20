import 'package:equatable/equatable.dart';

class Facility extends Equatable {
  const Facility({
    this.id,
    this.name,
    this.image,
  });

  final int? id;
  final String? name;
  final String? image;


  Map<String, dynamic> toJson() => {};
  @override
  List<Object?> get props => [id, name, image];
}
