import 'package:op_games/common/translate/meta_data.dart';
import 'dart:developer';

Map<String, dynamic> getMCQLanguageData(String language1, String language2) {
  Map<String, dynamic> result = {};
  List<String> languages = languageData["languages"];
  if (!languages.contains(language1) || !languages.contains(language2)) {
    language1 = language2 = "English";
  }
  result["languages"] = [language1, language2];
  result["ques_heading"] = {
    "pri_lang": languageData["pages"]["MCQ"]["ques_heading"][language1],
    "sec_lang": languageData["pages"]["MCQ"]["ques_heading"][language2],
  };
  return result;
}
Map<String, dynamic> getFlashCardLanguageData(String language1, String language2) {
  Map<String, dynamic> result = {};

  // Extract languages from languageData
  List<String> languages = languageData["languages"];

  // Check if the provided languages are valid
  if (!languages.contains(language1) || !languages.contains(language2)) {
    language1 = language2 = "English";
  }

  // // Extract data for the specified languages
  // result["pages"] = {};
  result["languages"] = [language1, language2];

  Map<String, dynamic> flashcardPage = languageData["pages"]["flashcard"];
  Map<String, dynamic> pageData = {};

  for (var opKey in ["+", "-", "x", '÷']) {
    Map<String, dynamic> opData = flashcardPage[opKey];

    Map<String, dynamic> opName = {
      "pri_lang": opData["op_name"][language1],
      "sec_lang": opData["op_name"][language2]
    };
    Map<String, dynamic> opDef = {
      "pri_lang": opData["op_def"][language1],
      "sec_lang": opData["op_def"][language2]
    };
    pageData[opKey] = {"op_name": opName, "op_def": opDef};
  }
  result = pageData;

  // Add "Guess the Answer" definition
  result["ques_def"] = {
    "pri_lang": languageData["pages"]["flashcard"]["ques_def"][language1],
    "sec_lang": languageData["pages"]["flashcard"]["ques_def"][language2],
  };

  return result;
}

String getNumToWordLangKey(String lang){
  Map<String, String> languageTranslations = {
    "English": "en",
    "Portuguese": "pt",
    "Spanish": "es",
    "French": "fr",
    "Esperanto": "eo",
    "Vietnamese": "vi",
    "Arabic": "ar",
    "Azerbaijan": "az",
    "Turkish": "tr",
    "Ukrainian": "uk",
    "Indonesian": "id",
    "Russian": "ru",
  };
  return languageTranslations[lang]!;
}


String getSpeakLangKey(String lang){
  Map<String, String> languageTranslations = {
    "English": 'en-US',
    // "Portuguese": "pt",
    "Spanish": 'es-ES',
    // "French": "fr",
    // "Esperanto": "eo",
    // "Vietnamese": "vi",
    // "Arabic": "ar",
    // "Azerbaijan": "az",
    // "Turkish": "tr",
    // "Ukrainian": "uk",
    // "Indonesian": "id",
    // "Russian": "ru",
  };
  return languageTranslations[lang]!;
}

