import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

typedef InitFn = void Function();

Future<void> hiveInitialization({required InitFn onInitialize}) async {
  final applicationDocumentsDirectory = await path.getApplicationDocumentsDirectory();

  Hive.init(applicationDocumentsDirectory.path);

  onInitialize();
}
