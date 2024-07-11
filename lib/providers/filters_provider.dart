import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/meal.dart';
import 'package:myapp/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

final filtersProvider = StateNotifierProvider<FilterNotifier,Map<Filter, bool>>((ref) {
  return FilterNotifier();
});

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier(): super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });
  
  void setFilter(Filter filter, bool isActive){
    state = {
      ...state, filter: isActive,
    };
  }
  void setFilters(Map<Filter, bool> chosenFilters){
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3003198521.
    state = chosenFilters;
  }
}

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});