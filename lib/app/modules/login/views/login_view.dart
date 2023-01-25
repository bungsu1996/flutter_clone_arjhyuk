import 'package:clone_ajheryuk/app/routes/app_pages.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final hidePassword = true.obs;

  login() {
    var email = emailController.value.text;
    var password = passwordController.value.text;
    var validEmail = EmailValidator.validate(email);
    if (!validEmail) {
      return Get.snackbar(
        "",
        "",
        backgroundColor: Colors.red[600],
        isDismissible: true,
        colorText: Colors.white,
        titleText: const Text(
          "ERROR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: const Text(
          "EMAIL_NOT_VALID",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else if (validEmail &&
        email == "hamzah@gmail.com" &&
        password == "hamzah") {
      Get.snackbar(
        "",
        "",
        backgroundColor: Colors.green,
        isDismissible: true,
        colorText: Colors.white,
        titleText: const Text(
          "SUCCESS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: const Text(
          "SIGN IN...",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
      Get.offAllNamed(Routes.HOME);
    } else {
      return Get.snackbar(
        "",
        "",
        backgroundColor: Colors.red[600],
        isDismissible: true,
        colorText: Colors.white,
        titleText: const Text(
          "ERROR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        messageText: const Text(
          "SOMETHING_ERROR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                "assets/logos/mark_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            // FORM INPUT EMAIL
            TextField(
              controller: emailController,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                label: const Text("Email"),
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // FORM INPUT PASSWORD
            Obx(
              () => TextField(
                controller: passwordController,
                onSubmitted: (value) {},
                cursorColor: Colors.grey,
                obscureText: hidePassword.value ? true : false,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  label: const Text("Password"),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      hidePassword.value = !hidePassword.value;
                    },
                    icon: hidePassword.value
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(Icons.visibility, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEC5F5F),
                    padding: const EdgeInsets.symmetric(vertical: 15)),
                child: const Text(
                  "Log In",
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Forgot Password?"),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 1,
                    color: const Color(0xFFC7C9D9),
                  ),
                ),
                const Text(
                  "or",
                  style: TextStyle(color: Color(0xFF8C8C8C)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: 1,
                    color: const Color(0xFFC7C9D9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0082CD),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook),
                    SizedBox(width: 5),
                    Text("Log in with Facebook"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6F7FA),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: const BorderSide(width: 2, color: Color(0xFFEEEEEE))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png"),
                    const SizedBox(width: 5),
                    const Text(
                      "Log in with Google",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
