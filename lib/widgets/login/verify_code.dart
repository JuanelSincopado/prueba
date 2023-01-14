import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba/widgets/home/home_view.dart';
import 'package:prueba/widgets/login/local_widgets/CustomInputContainer.dart';
import 'package:prueba/widgets/login/local_widgets/button.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key, required this.verificationId});

  final String verificationId;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar código'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomInputContainer(
                controller: controller,
                text: 'Verificar codigo',
                obscureText: false,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 50),
              Button(
                formKey: formKey,
                function: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;

                  final credential = PhoneAuthProvider.credential(
                      verificationId: verificationId, smsCode: controller.text);

                  try {
                    await auth.signInWithCredential(credential);

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeView()),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                text: 'Verificar código',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
