import 'dart:ffi';

import 'package:exchange/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../../../constants/images.dart';
import '../custom_image.dart';
import 'bottom_sheet.dart';

Widget buildListTile(
    {required List<PaymentList> paymentListItem,
    required BuildContext context,
    required int type}) {
  return ListTile(
    onTap: () {
      Get.bottomSheet(topupDialog(context,paymentList: paymentListItem,type: type));
    },
    contentPadding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    leading: const CustomImage(path: DefaultImages.appLogo1),
    title: Text(
      paymentListItem.first.name,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
    ),
    trailing: SizedBox(
      width: 50, // Adjust width as needed
      child: type == 1
          ? TextField(
              onChanged: (String value) {},
              decoration: const InputDecoration(
                hintText: '\$0.0',
                border: InputBorder.none,
              ),
            )
          : Text(
              '45554',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
            ),
    ),
  );
}
