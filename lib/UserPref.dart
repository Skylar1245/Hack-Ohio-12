import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  bool migraine = false;
  bool asthma = false;
  bool arthritis = false;

  int migraineCount = 0;
  int asthmaCount = 0;
  int arthritisCount = 0;

  Future<bool> update() async {
    migraine = await getMigraine();
    asthma = await getAsthma();
    arthritis = await getArthritis();

    if (migraine) {
      migraineCount = await getMigraineCounter();
    } else {
      migraineCount = 0;
    }

    if (asthma) {
      asthmaCount = await getAsthmaCounter();
    } else {
      asthmaCount = 0;
    }

    if (arthritis) {
      arthritisCount = await getArthritisCounter();
    } else {
      arthritisCount = 0;
    }

    return true;
  }

//migraine
  Future<void> setMigraine(bool migraine) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('migraine', migraine);
  }

  Future<bool> getMigraine() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('migraine') ?? false;
  }

  Future<void> incMigraine() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('migraineCount', migraineCount++);
  }

  Future<int> getMigraineCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('migraineCount') ?? 0;
  }

//asthma
  Future<void> setAsthma(bool asthma) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('asthma', asthma);
  }

  Future<bool> getAsthma() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('asthma') ?? false;
  }

  Future<void> incAsthma() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('asthmaCount', asthmaCount++);
  }

  Future<int> getAsthmaCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('asthmaCount') ?? 0;
  }

//arthritis
  Future<void> setArthritis(bool arthritis) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('arthritis', arthritis);
  }

  Future<bool> getArthritis() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('arthritis') ?? false;
  }

  Future<void> incArthritis() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('arthritisCount', arthritisCount++);
  }

  Future<int> getArthritisCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('arthritisCount') ?? 0;
  }
}
