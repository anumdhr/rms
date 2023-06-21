
import 'package:flutter/material.dart';
import 'package:rm_ui/screen/home_screen/home_screen.dart';
import 'package:rm_ui/screen/home_screen/widgets/kitchen_setup/add_food/add_food.dart';

class GridOrderedModel {
  String dish_name;
  int quantity;
  int serve;
  int packing;
  int price;

 Widget navPage;

  GridOrderedModel({
    required this.dish_name,
    required this.quantity,
    required this.serve,
    required this.packing,
    required this.price,

    required this.navPage,
  });
}

List<GridOrderedModel> gridOrderedModel = [
  GridOrderedModel(
    dish_name: "Momo",
    quantity: 5,
    serve: 9,
    packing: 4,
    price: 500,

    navPage:

    AddFood(),
  ),
  GridOrderedModel(
    dish_name: "Pizza",
    quantity: 5,
    serve: 9,
    packing: 4,
    price: 200,

    navPage: MyHomePage(),
  ),
  GridOrderedModel(
    dish_name: "Chowmin",
    quantity: 5,
    serve: 9,
    packing: 4,
    price: 100,

    navPage: AddFood(),
  ),
  GridOrderedModel(
    dish_name: "Laphing",
    quantity: 5,
    serve: 9,
    packing: 4,
    price: 400,

    navPage: AddFood(),
  ),
];

class KitchenSetUpModel {
  String image;
  String text;

  KitchenSetUpModel({
    required this.image,
    required this.text,
  });
}

List<KitchenSetUpModel> kitchenSetUpModel = [
  KitchenSetUpModel(image: "assets/images/AddFoodIcon.svg", text: "ADD FOOD"),
  KitchenSetUpModel(image: "assets/images/OrderIcon.svg", text: "ORDERS"),
  KitchenSetUpModel(image: "assets/images/SettingsIcon.svg", text: "SETUP"),
  KitchenSetUpModel(image: "assets/images/AboutIcon.svg", text: "ABOUT US"),
];


class SetUpModel{
  String text;
  String image;

  SetUpModel({
    required this.image, required this.text
});
}

List<SetUpModel> setUpModel=[
  SetUpModel(image: "assets/images/KitchenIcon.svg", text: "Kitchen Setup"),
  SetUpModel(image: "assets/images/ChefIcon (1).svg", text: "Chef Setup"),
  SetUpModel(image: "assets/images/FlavorIcon.svg", text: "Flavor Setup"),
  SetUpModel(image: "assets/images/FoodProviderIcon.svg", text: "Food Provider Setup"),
];




