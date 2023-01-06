import 'dart:io';
import 'package:io_flutter_cli/src/file_content/base_api_services_content.dart';

import '../i_creators.dart';

class ImplFileCreator implements IFileCreator {
  final IDirectoryCreator directoryCreator;

  ImplFileCreator(this.directoryCreator);

  @override
  Future<void> createNecessaryFiles() async {
    print('creating necessary files...');

    print('creating files for data dir...');

    await _createFile(
      directoryCreator.dataDir.path,
      'app_exceptions',
    );

    print('creating files for data/network dir...');

    await _createFile(
      '${directoryCreator.dataDir.path}/network',
      'base_api_services',
      content: BaseApiServiceContent.baseApiServiceContent,
    );
    await _createFile(
      '${directoryCreator.dataDir.path}/network',
      'network_api_service',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for data/response dir...');

    await _createFile(
      '${directoryCreator.dataDir.path}/response',
      'api_response',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.dataDir.path}/response',
      'status',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for model dir...');

    await _createFile(
      directoryCreator.modelDir.path,
      'users_model',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for repository dir...');

    await _createFile(
      directoryCreator.repositoryDir.path,
      'auth_repository',
      content: 'abstract class DataConstants {}',
    );

    await _createFile(
      directoryCreator.repositoryDir.path,
      'user_repository',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for repository dir...');

    await _createFile(
      directoryCreator.resourcesDir.path,
      'app_theme',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'app_urls',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'colors',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'keyclock_vars',
      content: 'abstract class DataConstants {}',
    );

    await _createFile(
      directoryCreator.resourcesDir.path,
      'language_locale',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for utils dir...');

    await _createFile(
      directoryCreator.utilsDir.path,
      'constant',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.utilsDir.path,
      'share_preference',
      content: 'abstract class DataConstants {}',
    );

    await _createFile(
      directoryCreator.utilsDir.path,
      'share_singleton',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.utilsDir.path,
      'utils',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for view/screens dir...');

    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'auth_navigator_screen',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'change_language_screen',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'change_theme_screen',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'home_screen',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'splash_screen',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'user_screen',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for view/widgets dir...');

    await _createFile(
      '${directoryCreator.viewDir.path}/widgets',
      'change_language_radio_button',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/widgets',
      'change_theme_toggle_button',
      content: 'abstract class DataConstants {}',
    );

    print('creating files for utils dir...');

    await _createFile(
      directoryCreator.viewModelDir.path,
      'auth_view_model',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'language_view_model',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'theme_view_model',
      content: 'abstract class DataConstants {}',
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'user_view_model',
      content: 'abstract class DataConstants {}',
    );
    // ======================

    print('creating files for localization l10n...');

    await _createFile(
      directoryCreator.l10nDir.path,
      'app_en',
      content:
          '{\n  "hello": "Hello {username}",\n    "@hello":\n     {\n       "description": "A welcome message",\n       "placeholders":\n       {\n         "username":\n               {\n             "type":"String"\n         }\n       }\n     }\n   }',
    );
    await _createFile(
      directoryCreator.l10nDir.path,
      'app_ja',
      content: '{"hello":"こんにちは {username}"}',
    );
    await _createFile(
      '',
      'l10n',
      content:
          'arb-dir: lib/l10n\ntemplate-arb-file: app_en.arb\noutput-localization-file: app_localizations.dart',
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
      } else if (basePath == '') {
        file = await File('$fileName.yaml').create();
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
