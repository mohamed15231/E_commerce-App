import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/rigister_screen/cubit/register_cubit.dart';
import 'package:shop_app/modules/rigister_screen/cubit/register_states.dart';

import '../../../layout/shop_app_layout/shop_app_home.dart';
import '../../../shared/component/constant.dart';
import '../../../shared/component/shared widget.dart';
import '../../../shared/network/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var formRegisterKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => RegisterShopCubit(),
      child: BlocConsumer<RegisterShopCubit,RegisterShopStates>(
        listener: (context, state) {
      if(state is SuccessRegisterShopStates) {
        if (RegisterShopCubit
            .get(context)
            .loginModel!
            .status!) {
          showMessage(
              msg: RegisterShopCubit
                  .get(context)
                  .loginModel!
                  .message!,
              state: ToastState.success
          );
          CacheHelper.setData(value: RegisterShopCubit
              .get(context)
              .loginModel!
              .data!
              .token, key: tokenCache);
          token = RegisterShopCubit
              .get(context)
              .loginModel!
              .data!
              .token;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ShopAppHome(),));
        } else {
          showMessage(
              msg: RegisterShopCubit
                  .get(context)
                  .loginModel!
                  .message!,
              state: ToastState.error
          );
        }
      }
        },


        builder: (context,state) {
          var cubit = RegisterShopCubit.get(context);

          return Scaffold(
            appBar: AppBar(

            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formRegisterKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "REGISTER",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Register now to browse our hot offers ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                          ),
                          SizedBox(height: 30),
                          defaultTextFormField(
                            label: 'Name',
                            prefix: Icons.email_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name mustn't be empty";
                              }
                              return null;
                            },
                            Controller: nameController,
                            inputType: TextInputType.name,
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
                          defaultTextFormField(
                            label: 'Phone',
                            prefix: Icons.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone mustn't be empty";
                              }
                              return null;
                            },
                            Controller: phoneController,
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(height: 30),

                          if (state is LoadingRegisterShopStates) ...{
                            Center(child: CircularProgressIndicator()),
                          } else ...{
                            defaultElevatedButton(
                              text: "Register",
                              onPressed: () {
                                if (formRegisterKey.currentState!.validate()) {
                                  cubit.loginData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                            ),
                          },


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
