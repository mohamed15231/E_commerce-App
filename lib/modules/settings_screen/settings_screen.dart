import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/shop_cubit.dart';
import 'package:shop_app/layout/cubit/shop_states.dart';

import '../../shared/component/constant.dart';
import '../../shared/component/shared widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocConsumer<ShopAppCubit, ShopAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopAppCubit.get(context);

        return ConditionalBuilder(
          condition:
              cubit.getProfile != null && state is! LoadingUpdateSettingsScreen,
          fallback: (context) => Center(child: CircularProgressIndicator()),
          builder: (context) {
            nameController.text = cubit.getProfile!.data!.name!;
            emailController.text = cubit.getProfile!.data!.email!;
            phoneController.text = cubit.getProfile!.data!.phone!;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultTextFormField(
                      label: 'Name',
                      Controller: nameController,
                      prefix: Icons.account_box_outlined,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 20),
                    defaultTextFormField(
                      label: 'email',
                      Controller: emailController,
                      prefix: Icons.email_outlined,
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),

                    defaultTextFormField(
                      label: 'Name',
                      Controller: phoneController,
                      prefix: Icons.phone,
                      inputType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),

                    defaultElevatedButton(
                      onPressed: () {
                        logout(context: context);
                      },
                      text: "LogOut",
                    ),

                    SizedBox(height: 20),

                    defaultElevatedButton(
                      onPressed: () {
                        cubit.updateProfile(
                          name: nameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                      },
                      text: "Update",
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
