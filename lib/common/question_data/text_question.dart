
class TextQuestion{
  final String question;
  final String answer;

  const TextQuestion({
    required this.answer,
    required this.question
  });
  String toString(){
    return 'TextQuestion{question: $question, answer: $answer}';
  }
}