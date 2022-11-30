import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/cubit/states.dart';
import 'package:quizapp/models/questions.dart';

class QuizCubit extends Cubit<QuizStates> {
  QuizCubit() : super(QuizInitialState());
  static QuizCubit get(context) => BlocProvider.of(context);
  // List<String> questions = [
  //   'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
  //   'القطط هي حيوانات لاحمة',
  //   'الصين موجودة في القارة الإفريقية',
  //   'الأرض مسطحة وليست كروية',
  //   'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
  //   'الشمس تدور حول الأرض والأرض تدور حول القمر',
  //   'الحيوانات لا تشعر بالألم'
  // ];
  bool? checkTrueOrFalse;
  // List<bool> check = [true, true, false, false, true, false, false];
  int index = 0;
  // List<String> images = [
  //   "assets/image-1.jpg",
  //   "assets/image-2.jpg",
  //   "assets/image-3.jpg",
  //   "assets/image-4.jpg",
  //   "assets/image-5.jpg",
  //   "assets/image-6.jpg",
  //   "assets/image-7.jpg"
  // ];
  List<Questions> questions = [
    Questions(
        text: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
        images: "assets/image-1.jpg",
        check: true),
    Questions(
        text: 'القطط هي حيوانات لاحمة',
        images: "assets/image-2.jpg",
        check: true),
    Questions(
        text: 'الصين موجودة في القارة الإفريقية',
        images: "assets/image-3.jpg",
        check: false),
    Questions(
        text: 'الأرض مسطحة وليست كروية',
        images: "assets/image-4.jpg",
        check: false),
    Questions(
        text: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
        images: "assets/image-5.jpg",
        check: true),
    Questions(
        text: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
        images: "assets/image-6.jpg",
        check: false),
    Questions(
        text: 'الحيوانات لا تشعر بالألم',
        images: "assets/image-7.jpg",
        check: false),
  ];
  List<Widget> icon = [
    // Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Icon(
    //     Icons.thumb_up_alt_outlined,
    //     color: Colors.green,
    //   ),
    // ),
    // Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Icon(
    //     Icons.thumb_down_alt_outlined,
    //     color: Colors.red,
    //   ),
    // )
  ];
  void checkAnswers(bool check) {
    checkTrueOrFalse = questions[index].checkQuestion;
    if (check == checkTrueOrFalse) {
      icon.add(
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.thumb_up_alt_outlined,
            color: Colors.green,
          ),
        ),
      );
    } else {
      icon.add(const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.thumb_down_alt_outlined,
          color: Colors.red,
        ),
      ));
    }
    emit(CheckAnswerState());
  }

  void changeQuestion() {
    index++;

    if (index <= 6) {
      questions[index].questionText;
      questions[index].questionImage;
    } else {
      questions[0].questionText;
      questions[0].questionImage;
      index = 0;
      icon = [];
    }
    emit(ChangeQuestionState());
  }
}
