import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/meal.dart';

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier(): super([]); // pass initial data to super
  
  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);
    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id,).toList();
      return false;
    }else {
      state = [...state, meal];
      return true;
    }
  }
  
}