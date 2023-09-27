import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dchat/command/prompt_command.dart';

Future<void> main(List<String> args) async {
  final runner = CommandRunner("dchat", "Command line AI chat")
    ..addCommand(PromptCommand())
    ..argParser.addFlag('verbose', abbr: 'v', help: 'increase logging');

  try {
    final result = await runner.run(args);

    if (result is int) {
      exitCode = result;
    } else {
      exitCode = 0;
    }
  } catch (e, stacktrace) {
    // TODO with verbose flag print stacktrace
    print(e);
    print(stacktrace);
    exitCode = 1;
  }
}
