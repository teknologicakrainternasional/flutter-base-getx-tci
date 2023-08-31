import 'package:base_flutter_tci/_core/constants/app_validation.dart';

class AppValidationMessage {
  static const id = {
    AppValidation.empty: "@field tidak boleh kosong.",
    AppValidation.characterLength: "@field harus terdiri dari minimal @length karakter.",
    AppValidation.containUppercase: "@field harus mengandung setidaknya @number huruf besar.",
    AppValidation.containNumber: "@field harus mengandung setidaknya @number angka.",
    AppValidation.containSymbol: "@field harus mengandung setidaknya @number simbol.",
  };
  static const en = {
    AppValidation.empty: "@field cannot be empty.",
    AppValidation.characterLength: "@field must consist of at least @length characters.",
    AppValidation.containUppercase: "@field must contain at least an uppercase @number.",
    AppValidation.containNumber: "@field must contain at least a numeric @number.",
    AppValidation.containSymbol: "@field must contain at least an @number symbol.",
  };
  static const translation = {
    'en_US': en,
    'id_ID': id,
  };
}
