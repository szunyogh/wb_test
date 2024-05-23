import 'package:bookstore/src/logic/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginLogic);
    final logic = ref.read(loginLogic.notifier);

    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Card(
            elevation: 0,
            child: Container(
              constraints: BoxConstraints.loose(const Size(600, 600)),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sign in', style: Theme.of(context).textTheme.headlineMedium),
                  TextField(
                    decoration: InputDecoration(
                      errorText: state.emailErrorText,
                      hintText: 'E-mail cím',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.alternate_email,
                          size: 20,
                          color: Colors.grey.withOpacity(0.93),
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      logic.setEmailValidation(val);
                    },
                    controller: email,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Jelszó',
                      errorText: state.passwordErrorText,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          onTap: () => logic.change((state) => state.copyWith(showPassword: !state.showPassword)),
                          child: Icon(
                            !state.showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            size: 20,
                            color: Colors.grey.withOpacity(0.93),
                          ),
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      logic.setPasswordValidation(val);
                    },
                    obscureText: !state.showPassword,
                    controller: password,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(15, 10, 15, 10)),
                      ),
                      onPressed: () async => logic.login(email.text, password.text),
                      child: const Text('Sign in'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
