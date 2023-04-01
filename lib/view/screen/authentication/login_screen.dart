import 'dart:developer';

import 'package:simple_bank/utils/assets.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/authentication/signup_screen.dart';
import 'package:simple_bank/view/home.dart';
import 'package:simple_bank/view/widget/button_widget.dart';
import 'package:simple_bank/view/widget/textfield_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode userIdFn = FocusNode();
  FocusNode passwordFn = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool obscureText = true;

  _changeLoading(bool loading) {
    isLoading = loading;
    _notify();
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    passwordFn.unfocus();
    userIdController.clear();
    passwordController.clear();
    userIdFn.unfocus();
    super.dispose();
  }

  void gotoHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }

  void gotoSignUpPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                gotoHomeScreen();
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: size16,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
        children: [
          const DMWidget(textAlign: TextAlign.center),
          const SizedBox(height: 30),
          Column(
            children: [
              Image.asset(
                iLogIn,
                width: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Log In',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 16,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormWidget(
                  controller: userIdController,
                  focusNode: userIdFn,
                  label: 'Enter UCC : 78***65',
                  prefixIcon: Icons.person,
                  validator: (val) {
                    log(val.toString());
                    if (val == null || val == '') {
                      return 'Enter the UCC Id';
                    }
                    return null;
                  },
                  onChanged: (val) {},
                ),
                const SizedBox(height: 20),
                TextFormWidget(
                  maxLines: 1,
                  controller: passwordController,
                  focusNode: passwordFn,
                  label: 'Enter Password : 83r5^_58',
                  prefixIcon: Icons.lock,
                  suffixIcon:
                      obscureText ? Icons.visibility : Icons.visibility_off,
                  obscureText: obscureText,
                  onSuffixIxonTap: () {
                    obscureText = !obscureText;
                    _notify();
                  },
                  validator: (val) {
                    if (val == null || val == '') {
                      return 'Enter the Password';
                    } else if (val.length < 8) {
                      return 'Enter the Eight-Digit Password';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    log(val);
                    _notify();
                  },
                ),
                ButtonWidget(
                  text: 'Log In',
                  onTap: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      // loginApiCall();
                    }
                  },
                ),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    gotoSignUpPage();
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontSize: size16,
                            color: kBlueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
