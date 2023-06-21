class ChefModel {
  String chefName;
  String priority;

  ChefModel({
    required this.priority,
    required this.chefName,
  });

  Map<String, dynamic> toJson() => {
        'priority': priority,
        'chefName': chefName,
      };
}

List<ChefModel> chefModel = [];
