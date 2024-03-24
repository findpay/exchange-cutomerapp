import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange/constants/app_constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    loadPaymnets();
  }
  PaymentList? selectedFromPayments;
  PaymentList? selectedToPayments;

  loadPaymnets() {
    List<PaymentList> fromPayments = [];
    List<PaymentList> toPayments = [];

    for (int i = 0; i < paymentLists.length; i++) {
      if (i > 0) {
        selectedToPayments = paymentLists[i];
        toPayments.add(paymentLists[i]);
      }
      if (i != 1) {
        selectedFromPayments = paymentLists[i];
        fromPayments.add(paymentLists[i]);
      }
    }

    emit(HomeLoadedState(
        fromPaymentlists: fromPayments, toPaymentlists: toPayments));
  }

  onchangeAccount(PaymentList selectedAccounts, int index) {
    List<PaymentList> fromPayments = [];
    List<PaymentList> toPayments = [];

    String selectedId;

    emit(HomeLoadingState());

    if (index == 1) {
      selectedId = selectedFromPayments!.id;
    } else {
      selectedId = selectedToPayments!.id;
    }

    if (index == 1) {
      fromPayments =
          paymentLists.where((element) => element.id == selectedId).toList();
      toPayments =
          paymentLists.where((element) => element.id != selectedId).toList();
    } else if (index == 2) {
      toPayments =
          paymentLists.where((element) => element.id == selectedId).toList();
      fromPayments =
          paymentLists.where((element) => element.id != selectedId).toList();
    }
    emit(HomeLoadedState(
        fromPaymentlists: fromPayments, toPaymentlists: toPayments));
  }
}
