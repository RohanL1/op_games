import 'package:op_games/common/level/level_info.dart';
import 'package:flutter/foundation.dart';

class GlobalVariables {
  static String priLang = "English"; // Private static variable
  static String secLang = "Spanish"; // Private static variable
  static String userName = "User XYZ"; // Private static variable
  static String userID = "12121"; // Private static variable
  static ValueNotifier<int> totalScore = ValueNotifier<int>(0);
  static List<LevelInfo> levels = createDummyData();
}
