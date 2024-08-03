import 'package:auto_route/auto_route.dart';
import 'package:dhood_app/di/get_it.dart';
import 'package:dhood_app/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:dhood_app/presentation/cubit/farmer_login_cubit/farmer_login_cubit.dart';
import 'package:dhood_app/presentation/cubit/farmer_login_cubit/farmer_login_state.dart';
import 'package:dhood_app/presentation/routes/app_route.dart';
import 'package:dhood_app/presentation/screen/widget/custom_button.dart';
import 'package:dhood_app/presentation/screen/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FarmerLoginScreen extends StatelessWidget implements AutoRouteWrapper {
  FarmerLoginScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 94,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Expanded(
                  flex: 30,
                  child: Icon(
                    Icons.lock,
                    size: 100,
                  ),
                ),
                // welcome back, you've been missed!
                Expanded(
                  flex: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login for Farmer',
                            style: TextStyle(
                              color: appTheme.colorScheme.onSecondary,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextfield(
                              controller: usernameController,
                              hintText: 'User Id',
                              obscureText: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextfield(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: appTheme.colorScheme.onSecondary),
                              ),
                            ),
                          ],
                        ),
                        BlocConsumer<FarmerLoginCubit, FarmerLoginState>(
                          listener: (context, state) async {
                            if (state is FarmerLoginError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    state.message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if (state is FarmerLoginSuccrss) {
                              await context
                                  .read<AuthCubit>()
                                  .loginFarmer(farmerInfo: state.farmerInfo);
                              context.router
                                  .replaceAll([const FarmerDashboardRoute()]);
                            }
                          },
                          builder: (context, state) {
                            if (state is FarmerLoginLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return CustomButton(
                                onTap: () {
                                  context.read<FarmerLoginCubit>().farmerlogin(
                                      id: usernameController.text,
                                      password: passwordController.text);
                                },
                              );
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: appTheme.colorScheme.onSecondary,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(
                                    color: appTheme.colorScheme.onSecondary),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: appTheme.colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                        // google + apple sign in buttons
                        // const Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     // google button
                        //     SquareTile(imagePath: 'assets/icons/google.png'),
                        //     SizedBox(width: 25),
                        //     // apple button
                        //     SquareTile(imagePath: 'assets/icons/apple.png')
                        //   ],
                        // ),
                        const SizedBox(height: 90,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Not a member?',
            //       style: TextStyle(color: appTheme.colorScheme.onSecondary),
            //     ),
            //     const SizedBox(width: 4),
            //     const Text(
            //       'Register now',
            //       style: TextStyle(
            //         color: Colors.blue,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
          )
        ],
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FarmerLoginCubit>(),
      child: this,
    );
  }
}
