import 'package:dchat/command/command_base.dart';

// TODO is there a way to have this as default command
class PromptCommand extends CommandBase {
  @override
  final name = "prompt";
  @override
  final description = "Start a prompt with AI";

  PromptCommand() {
    argParser.addFlag('continue',
        abbr: 'c', negatable: false);
  }

  @override
  void verifyInputs() {
    // if (!isConfigurationValid()) {
    //   throw InvalidInputError("Option 'xxx' is mandatory");
    // }
  }

  @override
  Future<int> runCommand() async {
    print("TODO start prompt with AI");
    return 0;
  }
}
