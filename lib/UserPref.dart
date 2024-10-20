import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  bool migraine = false;
  bool asthma = false;
  bool arthritis = false;

  Future<bool> update() async{
    migraine = await getMigraine();
    asthma = await getAsthma();
    arthritis = await getArthritis();
    return true;
  }



  Future<void> setMigraine(bool migraine) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('migraine', migraine);
  }

  Future<bool> getMigraine() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('migraine') ?? false;
  }



  Future<void> setAsthma(bool asthma) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('asthma', asthma);
  }

  Future<bool> getAsthma() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('asthma') ?? false;
  }



  Future<void> setArthritis(bool arthritis) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('arthritis', arthritis);
  }

  Future<bool> getArthritis() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('arthritis') ?? false;
  }
}
