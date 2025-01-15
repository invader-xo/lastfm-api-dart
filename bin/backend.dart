import 'package:backend/backend.dart' as backend;

void main(List<String> arguments) async {
  await backend.start(
    '0.0.0.0',
    8080,
    1,
    '/api',
  );
}
