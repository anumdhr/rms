class KitchenListModel {
  String kitchenName;
  String address;
  int? chefNumber;

  KitchenListModel({
    required this.kitchenName,
    required this.address,
    this.chefNumber,

  });
}
List<KitchenListModel> kitchenListModel = [

];