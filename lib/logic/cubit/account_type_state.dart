// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_type_cubit.dart';

class AccountTypeState extends Equatable{
  const AccountTypeState({required this.accountType,required this.amount,required this.paymentList});

  factory AccountTypeState.initial() {
    return const AccountTypeState(accountType: AccountType.none,amount: 0, paymentList: []);
  }

  final AccountType accountType;
  final double amount;
  final List<PaymentList> paymentList;

 


  

  @override
  String toString() => 'AccountTypeState(accountType: $accountType, amount: $amount, paymentList: $paymentList)';

  AccountTypeState copyWith({
    AccountType? accountType,
    double? amount,
    List<PaymentList>? paymentList,
  }) {
    return AccountTypeState(
      accountType: accountType ?? this.accountType,
      amount: amount ?? this.amount,
      paymentList: paymentList ?? this.paymentList,
    );
  }
  
  @override
  List<Object?> get props => [accountType, amount, paymentList];
}
