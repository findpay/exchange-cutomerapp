import 'package:exchange/constants/images.dart';
import 'package:exchange/logic/cubit/change_account_cubit.dart';
import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:exchange/presentation/widgets/custom_image.dart';
import 'package:exchange/presentation/widgets/home/list_title.dart';
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
                padding: EdgeInsets.symmetric(
                    vertical: 8.0), // Add vertical padding
                child: Row(
                  children: [
                    CustomImage(path: DefaultImages.avatar),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadedState) {
                    final paymentLists = state.paymentlists;
                    return Card(
                      color: Colors.transparent,
                      elevation: 3,
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(
                                8.0), // Add padding to the text
                            child: Text(
                              'From',
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make the text bold
                                fontSize: 16.0, // Increase font size
                              ),
                            ),
                          ),
                          buildListTile(
                              paymentListItem: paymentLists,
                              context: context),
                          const Divider(
                            thickness: 1.0,
                            indent: 16.0,
                            endIndent: 16.0,
                          ),
                          buildListTile(
                              paymentListItem: paymentLists, context: context)
                        ],
                      ),
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
