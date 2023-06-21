import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  static SharedPreferences? preferences;

  SharedPreferenceServices() {
    init();
  }

  // Future<void> init()async{
  //   preferences = await SharedPreferences.getInstance();
  // }
  static Future<SharedPreferences> init() async {
    final SharedPreferenceServices = await SharedPreferences.getInstance();
    preferences = SharedPreferenceServices;
    return SharedPreferenceServices;
  }

  static const String CHEFNAME = "ChefName";
  static const String tableKey = "table";
  static const String PRIORITY = "priority";

  static Future setChefName(String chefName) async {
    await preferences!.setString(CHEFNAME, (chefName));
  }

  static Future setTable(int table) async {
    await preferences!.setInt(tableKey, table);
  }

  static int? getTable() {
    return preferences!.getInt(tableKey) ?? 0;
  }

  static String? getChefName() {
    return preferences!.getString(CHEFNAME) ?? '';
  }

  static Future setPriority(String priority) async {
    await preferences!.setString(PRIORITY, priority);
  }

  static String? getPriority() {
    return preferences!.getString(PRIORITY) ?? '';
  }
}
