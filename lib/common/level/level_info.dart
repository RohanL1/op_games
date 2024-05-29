import 'package:op_games/common/global.dart';
import 'package:op_games/common/util/log.dart';

class LevelInfo{
  bool completeStatus ;
  final String levelName;
  final int levelNumber;
  final int maxScore;
  int userScore;
  final String sign;
  bool isUnlocked ;

  LevelInfo({
    required this.completeStatus,
    required this.levelName,
    required this.levelNumber,
    required this.maxScore,
    required this.userScore,
    required this.sign,
    required this.isUnlocked,

  });

  @override
  String toString() {
    return 'LevelInfo('
        'completeStatus: $completeStatus, '
        'levelName: $levelName, '
        'levelNumber: $levelNumber, '
        'maxScore: $maxScore, '
        'userScore: $userScore, '
        'sign: $sign, '
        'isUnlocked: $isUnlocked'
        ')';
  }

  void updateScore(int currScore) {
    String info = 'Current Score: $currScore,\nMax Score: $userScore\nOld Global Score: ${GlobalVariables.totalScore.value}';

    if (currScore > userScore) {
      int difference = currScore - userScore;
      userScore = currScore;
      GlobalVariables.totalScore.value += difference;
      printInBox('$info\nNew Global Score: ${GlobalVariables.totalScore.value}');
      unlockNextLevel();
    }
  }

  void unlockNextLevel(){
    LevelInfo nextLevel = GlobalVariables.levels[levelNumber+1];
    printInBox('score ratio: ${userScore/maxScore} ');
    if (userScore/maxScore >= 0.8){
      nextLevel.isUnlocked = true;
      printInBox('Level : ${nextLevel.levelNumber} Unlocked');
    }
  }

}

List<LevelInfo> createDummyData() {
  List<LevelInfo> levels = [];
  List<String> signs = [ "TEMP",
    '+','+','+', // For levels 1, 2, 3,
    '-', '-', '-', // For levels 4, 5, 6
    'x','x', // For levels 7, 8,
    '÷','÷', // For levels 9, 10
    'mix','mix','mix', // For levels 11, 12
  ];
  // Generate sample data for levels
  for (int i = 0; i <= 13; i++) {
    LevelInfo level = LevelInfo(
      completeStatus: i % 3 == 0, // Random complete status
      levelName: 'Level $i',
      levelNumber: i,
      maxScore: 10,
      userScore: 0,
      sign: signs[i],
      isUnlocked: i <= 5, // Unlock first 5 levels
    );

    levels.add(level);
  }

  return levels;
}