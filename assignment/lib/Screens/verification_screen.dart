import 'package:assignment/routes/rouenames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(width: double.infinity, child:  ElevatedButton(
        onPressed: () {
          Get.offAllNamed(AppRouteNams.homeScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 55, 94, 151), 
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
          textStyle: const TextStyle(fontSize: 18), 
        ),
        child: const Text('Verify' , style: TextStyle(color: Colors.white),),
            ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: 300, width: double.infinity, child: Image.asset("assets/VerifyOtp.png"), ),
        ) ,  
        const Text("Verify OTP" , style: TextStyle(
                      letterSpacing: 0, 
                      fontFamily: 'FontMain',
                      fontSize: 20, 
                      color: Color.fromARGB(255, 67, 68, 86)
                    ),) , 

                    const Text("A 4 Digit code has been sent to your Number ") , 
                    const SizedBox(height: 10,) , 
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: OTPTextField(
                        length: 4,
                        width: 200 ,
                        
                        fieldWidth: 40, 
                        style: const TextStyle(
                          fontSize: 17
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,                         
                        onCompleted: (pin) {
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
const Text("Do Not Receive OTP ? ") , Text("Resend" , style: TextStyle(fontFamily: 'FontMain' , color: Colors.blue.shade800),)
                    ],)
        ],)),
      ),
    );
  }
}