import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/modules/login/domain/entites/user_entity.dart';
import 'package:login_page_flutter/app/modules/login/presentation/cubit/login_cubit.dart';

import '../../../../core/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  final loginCubit = Modular.get<LoginCubit>();

  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit,
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
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
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
                                    onPressed: () async {
                                      if (_formSignInKey.currentState!.validate()) {
                                        var user = UserEntity(
                                          email: _emailTextEditingController.text,
                                          pass: _passTextEditingController.text,
                                        );
                                        await loginCubit.login(user);
                                        if (state is LoginLoaded) {
                                          if (state.isAuth) {
                                            print('DEU BOM');
                                          } else {
                                            print('DEU RUIM');
                                          }
                                        } else {
                                          print('DEU ERRO');
                                        }
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
                                      onTap: () {
                                        Modular.to.navigate('/signup');
                                      },
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
