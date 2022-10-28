import 'dart:io';

import '../i_creators.dart';

class ImplFileCreator implements IFileCreator {
  final IDirectoryCreator directoryCreator;

  ImplFileCreator(this.directoryCreator);

  @override
  Future<void> createNecessaryFiles() async {
    print('creating necessary files...');

    await _createFile(
      '${directoryCreator.blocDir.path}/core',
      'bloc_observer',
    );

    await _createFile(
      '${directoryCreator.dataDir.path}/core',
      'constants',
      content: 'abstract class DataConstants {}',
    );

    await _createFile(
      '${directoryCreator.uiDir.path}/core',
      'constants',
      content: 'abstract class UIConstants {}',
    );

    await _createFile(
      '${directoryCreator.uiDir.path}/core',
      'app',
    );

    await _createFile(
      '${directoryCreator.uiDir.path}/core',
      'app_router',
      content: 'abstract class AppRouter {}',
    );

    await _createFile(
      'lib',
      'configurations',
      content: 'abstract class Configurations {}',
    );
    await _createFile(
      directoryCreator.l10nDir.path,
      'app_en',
      content:
          '{   "hello": "Hello {username}","@hello":{"description": "A welcome message","placeholders":{"username":{"type":"String"}}}}',
    );
    await _createFile(
      directoryCreator.l10nDir.path,
      'app_ja',
      content: '{"hello":"こんにちは {username}"}',
    );
  }

  Future<void> _createFile(
    String basePath,
    String fileName, {
    String? content,
  }) async {
    try {
      final File file;
      if (basePath == directoryCreator.l10nDir.path) {
        file = await File('$basePath/$fileName.arb').create();
      } else {
        file = await File('$basePath/$fileName.dart').create();
      }

      if (content != null) {
        final writer = file.openWrite();
        writer.write(content);
        writer.close();
      }
    } catch (_) {
      stderr.write('creating $fileName.dart failed!');
      exit(2);
    }
  }
}
