import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shop_app_layout/shop_app_home.dart';

import 'package:shop_app/style/color.dart';
import 'package:shop_app/shared/component/constant.dart';
import 'package:shop_app/shared/network/cache_helper.dart';

import '../../../shared/component/shared widget.dart';
import '../../rigister_screen/screens/register_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formLogInKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginShopCubit(),
        child: BlocConsumer<LoginShopCubit, LoginShopStates>(
          listener: (context, state) {
            if(state is SuccessLoginShopStates){
              if(LoginShopCubit.get(context).loginModel!.status!){
                showMessage(
                    msg: LoginShopCubit.get(context).loginModel!.message!,
                    state: ToastState.success
                );
                CacheHelper.setData(value: LoginShopCubit.get(context).loginModel!.data!.token, key: tokenCache);
                token=LoginShopCubit.get(context).loginModel!.data!.token;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopAppHome(),));

              }else{


                showMessage(
                  msg: LoginShopCubit.get(context).loginModel!.message!,
                  state: ToastState.error
                );

              }
            }

          },
          builder: (context, state) {
            var cubit = LoginShopCubit.get(context);
            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formLogInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LOGIN",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Login now to browse our hot offers ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                          ),
                          SizedBox(height: 30),
                          defaultTextFormField(
                            label: 'Email',
                            prefix: Icons.email_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email mustn't be empty";
                              }
                              return null;
                            },
                            Controller: emailController,
                            inputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 30),

                          defaultTextFormField(
                            label: 'Password',
                            prefix: Icons.lock_open_outlined,
                            submitted: (value) {
                              if (formLogInKey.currentState!.validate()) {
                                cubit.loginData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Password is too short";
                              }
                              return null;
                            },
                            Controller: passwordController,
                            isPassword: !cubit.isShow,
                            inputType: TextInputType.visiblePassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                cubit.changeShowPassword();
                              },
                              icon: Icon(cubit.icon),
                            ),
                          ),
                          SizedBox(height: 30),

                          if (state is LoadingLoginShopStates) ...{
                            Center(child: CircularProgressIndicator()),
                          } else ...{
                            defaultElevatedButton(
                              text: "Login",
                              onPressed: () {
                                if (formLogInKey.currentState!.validate()) {
                                  cubit.loginData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            ),
                          },

                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              defaultTextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                                text: "Register",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
