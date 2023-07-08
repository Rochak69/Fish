import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:buyer_shop/ui/my_language/bloc/my_language_event.dart';
import 'package:buyer_shop/ui/my_language/bloc/my_language_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MyLanguageBloc extends Bloc<MyLanguageEvent, MyLanguageState> {
  MyLanguageBloc() : super(EnglishState()) {
    on<SwitchEnglish>(_switchEnglish);
    on<SwitchNepali>(_switchNepali);
  }

  FutureOr<void> _switchNepali(
      SwitchNepali event, Emitter<MyLanguageState> emit) {
    emit(NepaliState());
  }

  FutureOr<void> _switchEnglish(
      SwitchEnglish event, Emitter<MyLanguageState> emit) {
    emit(EnglishState());
  }
}
