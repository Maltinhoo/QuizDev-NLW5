import 'package:desafio_nlw/home/home_repository.dart';
import 'package:desafio_nlw/home/home_state.dart';
import 'package:desafio_nlw/shared/models/quiz_model.dart';
import 'package:desafio_nlw/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  //HomeState state = HomeState.empty;
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  HomeState get state => stateNotifier.value;
  set state(HomeState state) => stateNotifier.value = state;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void fetchData() async {
    state = HomeState.loading;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
