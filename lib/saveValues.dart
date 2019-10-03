
import 'package:shared_preferences/shared_preferences.dart';
import 'storedValues.dart';





class SaveValues {

//  void doSomething() {
//    print("doing something");
//  }



  Future<String> saveJsonWebToken(userJsonWebToken_storage) async {
    final prefs = await SharedPreferences.getInstance();

    final key_userJsonWebToken = userJsonWebToken_storage;
    final value_userJsonWebToken = userJsonWebToken_storage;
    prefs.setString(key_userJsonWebToken, value_userJsonWebToken);

    String answer = 'saveJsonWebToken saved: $value_userJsonWebToken';

    print(answer);

    return answer;
  }

  Future<String> readJsonWebToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userJsonWebToken_storage';
    final value = prefs.getString(key) ?? null;
    userJsonWebToken_storage = value;

    String answer = 'saveJsonWebToken read: $value';
    print(answer);

    return answer;
  }


  void clearToken() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('userJsonWebToken_storage');

  }




  Future<String> saveCreateShake(title, description, counterMembers, confidentiality, ndaAmountPenalty, currency,
      penaltyType, amountPenalty, favour) async {
    final prefs = await SharedPreferences.getInstance();

    final value_title = title;
    final key_title = 'createShake_title';
    prefs.setString(key_title, value_title);

    final value_description = description;
    final key_description = 'createShake_description';
    prefs.setString(key_description, value_description);

    final value_counterMembers = counterMembers;
    final key_counterMembers = 'createShake_counterMembers';
    prefs.setInt(key_counterMembers, value_counterMembers);

    final value_confidentiality = confidentiality;
    final key_confidentiality = 'createShake_confidentiality';
    prefs.setString(key_confidentiality, value_confidentiality);

    final value_ndaAmountPenalty = ndaAmountPenalty;
    final key_ndaAmountPenalty = 'createShake_ndaAmountPenalty';
    prefs.setString(key_ndaAmountPenalty, value_ndaAmountPenalty);

    final value_currency = currency;
    final key_currency = 'createShake_currency';
    prefs.setString(key_currency, value_currency);

    final value_penaltyType = penaltyType;
    final key_penaltyType = 'createShake_penaltyType';
    prefs.setString(key_penaltyType, value_penaltyType);

    final value_amountPenalty = amountPenalty;
    final key_amountPenalty = 'createShake_amountPenalty';
    prefs.setInt(key_amountPenalty, value_amountPenalty);

    final value_favour = favour;
    final key_favour = 'createShake_favour';
    prefs.setString(key_favour, value_favour);

    String answer = 'saveCreateShake: save successful';

    print(answer);

    return answer;
  }

  Future<String> readCreateShake() async {

    final prefs = await SharedPreferences.getInstance();

    final key_title = 'createShake_title';
    final value_title = prefs.getString(key_title) ?? null;
    createShake_title = value_title;

    final key_description = 'createShake_description';
    final value_description = prefs.getString(key_description) ?? null;
    createShake_description = value_description;

    final key_counterMembers = 'createShake_counterMembers';
    final value_counterMembers = prefs.getInt(key_counterMembers) ?? null;
    createShake_counterMembers = value_counterMembers;

    final key_confidentiality = 'createShake_confidentiality';
    final value_confidentiality = prefs.getString(key_confidentiality) ?? null;
    createShake_confidentiality = value_confidentiality;

    final key_ndaAmountPenalty = 'createShake_ndaAmountPenalty';
    final value_ndaAmountPenalty = prefs.getString(key_ndaAmountPenalty) ?? null;
    createShake_ndaAmountPenalty = value_ndaAmountPenalty;

    final key_currency = 'createShake_currency';
    final value_currency = prefs.getString(key_currency) ?? null;
    createShake_currency = value_currency;

    final key_penaltyType = 'createShake_penaltyType';
    final value_penaltyType = prefs.getString(key_penaltyType) ?? null;
    createShake_penaltyType = value_penaltyType;

    final key_amountPenalty = 'createShake_amountPenalty';
    final value_amountPenalty = prefs.getInt(key_amountPenalty) ?? null;
    createShake_amountPenalty = value_amountPenalty;

    final key_favour = 'createShake_favour';
    final value_favour = prefs.getString(key_favour) ?? null;
    createShake_favour = value_favour;

    String answer = 'readCreateShake read successful';
    print(answer);

    return answer;
  }

















//
//
//
//  void readUserTokenValues() async {
//    final prefs = await SharedPreferences.getInstance();
//    final key = 'my_int_key';
//    final value = prefs.getInt(key) ?? 0;
//    print('read: $value');
//  }
//
//  void saveUserTokenValues() async {
//    final prefs = await SharedPreferences.getInstance();
//
//    final key_userName = 'userName_storage';
//    final value_userName = userName_storage;
//    prefs.setString(key_userName, value_userName);
//
//    final key_tokenIsFrom = 'tokenIsFrom_storage';
//    final value_tokenIsFrom = tokenIsFrom_storage;
//    prefs.setString(key_tokenIsFrom, value_tokenIsFrom);
//
//    final key_tokenIssued = 'tokenIssued_storage';
//    final value_tokenIssued = tokenIssued_storage;
//    prefs.setInt(key_tokenIssued, value_tokenIssued);
//
//    final key_tokenValidTil = 'tokenValidTil_storage';
//    final value_tokenValidTil = tokenValidTil_storage;
//    prefs.setInt(key_tokenValidTil, value_tokenValidTil);
//
//    final key_userPhone = 'userPhone_storage';
//    final value_userPhone = userPhone_storage;
//    prefs.setInt(key_userPhone, value_userPhone);
//
//    print('saveUserTokenValues: Success');
//  }














}

