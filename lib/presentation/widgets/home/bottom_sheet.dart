import 'package:exchange/logic/cubit/home_cubit.dart';
import 'package:exchange/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';

Widget topupDialog(BuildContext context,
    {required List<PaymentList> paymentList, required int type}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
    child: Container(
      height: 332,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == false
            ? const Color(0xff211F32)
            : Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: HexColor(AppTheme.primaryColorString!),
                    size: 20,
                  ),
                ),
                Text(
                  "Confirm",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.transparent,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                  paymentList.length,
                  (index) => ListTile(
                        onTap: () {
                          context
                              .read<HomeCubit>()
                              .onchangeAccount(paymentList[index], type);
                          Navigator.pop(context);
                        },
                        title: Text(
                          paymentList[index].name,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      )),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    ),
  );
}
