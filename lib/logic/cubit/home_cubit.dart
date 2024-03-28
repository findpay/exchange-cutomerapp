import 'package:equatable/equatable.dart';
import 'package:exchange/data/model/member_accounts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    loadPaymnets();
  }

  List<PaymentList> accountLists = paymentLists;

  PaymentList? firstSelectedAccount;
  PaymentList? secondSelectedAccount;

  loadPaymnets() {
    for (var i = 0; i < accountLists.length; i++) {
      if (i == 0) {
        firstSelectedAccount = accountLists[i];
      } else if (i == 1) {
        secondSelectedAccount = accountLists[i];
      }
    }

    emit(const HomeLoadedState());
  }

  onChangeAccount(PaymentList selectedAccount, int accountType) {
    emit(HomeChangeState());
    if (accountType == 1) {
      firstSelectedAccount = selectedAccount;
    } else {
      secondSelectedAccount = selectedAccount;
    }
    emit(const HomeLoadedState());
  }
}
