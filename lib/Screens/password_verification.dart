import 'package:ai_mhealth_app/Screens/reset_password.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.provider.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_textfield.dart';

class PasswordVerificationScreen extends StatefulWidget {
  static const String routeName = '/verify-password';

  const PasswordVerificationScreen({super.key});

  @override
  State<PasswordVerificationScreen> createState() =>
      _PasswordVerificationScreenState();
}

class _PasswordVerificationScreenState
    extends State<PasswordVerificationScreen> {
  bool showPassword = false;
  late String currentPassword;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final provider = Provider.of<UserData>(context, listen: false);
    currentPassword = provider.userPassword;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: MyAppBar(
          title: "Verify Password",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/verification.png',
                  height: 150,
                  width: 150,
                ),
                RichText(
                  text: TextSpan(
                    text: "Enter Password",
                    style: TextStyle(
                      color: color.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "\n\n\nEnter your Current Password below to verify it is you",
                        style: TextStyle(
                          letterSpacing: 2,
                          color: color.secondary,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                CustomTextField(
                  hintText: "Current Password",
                  controller: controller,
                  contentPadding: const EdgeInsets.all(10),
                  height: 50,
                  width: double.infinity,
                  obscure: showPassword ? false : true,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(
                        () {
                          showPassword = !showPassword;
                        },
                      );
                    },
                    child: showPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  keyboard: TextInputType.emailAddress,
                ),
                const Divider(
                  height: 60,
                  thickness: 0.005,
                ),
                CustomElevatedButton(
                    text: "Confirm and Proceed",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ResetPasswordScreen.routeName,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
