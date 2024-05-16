import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 40,
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bem vindo\n',
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '\n Insira seus dados pessoais de sua conta',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            buttonText: 'Login',
                            color: Colors.transparent,
                            onTap: SizedBox(),
                            textColor: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: AuthButton(
                            buttonText: 'Cadastrar',
                            color: Colors.white,
                            onTap: SizedBox(),
                            textColor: Color(0xFF416FDF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Widget onTap;
  final Color color;
  final Color textColor;

  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
