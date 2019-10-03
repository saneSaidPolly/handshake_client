




class BasicServerResponse {
  final int mainNumber;
  final int sideNumber;
  final String mainMessage;
  final String sideMessage;

  BasicServerResponse({this.mainNumber, this.sideNumber, this.mainMessage, this.sideMessage});

  factory BasicServerResponse.fromJson(Map<String, dynamic> json) {
    return BasicServerResponse(
      mainNumber: json['mainNumber'],
      sideNumber: json['sideNumber'],
      mainMessage: json['mainMessage'],
      sideMessage: json['sideMessage'],
    );
  }
}




class SimpleServerResponse {
  final String jsonWebToken;
  final String purposeMain;
  final String purposeSecondary;

  final String stringOne;
  final String stringTwo;
  final String stringThree;
  final String stringFour;
  final String stringFive;

  final int numberOne;
  final int numberTwo;
  final int numberThree;
  final int numberFour;
  final int numberFive;

  SimpleServerResponse({this.jsonWebToken, this.purposeMain, this.purposeSecondary, this.stringOne, this.stringTwo
  , this.stringThree, this.stringFour, this.stringFive, this.numberOne, this.numberTwo
, this.numberThree, this.numberFour, this.numberFive});

  factory SimpleServerResponse.fromJson(Map<String, dynamic> json) {
    return SimpleServerResponse(

      jsonWebToken: json['jsonWebToken'],
      purposeMain: json['purposeMain'],
      purposeSecondary: json['purposeSecondary'],

      stringOne: json['stringOne'],
      stringTwo: json['stringTwo'],
      stringThree: json['stringThree'],
      stringFour: json['stringFour'],
      stringFive: json['stringFive'],

      numberOne: json['numberOne'],
      numberTwo: json['numberTwo'],
      numberThree: json['numberThree'],
      numberFour: json['numberFour'],
      numberFive: json['numberFive'],


    );
  }
}