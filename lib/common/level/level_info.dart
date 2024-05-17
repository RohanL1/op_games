class LevelInfo{
  final bool completeStatus ;
  final String levelName;
  final int levelNumber;
  final int maxScore;
  final int userScore;
  final String sign;
  final bool isUnlocked ;

  const LevelInfo({
    required this.completeStatus,
    required this.levelName,
    required this.levelNumber,
    required this.maxScore,
    required this.userScore,
    required this.sign,
    required this.isUnlocked,

  });
}

List<LevelInfo> createDummyData() {
  List<LevelInfo> levels = [];

  // Generate sample data for levels
  for (int i = 0; i <= 11; i++) {
    LevelInfo level = LevelInfo(
      completeStatus: i % 3 == 0, // Random complete status
      levelName: 'Level $i',
      levelNumber: i,
      maxScore: 100,
      userScore: i * 10,
      sign: 'Sign $i',
      isUnlocked: i <= 5, // Unlock first 5 levels
    );

    levels.add(level);
  }

  return levels;
}