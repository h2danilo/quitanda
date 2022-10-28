import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';

import '../../config/custom_colors.dart';
import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nome do app
                  Text.rich(
                    TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Valim',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "Quitanda",
                            style: TextStyle(
                              color: CustomColors.customConstrastColor,
                            ),
                          )
                        ]),
                  ),

                  // Categorias
                  SizedBox(
                    height: 35,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText("Frutas"),
                          FadeAnimatedText("Verduras"),
                          FadeAnimatedText("Legumes"),
                          FadeAnimatedText("Carnes"),
                          FadeAnimatedText("Cereais"),
                          FadeAnimatedText("Laticioneos"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Formulario
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Email
                  const CustomTextField(icon: Icons.email, label: "Email"),

                  //Senha
                  const CustomTextField(
                    icon: Icons.lock,
                    label: "Senha",
                    isSecret: true,
                  ),

                  //Botão de Entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (c) {
                            return const BaseScreen();
                          }),
                        );
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  //Esqueceu a senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueci minha Senha',
                        style:
                            TextStyle(color: CustomColors.customConstrastColor),
                      ),
                    ),
                  ),

                  //Divisor
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(80),
                            thickness: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("Ou"),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(80),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Botão criar conta
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side:
                              const BorderSide(color: Colors.green, width: 2)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (c) {
                            return SignUpScreen();
                          }),
                        );
                      },
                      child: const Text(
                        "Criar Conta",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
