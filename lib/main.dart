import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/core/configurations/hive/hive_initialization.dart';
import 'app/modules/root_module.dart';
import 'app/modules/root_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  hiveInitialization(
    onInitialize: () {
      runApp(
        ModularApp(
          module: RootMoodule(),
          child: const RootWidgetModule(),
        ),
      );
    },
  );
}
