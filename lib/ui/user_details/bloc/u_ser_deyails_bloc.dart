import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'u_ser_deyails_event.dart';
part 'u_ser_deyails_state.dart';

class USerDeyailsBloc extends Bloc<USerDeyailsEvent, USerDeyailsState> {
  USerDeyailsBloc() : super(USerDeyailsInitial()) {
    on<USerDeyailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
