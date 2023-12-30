import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  bool passwordVisible = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String t = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 220,
                    width: double.maxFinite,
                    child: Center(
                      child: Theme(
                        data: ThemeData(
                            iconTheme: IconThemeData(
                                size: 200, color: Theme.of(context).primaryColor)),
                        child: const Icon(
                          Icons.account_circle_rounded,
                        ),
                      ),
                    ),
                  ),
                  Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.phone_iphone_rounded,
                                size: 30,
                              ),
                              prefixIcon: Icon(
                                Icons.alternate_email,
                                size: 30,
                              ),
                              labelText: " Email or Phone number ",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: passwordVisible,
                            style: Theme.of(context).textTheme.bodyMedium,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                labelText: "password",
                                hintText: "password",
                                prefixIcon: const Icon(
                                  Icons.password,
                                  size: 30,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget my password",
                              ),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                t = emailController.text;
                              });
                            },
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor, width: 5)),
                            padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            child: const Text("Sign in"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create account",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed("signup");
                                    },
                                    child: const Text(
                                      " Sign up",
                                    ))
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
