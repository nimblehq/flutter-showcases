import 'dart:io';

import 'package:mason/mason.dart';

import 'permission_handler_bundle.dart';

void run(HookContext context) async {
  if (context.vars['shouldAddPermissionHandler'] == true) {
    await generatePermissionHandler(context.vars['project_name']);
  }
}

Future<void> generatePermissionHandler(String projectName) async {
  final generator = await MasonGenerator.fromBundle(permissionHandlerBundle);
  await generator.generate(DirectoryGeneratorTarget(Directory.current),
      vars: {'projectName': projectName});
}
