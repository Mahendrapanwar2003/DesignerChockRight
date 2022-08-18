import 'package:shared_preferences/shared_preferences.dart';

class DataSingleton {

  DataSingleton._privateConstructor();

  static final DataSingleton _instance = DataSingleton._privateConstructor();

  static DataSingleton get instance => _instance;


  String locationId = "INDORE";
  String languageId = "en";
  Future<SharedPreferences> sp = SharedPreferences.getInstance();

  void onInit(){
    ///TODO: Shared prefernce ualue access
    locationId = "INDORE";
    languageId = "en";
    sp = SharedPreferences.getInstance();
  }
}
