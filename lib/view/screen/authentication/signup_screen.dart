import 'dart:developer';

import 'package:simple_bank/utils/assets.dart';
import 'package:simple_bank/utils/import.dart';
import 'package:simple_bank/view/screen/bnb/home.dart';
import 'package:simple_bank/view/widget/button_widget.dart';
import 'package:simple_bank/view/widget/textfield_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode mobileNumberFn = FocusNode();
  FocusNode emailFn = FocusNode();
  FocusNode passwordFn = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isTermOfUse = false;
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
    mobileNumberController.clear();
    passwordController.clear();
    mobileNumberFn.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: kToolbarHeight + 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Digital",
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                      children: [
                        TextSpan(
                          text: "Money",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    iSignUP,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
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
                          controller: mobileNumberController,
                          focusNode: mobileNumberFn,
                          label: 'Enter Mobile Number',
                          prefixIcon: Icons.smartphone_rounded,
                          validator: (val) {
                            log(val.toString());
                            if (val == null || val == '') {
                              return 'Enter the mobile number';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            log(val);
                            _notify();
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormWidget(
                          controller: emailController,
                          focusNode: emailFn,
                          label: 'Enter email ',
                          prefixIcon: Icons.email,
                          onChanged: (val) {
                            log(val);
                            _notify();
                          },
                          validator: (val) {
                            log(val.toString());
                            if (val == null || val == '') {
                              return 'Enter the email';
                            } else if (!val.contains('@')) {
                              return 'Enter valid the email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormWidget(
                          controller: passwordController,
                          focusNode: passwordFn,
                          label: 'Create Password',
                          prefixIcon: Icons.lock,
                          suffixIcon: obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: obscureText,
                          onSuffixIxonTap: () {
                            obscureText = !obscureText;
                            _notify();
                          },
                          validator: (val) {
                            if (val == null || val == '') {
                              return 'Create the Password';
                            } else if (val.length < 6) {
                              return 'Create the Six Password';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            log(val);
                            _notify();
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            // gotoHomePage();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                margin: const EdgeInsets.only(right: 8),
                                child: Checkbox(
                                  value: isTermOfUse,
                                  onChanged: (onChanged) {
                                    log(onChanged.toString());
                                    if (onChanged != null) {
                                      isTermOfUse = onChanged;
                                      _notify();
                                    }
                                  },
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: "By procedding, I accept\nDigital",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 12,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: "Money",
                                      style: TextStyle(
                                        fontSize: size12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' T&C ',
                                      style: TextStyle(
                                        fontSize: size12,
                                        color: kBlueColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                    const TextSpan(
                                      text: ' Privacy Policy.',
                                      style: TextStyle(
                                        fontSize: size12,
                                        color: kBlueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        ButtonWidget(
                          text: 'Create Account',
                          onTap: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              // signUpApiCall();
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  gotoHomePage() {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
      (route) => false,
    );
  }
}
