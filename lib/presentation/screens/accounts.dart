import 'package:exchange/data/model/acoount_model.dart';
import 'package:exchange/logic/cubit/accounts_cubit.dart';
import 'package:exchange/presentation/theme.dart';
import 'package:exchange/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.isLightTheme == false
            ? const Color(0xff15141F)
            : const Color(0xffFFFFFF),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: AppBar().preferredSize.height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('data')),
            BlocBuilder<AccountsCubit, AccountsState>(
              builder: (context, state) {
                if (state is AccountsStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is AccountsStateError) {
                  return Text(state.message);
                }
                if (state is AccountsStateLoaded) {
                  final accountList = state.accounts;
                  return accountsWidget(accountList);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget accountsWidget(List<AccountsModel> accountList) {
    return Expanded(
      child: ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: accountList[index].name,
                      border: const OutlineInputBorder(),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomImage(
                            path: accountList[index].icon.formats.thumbnail.url,
                            width: 50,
                            height: 30,
                          ), // Custom image
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
