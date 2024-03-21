import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:exchange/constants/app_constants.dart';
import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_account_state.dart';

class ChangeAccountCubit extends Cubit<ChangeAccountState> {
  late StreamSubscription accountListSubscription;

  final HomeCubit homeCubit;

  ChangeAccountCubit({required this.homeCubit})
      : super(ChangeAccountState.initial()) {
    accountListSubscription = homeCubit.stream.listen((HomeState homeState) {
     
    });
  }
  @override
  Future<void> close() {
    accountListSubscription.cancel();
    return super.close();
  }
}
