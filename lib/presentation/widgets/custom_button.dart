import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

Widget customButton({
  Color? bgClr,
  required String text,
  Color? txtClr,
  required BuildContext context,
  Widget? child,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: child == null ? onTap : null,
    child: Container(
      height: 56,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgClr ?? HexColor(AppTheme.primaryColorString!),
      ),
      child: child ??
          Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: txtClr ?? HexColor(AppTheme.secondaryColorString!),
                  ),
            ),
          ),
    ),
  );
}
