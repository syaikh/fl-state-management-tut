import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/data/dummy_data.dart';
import 'package:myapp/models/meal.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});