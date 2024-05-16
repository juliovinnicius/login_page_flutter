import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_page_flutter/app/modules/root_widget.dart';

import 'app/core/configurations/hive/hive_initialization.dart';
import 'app/modules/root_module.dart';

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
