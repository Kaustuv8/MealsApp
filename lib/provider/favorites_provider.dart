import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);//Empty list passed to the notifier. The Favorite Meal is Empty at first

  bool toggleMealFavoriteStatus(Meal meal){
    final mealisfavorite = state.contains(meal);
    //state is globally provided by StateNotifier. It cannot be edited, but it can be redeclared. state contains the required Data.
    //therefore we redeclare the state instead of using .add() or .remove(), as the latter are not allowed
    if(mealisfavorite){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state, meal];
      return true;
    }
    //In these, we insert new values in state instead of editting them on memory
    //In other words, the value is replaced by another value, not edited.
  } 
}
//StateNotifier class now is sent to StateNotifierProvider Object
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});