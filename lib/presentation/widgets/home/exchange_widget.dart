import 'package:exchange/constants/app_constants.dart';
import 'package:exchange/constants/images.dart';
import 'package:exchange/presentation/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeWidget extends StatelessWidget {
  final String label;
  final PaymentList paymentList;
  final VoidCallback onTab;
  const ExchangeWidget(
      {super.key, required this.label, required this.paymentList, required this.onTab});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.bodyText2!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Center(
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              minVerticalPadding: 0,
              leading: const CustomImage(
                path: DefaultImages.appLogo1,
                width: 30,
                height: 30,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onTab,
                    child: Row(
                      children: [
                        Text(
                          paymentList.name.isNotEmpty ? paymentList.name  : 'select account',
                          style: theme.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      style: theme.copyWith(fontWeight: FontWeight.w700),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '\$0.0',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "USD",
                style: theme.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
