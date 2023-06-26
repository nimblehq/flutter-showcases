import 'package:mason/mason.dart';

import 'permission_handler_bundle.dart';

void run(HookContext context) async {
  final newVars = {};
  if (context.vars['shouldAddPermissionHandler'] == true) {
    newVars.addAll(await addPermissionHandler());
  }
  context.vars = {...context.vars, ...newVars};
}

Future<Map<String, dynamic>> addPermissionHandler() async {
  Map<String, dynamic> newVars = {};
  final generator = await MasonGenerator.fromBundle(permissionHandlerBundle);
  generator.partials.forEach((filePath, content) {
    if (filePath.startsWith('{{~ _')) {
      final formattedName = filePath
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll('~ ', '')
          .replaceAll('.', '')
          .trim();
      newVars.putIfAbsent(formattedName, () => String.fromCharCodes(content));
    }
  });
  return Future.value(newVars);
}
