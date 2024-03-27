import 'package:equatable/equatable.dart';
import 'package:exchange/constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    loadPaymnets();
  }

  List<PaymentList> accountLists = paymentLists;

  loadPaymnets() {
    emit(HomeLoadedState(accountList: accountLists));
  }
}
