import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:exchange/constants/enum.dart';
import 'package:exchange/logic/cubit/account_type_cubit.dart';
import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_constants.dart';

part 'filter_accounts_state.dart';

class FilterAccountsCubit extends Cubit<FilterAccountsState> {
  late StreamSubscription accountListSubscription;

  late StreamSubscription accountTypeSubscription;
  late final List<PaymentList> initialPaymentList;

  final AccountTypeCubit accountTypeCubit;
  final HomeCubit homeCubit;
  FilterAccountsCubit(
      {required this.homeCubit,
      required this.accountTypeCubit,
      required this.initialPaymentList})
      : super(FilterAccountsState(paymentList: initialPaymentList)) {
    accountListSubscription = homeCubit.stream.listen((HomeState homeState) {
      setFiltersAccount();
    });

    accountTypeSubscription =
        accountTypeCubit.stream.listen((AccountTypeState accountTypeState) {
      setFiltersAccount();
    });
  }

  late PaymentList selectedFrmAccount;
  late PaymentList selectedToAccount;

  void setFiltersAccount() {
    List<PaymentList> accountLists = [];
    if (homeCubit.state is HomeLoadedState) {
      accountLists = state.paymentList;
    }

    if (accountTypeCubit.state.accountType == AccountType.first) {
      
    }

    emit(state.copyWith(paymentList: accountLists));
  }
}
