import 'package:assignment/commons/textstyle.dart';
import 'package:assignment/routes/rouenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final PasswordDisplayController controller = Get.put(PasswordDisplayController());

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(width: double.infinity, child:  ElevatedButton(
        onPressed: () {
      Get.offNamed(AppRouteNams.homeScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 55, 94, 151), 
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
          textStyle: const TextStyle(fontSize: 18), 
        ),
        child: const Text('Login' , style: TextStyle(color: Colors.white),),
            ),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  height: 300,
                  child: Image.asset("assets/Sign-in.png"),
                ),
                const Center(
                  child: Text(
                    "Login",
                    style: CustomTextStyle.headline
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "Please Log in to your Account",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: const Color.fromARGB(255, 48, 51, 68),
                          wordSpacing: 0,
                          letterSpacing: 0,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Address',
                      border: const OutlineInputBorder(),
                      filled: true,
                      suffixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Obx(
      () => TextFormField(
        obscureText: controller.isObscure.value,
        decoration: InputDecoration(
          hintText: 'Password',
          border: const OutlineInputBorder(),
          filled: true,
          suffixIcon: IconButton(
            icon: Icon(
              controller.isObscure.value 
                ? Icons.visibility_off_rounded
                : Icons.remove_red_eye_rounded ,
                
              color: Colors.grey,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
          fillColor: const Color.fromARGB(255, 255, 255, 255),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                          Get.toNamed(AppRouteNams.verifyScreen);
                    }, child: Text(
                      "Forgot Password?",
                      style: CustomTextStyle.headline2.copyWith(color: Colors.blue.shade800)
                          
                    ),),
                  ],
                ),
               
              ],
            ),
            
          
          ),
          
        ),
      ),
    );
  }
}



class PasswordDisplayController extends GetxController {
  var isObscure = true.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }
}
