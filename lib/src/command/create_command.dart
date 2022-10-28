import '../impl_io_creator.dart';
import '../structure_creators/directory/impl_directory_creator.dart';
import '../structure_creators/file/impl_file_creator.dart';
import 'i_command.dart';

class CreateCommand implements ICommand {
  final ICommand? nextCommand;

  CreateCommand({this.nextCommand});

  @override
  Future<void> execute() async {
    final directoryCreator = ImplDirectoryCreator();
    final fileCreator = ImplFileCreator(directoryCreator);

    final ioCreator = ImplIoCreator(
      directoryCreator: directoryCreator,
      fileCreator: fileCreator,
    );

    await nextCommand?.execute();

    return ioCreator.create();
  }
}
