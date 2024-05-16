import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = Modular.get<HomeCubit>();
  @override
  void initState() {
    homeCubit.getPerson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Informações do usario',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
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
                (state is HomeInitial || state is HomeLoading)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 200,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        (state as HomeLoaded).person.photo,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    InformationUserWidget(
                                      information: 'Nome: ',
                                      data: (state).person.name,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InformationUserWidget(
                                      information: 'E-mail: ',
                                      data: (state).person.email,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InformationUserWidget(
                                        information: 'Aniversario: ',
                                        data: DateFormat("yyyy-MM-dd")
                                            .parse(state.person.birthday.substring(0, 10))
                                            .toString() // state.person.birthday //DateFormat("dd' 'MMMM", 'pt_BR').format(DateTime(int.tryParse())),
                                        ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}

class InformationUserWidget extends StatelessWidget {
  final String information;
  final String data;

  const InformationUserWidget({
    super.key,
    required this.information,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          information,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
