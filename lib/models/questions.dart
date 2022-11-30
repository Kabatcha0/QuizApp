class Questions {
  late String questionText;
  late String questionImage;
  late bool checkQuestion;
  Questions({
    required String text,
    required String images,
    required bool check,
  }) {
    questionText = text;
    questionImage = images;
    checkQuestion = check;
  }
}
