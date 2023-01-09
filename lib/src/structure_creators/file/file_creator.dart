import 'dart:io';
import 'package:io_flutter_cli/src/file_content/app_main.dart';
import 'package:io_flutter_cli/src/file_content/assets/login.dart';
import 'package:io_flutter_cli/src/file_content/data/api_response.dart';
import 'package:io_flutter_cli/src/file_content/data/app_exceptions.dart';
import 'package:io_flutter_cli/src/file_content/repository/auth_repository.dart';
import 'package:io_flutter_cli/src/file_content/data/base_api_services_content.dart';
import 'package:io_flutter_cli/src/file_content/data/network_api_service.dart';
import 'package:io_flutter_cli/src/file_content/resourse/app_theme.dart';
import 'package:io_flutter_cli/src/file_content/resourse/app_urls.dart';
import 'package:io_flutter_cli/src/file_content/resourse/colors.dart';
import 'package:io_flutter_cli/src/file_content/resourse/keyclock_vars.dart';
import 'package:io_flutter_cli/src/file_content/resourse/app_language.dart';
import 'package:io_flutter_cli/src/file_content/resourse/language_strings.dart';
import 'package:io_flutter_cli/src/file_content/resourse/primary_lang_strings.dart';
import 'package:io_flutter_cli/src/file_content/resourse/secondary_lang_strings.dart';
import 'package:io_flutter_cli/src/file_content/screens/auth_screen.dart';
import 'package:io_flutter_cli/src/file_content/utils/constant.dart';
import 'package:io_flutter_cli/src/file_content/utils/share_preference.dart';
import 'package:io_flutter_cli/src/file_content/utils/share_singleton.dart';
import 'package:io_flutter_cli/src/file_content/utils/status.dart';
import 'package:io_flutter_cli/src/file_content/repository/user_repository.dart';
import 'package:io_flutter_cli/src/file_content/model/users_model.dart';
import 'package:io_flutter_cli/src/file_content/utils/utils.dart';
import 'package:io_flutter_cli/src/file_content/screens/auth_navigator_screen.dart';
import 'package:io_flutter_cli/src/file_content/screens/change_language_screen.dart';
import 'package:io_flutter_cli/src/file_content/screens/change_theme_screen.dart';
import 'package:io_flutter_cli/src/file_content/screens/home_screen.dart';
import 'package:io_flutter_cli/src/file_content/screens/splash_screen.dart';
import 'package:io_flutter_cli/src/file_content/screens/user_screen.dart';
import 'package:io_flutter_cli/src/file_content/view_model/auth_view_model.dart';
import 'package:io_flutter_cli/src/file_content/view_model/language_view_model.dart';
import 'package:io_flutter_cli/src/file_content/view_model/theme_view_model.dart';
import 'package:io_flutter_cli/src/file_content/view_model/user_view_model.dart';
import 'package:io_flutter_cli/src/file_content/widgets/change_language_radio_button.dart';
import 'package:io_flutter_cli/src/file_content/widgets/change_theme_toggle_button.dart';

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
      content: AppExceptionsContent.appExceptionsContent,
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
      content: NetworkApiServiceContent.networkApiServiceContent,
    );

    print('creating files for data/response dir...');

    await _createFile(
      '${directoryCreator.dataDir.path}/response',
      'api_response',
      content: ApiResponseContent.apiResponseContent,
    );
    await _createFile(
      '${directoryCreator.dataDir.path}/response',
      'status',
      content: StatusContent.statusContent,
    );

    print('creating files for model dir...');

    await _createFile(
      directoryCreator.modelDir.path,
      'users_model',
      content: UserModelContent.userModelContent,
    );

    print('creating files for repository dir...');

    await _createFile(
      directoryCreator.repositoryDir.path,
      'auth_repository',
      content: AuthRepositoryContent.authRepositoryContent,
    );

    await _createFile(
      directoryCreator.repositoryDir.path,
      'user_repository',
      content: UserRepositoryContent.userRepositoryContent,
    );

    print('creating files for repository dir...');

    await _createFile(
      directoryCreator.resourcesDir.path,
      'app_theme',
      content: AppThemeContent.appThemeContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'app_urls',
      content: AppUrlsContent.appUrlsContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'colors',
      content: ColorsContent.colorsContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'keyclock_vars',
      content: KeyclockVarsContent.keyclockVarsContent,
    );

    await _createFile(
      directoryCreator.resourcesDir.path,
      'app_language',
      content: AppLanguageContent.appLanguageContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'language_strings',
      content: LanguageStringsContent.languageStringsContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'primary_lang_strings',
      content: PrimaryLangStringsContent.primaryLangStringsContent,
    );
    await _createFile(
      directoryCreator.resourcesDir.path,
      'secondary_lang_strings',
      content: SecondaryLangStringsContent.secondaryLangStringsContent,
    );

    print('creating files for utils dir...');

    await _createFile(
      directoryCreator.utilsDir.path,
      'constant',
      content: ConstantContent.constantContent,
    );

    await _createFile(
      directoryCreator.utilsDir.path,
      'share_preference',
      content: SharePreferenceContent.sharePreferenceContent,
    );

    await _createFile(
      directoryCreator.utilsDir.path,
      'share_singleton',
      content: ShareSingletonContent.shareSingletonContent,
    );
    await _createFile(
      directoryCreator.utilsDir.path,
      'utils',
      content: UtilsContent.utilsContent,
    );

    print('creating files for view/screens dir...');

    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'auth_navigator_screen',
      content: AuthNavigatorScreenContent.authNavigatorScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'change_language_screen',
      content: ChangeLanguageScreenContent.changeLanguageScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'change_theme_screen',
      content: ChangeThemeScreenContent.changeThemeScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'home_screen',
      content: HomeScreenContent.homeScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'splash_screen',
      content: SplashScreenContent.splashScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'user_screen',
      content: UserScreenContent.userScreenContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/screens',
      'auth_screen',
      content: AuthScreenContent.authScreenContent,
    );

    print('creating files for view/widgets dir...');

    await _createFile(
      '${directoryCreator.viewDir.path}/widgets',
      'change_language_radio_button',
      content: ChangeLangRadioBtnContent.changeLangRadioBtnContent,
    );
    await _createFile(
      '${directoryCreator.viewDir.path}/widgets',
      'change_theme_toggle_button',
      content: ChangeThemeToggleBtnContent.changeThemeToggleBtnContent,
    );

    print('creating files for utils dir...');

    await _createFile(
      directoryCreator.viewModelDir.path,
      'auth_view_model',
      content: AuthViewModelContent.authViewModelContent,
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'language_view_model',
      content: LanguageViewModelContent.languageViewModelContent,
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'theme_view_model',
      content: ThemeViewModelContent.themeViewModelContent,
    );
    await _createFile(
      directoryCreator.viewModelDir.path,
      'user_view_model',
      content: UserViewModelContent.userViewModelContent,
    );

    await _createFile(
      'html',
      'assets',
      content: LoginHtmlContent.loginHtmlContent,
    );

    // ======================
    //////Create main file
    await _createFile(
      'lib',
      'main',
      content: AppMainContent.appMainContent,
    );
  }

  Future<void> _createFile(
    String basePath,
    String fileName, {
    String? content,
  }) async {
    try {
      final File file;
      if (basePath == '') {
        file = await File('$fileName.yaml').create();
      } else if (basePath == 'html') {
        file = await File('$fileName.html').create();
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
