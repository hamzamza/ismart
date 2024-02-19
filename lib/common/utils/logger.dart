import 'package:logging/logging.dart';

final log = Logger('EW');

void setupLogger() {
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}, ${record.time}, '
        'Msg: ${record.message}, '
        '${record.error != null ? 'Error: ${record.error}, ' : ''}'
        '${record.stackTrace != null ? 'StackTrace: ${record.stackTrace}' : ''}');
  });
}
