import 'package:exchange/constants/app_constants.dart';
import 'package:exchange/constants/images.dart';
import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:exchange/presentation/widgets/custom_image.dart';
import 'package:exchange/presentation/widgets/home/exchange_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Fix syntax for the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Ensure widgets stretch horizontally
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
                child: Row(
                  children: [
                    CustomImage(path: DefaultImages.avatar),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadedState) {
                    return ExchangeWidget(
                    label: 'You Send',
                    paymentList: state.accountList.first,
                    onTab: () {},
                  );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
