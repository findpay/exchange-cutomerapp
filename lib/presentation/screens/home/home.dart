import 'package:exchange/constants/app_constants.dart';
import 'package:exchange/constants/enum.dart';
import 'package:exchange/constants/images.dart';
import 'package:exchange/logic/cubit/account_type_cubit.dart';
import 'package:exchange/logic/cubit/filter_accounts_cubit.dart';
import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:exchange/presentation/widgets/custom_image.dart';
import 'package:exchange/presentation/widgets/home/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Fix syntax for the constructor

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {},
        ),
        BlocListener<AccountTypeCubit, AccountTypeState>(
            listener: (context, state) {})
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Ensure widgets stretch horizontally
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0), // Add vertical padding
                  child: Row(
                    children: [
                      CustomImage(path: DefaultImages.avatar),
                    ],
                  ),
                ),
                BlocConsumer<FilterAccountsCubit, FilterAccountsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Column(
                      children: [
                        ExchangeWidget(
                            label: 'You Send',
                            paymentList: paymentLists.first,
                            onTab: () {
                              context
                                  .read<AccountTypeCubit>()
                                  .changeFilterEvent(AccountType.first);
                            }),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
