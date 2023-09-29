import 'package:dchat/command/command_base.dart';
import 'package:dchat/configuration/configuration_file.dart';

import '../chatgpt/chatgpt_request.dart';

class ModelsCommand extends CommandBase {
  @override
  final name = 'models';
  @override
  final description = 'List available models';

  ModelsCommand() {
    // argParser.addFlag('continue', abbr: 'c', negatable: false);
  }

  @override
  void verifyInputs() {
    // if (!isConfigurationValid()) {
    //   throw InvalidInputError("Option 'xxx' is mandatory");
    // }
  }

  @override
  Future<int> runCommand() async {
    print("Reading available models from ChatGPT");

    final reader = ConfigurationFileReader();
    final config = await reader.read();
    print("DEBUG: Configuration file read");

    await requestModels(config);
    return 0;
  }
}
