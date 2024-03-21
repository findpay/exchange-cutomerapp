import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange/constants/app_constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    loadPaymnets();
  }

  loadPaymnets() {
    emit(HomeLoadedState(paymentlists: paymentLists));
  }
}
