import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  int? id;
  int? recipeId;
  final String? name;
  final double? weight;

  Ingredient({this.id, this.recipeId, this.name, this.weight});

  @override
  List<Object?> get props => [recipeId, name, weight];

  factory Ingredient.fromJson(Map<String, dynamic> map) => Ingredient(
        id: map['ingredientId'] as int,
        recipeId: map['recipeId'] as int,
        name: map['name'] as String,
        weight: map['weight'] as double,
      );

  Map<String, dynamic> toJson() => {
        'ingredientId': id,
        'recipeId': recipeId,
        'name': name,
        'weight': weight,
      };
}
