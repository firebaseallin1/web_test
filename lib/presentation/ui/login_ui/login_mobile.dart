import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/consts.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utilities/snackbar_helper.dart';
import '../../bloc/login_bloc/login_export.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_input_text_field.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile(
      {super.key, required this.userName, required this.password});

  final userName;
  final password;


  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginLoadedState) {
          isLoading = false;
        } else if (state is VerificationError) {
          print(state.errorMessage);
        } else if (state is LoginError) {
          print('error login');
          SnackbarHelper.showSnackbar(context, state.message, isError: true);
        }else if (state is LoginSuccess) {
          print('error login${state.list.first.userType}');
          Navigator.pushNamedAndRemoveUntil(context, Routes.adminDashboard, (Route<dynamic> route) => false);

        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.grey,
            image: DecorationImage(
                image: AssetImage(AssetConst.logBgImage), fit: BoxFit.fill)

        ),
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: 300,
          margin: const EdgeInsets.symmetric(horizontal: 45),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            // color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(child: Text(StringValues.login)),
                      const Spacer(),
                      Text(StringValues.txt_loginUserID),
                      SizedBox(
                        height: StringValues.inputTextSizedHeight,
                        child: CustomTextField(
                          controller: widget.userName,
                          hintText: StringValues.loginUserID,
                        ),
                      ),
                      const Spacer(),
                      Text(StringValues.txt_LoginPassword),
                      SizedBox(
                        height: StringValues.inputTextSizedHeight,
                        child: CustomTextField(
                          controller: widget.password,
                          hintText: StringValues.loginPassword,
                        ),
                      ),
                      //  const   Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                              child: Text(StringValues.forgetPassword))
                        ],
                      ),
                      const Spacer(),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return CustomButton(text: StringValues.login,
                            onPressed: () {
                              print('triggered');
                              context.read<LoginBloc>().add(OnVerificationEvent(
                                userName: widget.userName.text.toString(),
                                password: widget.password.text.toString(),
                              ));
                            },
                            isLoading: isLoading,);
                        },
                      ),
                      const Spacer(),

                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
