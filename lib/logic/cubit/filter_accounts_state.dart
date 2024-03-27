// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_accounts_cubit.dart';

class FilterAccountsState extends Equatable {
  const FilterAccountsState({required this.paymentList});

  final List<PaymentList> paymentList;

  factory FilterAccountsState.initial() {
    return const FilterAccountsState(paymentList: []);
  }

  @override
  String toString() => 'FilterAccountsState(paymentList: $paymentList)';

  FilterAccountsState copyWith({
    List<PaymentList>? paymentList,
  }) {
    return FilterAccountsState(
      paymentList: paymentList ?? this.paymentList,
    );
  }

  @override
  List<Object?> get props => [paymentList];
}
