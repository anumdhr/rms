import 'dart:html';
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
class KitchenListModel {
  String kitchenName;
  String address;
  int chefNumber;

  KitchenListModel({
    required this.kitchenName,
    required this.address,
    required this.chefNumber,

});
}
List<KitchenListModel> kitchenListModel = [
  KitchenListModel(kitchenName: "Beeb Kitchen", address: "Chardobato", chefNumber: 2),
  KitchenListModel(kitchenName: "Yogi Kitchen", address: "Rabi Opi", chefNumber: 1),
  KitchenListModel(kitchenName: "Alish Kitchen", address: "Bhaktapur", chefNumber: 1),
];

class SetUpModel{
  String text;
  String image;

  SetUpModel({
    required this.image, required this.text
});
}

List<SetUpModel> setUpModel=[
  SetUpModel(image: "assets/images/AboutIcon.svg", text: "Kitchen Setup"),
  SetUpModel(image: "assets/images/AboutIcon.svg", text: "Chef Setup"),
  SetUpModel(image: "assets/images/AboutIcon.svg", text: "Flavor Setup"),
  SetUpModel(image: "assets/images/AboutIcon.svg", text: "Food Provider Setup"),
];
class  FlavorListModel{
  String text;

  FlavorListModel({
    required this.text
});
}
List<FlavorListModel> flavorListModel=[
  FlavorListModel(text: "Regular"),
  FlavorListModel(text: "Hot and Spicy"),
  FlavorListModel(text: "Soft"),
];

class FoodProviderListModel {
  String providerName;
  String shortName;
  int phoneNumber;
  String address;

  FoodProviderListModel({
    required this.providerName,
    required this.shortName,
    required this.phoneNumber,
    required this.address

  });
}
List<FoodProviderListModel> foodProviderListModel = [
  FoodProviderListModel(providerName: "Beebek", shortName: "beeb", phoneNumber: 9812345678, address: "Banepa, Kavre"),
  FoodProviderListModel(providerName: "Yogesh", shortName: "Yogi", phoneNumber: 9845678910, address: "Banepa,Nala"),
  FoodProviderListModel(providerName: "Alish", shortName: "Ali", phoneNumber: 9876543210, address: "Dhulikhel,Kavre"),
];
