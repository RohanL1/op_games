class McqQuestion{
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String sign;

  const McqQuestion({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
    required this.sign,
  });
}