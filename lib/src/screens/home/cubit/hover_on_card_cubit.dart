import 'package:flutter_bloc/flutter_bloc.dart';

class HoverOnProjectCardCubit extends Cubit<int?> {
  HoverOnProjectCardCubit() : super(null);

  void onHover(int index) {
    emit(index);
  }

  void cancelHover() {
    emit(null);
  }
}
