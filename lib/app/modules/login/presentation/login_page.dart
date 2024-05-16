import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/');
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,

        // elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formSignInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Bem-vindo',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF416FDF),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const InputWidget(
                            label: 'E-mail',
                            hint: 'E-mail',
                            isPass: false,
                            validatorText: 'Porfavor insira o seu e-mail',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const InputWidget(
                            label: 'Senha',
                            hint: 'Senha',
                            isPass: true,
                            obscureText: true,
                            validatorText: 'Porfavor insira a sua senha',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberPassword,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberPassword = value!;
                                      });
                                    },
                                    activeColor: const Color(0xFF416FDF),
                                  ),
                                  const Text(
                                    'Lembrar de mim',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                child: const Text(
                                  'Esqueceu a senha?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF416FDF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formSignInKey.currentState!.validate() && rememberPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Processing Data'),
                                    ),
                                  );
                                } else if (!rememberPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please agree to the processing of personal data')),
                                  );
                                }
                              },
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Você não tem conta? ',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF416FDF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.isPass,
    this.obscureText,
    this.validatorText,
  });

  final String label;
  final String hint;
  final bool isPass;
  final String? validatorText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      obscureText: isPass ? obscureText! : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        label: Text(label),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
