
import 'package:equatable/equatable.dart';
import 'package:exchange/constants/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_constants.dart';

part 'account_type_state.dart';

class AccountTypeCubit extends Cubit<AccountTypeState> {
  AccountTypeCubit() : super(AccountTypeState.initial());

  changeFilterEvent(AccountType newAccountType) {
    emit(state.copyWith(accountType: newAccountType));
  }
}
