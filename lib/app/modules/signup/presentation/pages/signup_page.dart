import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/widgets/input_widget.dart';
import '../../domain/entites/user_entity.dart';
import '../cubit/signup_cubit.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  final signupCubit = Modular.get<SignupCubit>();

  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => signupCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Modular.to.navigate('/');
            },
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
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
            BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                if (state is SignupStored) {
                  Modular.to.navigate('/home');
                }

                if (state is SignupLoading) {
                  print('CARREGANDO');
                }

                return Column(
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
                            key: _formSignupKey,
                            child: Column(
                              children: [
                                const Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF416FDF),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                InputWidget(
                                  controller: _nameTextEditingController,
                                  label: 'Nome Completo',
                                  hint: 'Nome Completo',
                                  isPass: false,
                                  validatorText: 'Porfavor insira o seu nome completo',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                InputWidget(
                                  controller: _emailTextEditingController,
                                  label: 'E-mail',
                                  hint: 'E-mail',
                                  isPass: false,
                                  validatorText: 'Porfavor insira o seu e-mail',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                InputWidget(
                                  controller: _passTextEditingController,
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
                                  children: [
                                    Checkbox(
                                        value: agreePersonalData,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            agreePersonalData = value!;
                                          });
                                        },
                                        activeColor: const Color(0xFF416FDF)),
                                    const Text(
                                      'Eu li e concordo com os ',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                    const Text(
                                      'termos de uso',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF416FDF),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formSignupKey.currentState!.validate() && agreePersonalData) {
                                        var user = UserEntity(
                                          name: _nameTextEditingController.text,
                                          email: _emailTextEditingController.text,
                                          pass: _passTextEditingController.text,
                                        );
                                        await signupCubit.storeUser(user);
                                      } else if (!agreePersonalData) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Porfavor concorde com os termos de uso!')),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Cadastrar',
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
                                      'Você já tem conta? ',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Modular.to.navigate('/login');
                                      },
                                      child: const Text(
                                        'Login',
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
