// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_account_cubit.dart';

class ChangeAccountState extends Equatable {
  final PaymentList? selectedAccount;
  final String accountType;

  

  const ChangeAccountState({required this.selectedAccount, required this.accountType});
  @override
  String toString() => 'ChangeAccountState(selectedAccount: $selectedAccount, accountType: $accountType)';

  factory ChangeAccountState.initial() {
    return const ChangeAccountState(
       selectedAccount: null, // Assuming PaymentList has a default constructor
      accountType: '', // Provide a default value for accountType
    );
  }

   @override
  List<Object> get props => [selectedAccount ??  [],accountType];

  ChangeAccountState copyWith({
    PaymentList? selectedAccount,
    String? accountType,
  }) {
    return ChangeAccountState(
      selectedAccount: selectedAccount ?? this.selectedAccount,
      accountType: accountType ?? this.accountType,
    );
  }
}
