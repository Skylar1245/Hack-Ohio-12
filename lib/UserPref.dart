import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static int migraineCounter = 0;
  static int asthmaCounter = 0;
  static int arthritisCounter = 0;

  bool migraine = false;
  bool asthma = false;
  bool arthritis = false;

  int migraineCount = 0;
  int asthmaCount = 0;
  int arthritisCount = 0;

  bool migraineCountToggle = false;
  bool asthmaCountToggle = false;
  bool arthritisCountToggle = false;

  Future<bool> update() async {
    migraine = await getMigraine();
    asthma = await getAsthma();
    arthritis = await getArthritis();

    migraineCount = await getMigraineCounter();
    asthmaCount = await getAsthmaCounter();
    arthritisCount = await getArthritisCounter();

    migraineCountToggle = await getMigraineCountToggle();
    asthmaCountToggle = await getAsthmaCountToggle();
    arthritisCountToggle = await getArthritisCountToggle();

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
    asthmaCounter++;
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('migraineCount', migraineCount++);
  }

  Future<int> getMigraineCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('migraineCount') ?? 0;
  }

  Future<void> setMigraineCountToggle(bool migraine) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('migraineCountToggle', migraine);
  }

  Future<bool> getMigraineCountToggle() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('migraineCountToggle') ?? false;
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
    asthmaCounter++;
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('asthmaCount', asthmaCount++);
  }

  Future<int> getAsthmaCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('asthmaCount') ?? 0;
  }

  Future<void> setAsthmaCountToggle(bool asthma) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('asthmaCountToggle', asthma);
  }

  Future<bool> getAsthmaCountToggle() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('asthmaCountToggle') ?? false;
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
    arthritisCounter++;
    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt('arthritisCount', arthritisCount++);
  }

  Future<int> getArthritisCounter() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getInt('arthritisCount') ?? 0;
  }

  Future<void> setArthritisCountToggle(bool arthritis) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('arthritisCountToggle', arthritis);
  }

  Future<bool> getArthritisCountToggle() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getBool('arthritisCountToggle') ?? false;
  }
}
