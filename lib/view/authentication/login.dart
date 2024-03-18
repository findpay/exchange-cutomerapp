// ignore_for_file: avoid_function_literals_in_foreach_calls, library_private_types_in_public_api

import 'package:exchange/blocs/cubit/login_cubit.dart';
import 'package:exchange/widgets/custom_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../config/images.dart';
import '../../config/theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: AppTheme.isLightTheme == false
              ? const Color(0xff15141F)
              : const Color(0xffFFFFFF),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: AppBar().preferredSize.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(Icons.arrow_back),
                const SizedBox(
                  height: 38,
                ),
                const CustomImage(
                  path: DefaultImages.appLogo1,
                  height: 150,
                  width: 200,
                ),
                // Text(
                //   "Hi Welcome Back!",
                //   style: Theme.of(context).textTheme.headline6!.copyWith(
                //         fontWeight: FontWeight.w700,
                //         fontSize: 24,
                //       ),
                // ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sign in to your account",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xffA2A0A8),
                      ),
                ),

                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        CustomTextFormField(
                          focusNode: _focusNodes[0],
                          prefix: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(
                              DefaultImages.phone,
                              color: _focusNodes[0].hasFocus
                                  ? HexColor(AppTheme.primaryColorString!)
                                  : const Color(0xffA2A0A8),
                              // color:  HexColor(AppTheme.secondaryColorString!)
                            ),
                          ),
                          hintText: "Phone Number",
                          inputType: TextInputType.phone,
                          textEditingController: mobileController,
                          capitalization: TextCapitalization.none,
                          limit: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            if (state is LoginStateLoading) {
                              return const CircularProgressIndicator();
                            }
                            return InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                context.read<LoginCubit>().login();
                              },
                              child: customButton(
                                  HexColor(AppTheme.primaryColorString!),
                                  "Login",
                                  HexColor(AppTheme.secondaryColorString!),
                                  context),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
