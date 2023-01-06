import 'dart:io';

import '../i_creators.dart';

class ImplDirectoryCreator implements IDirectoryCreator {
  final _data = 'data';
  final _network = 'network';
  final _response = 'response';
  final _l10n = 'l10n';
  final _model = 'model';
  final _repository = 'repository';
  final _resources = 'resources';
  final _utils = 'utils';
  final _view = 'view';
  final _screens = 'screens';
  final _widgets = 'widgets';
  final _viewModel = 'view_model';

  final _images = 'images';
  final _assets = 'assets';

  late final String basePath;

  @override
  Directory get dataDir => Directory('$basePath/$_data');

  @override
  Directory get l10nDir => Directory('$basePath/$_l10n');

  @override
  Directory get modelDir => Directory('$basePath/$_model');

  @override
  Directory get repositoryDir => Directory('$basePath/$_repository');

  @override
  Directory get resourcesDir => Directory('$basePath/$_resources');

  @override
  Directory get utilsDir => Directory('$basePath/$_utils');

  @override
  Directory get viewDir => Directory('$basePath/$_view');

  @override
  Directory get viewModelDir => Directory('$basePath/$_viewModel');

  @override
  Future<bool> createDirectories() async {
    try {
      final libDir = Directory('lib');

      if (await libDir.exists()) {
        basePath = libDir.absolute.path;
      } else {
        final res = await Directory('lib').create(recursive: true);

        basePath = res.absolute.path;
      }

      final absDataPath = dataDir.absolute.path;
      final absL10nPath = l10nDir.absolute.path;
      final absModelPath = modelDir.absolute.path;
      final absRepositoryPath = repositoryDir.absolute.path;
      final absResourcesPath = resourcesDir.absolute.path;
      final absUtilsPath = utilsDir.absolute.path;
      final absViewPath = viewDir.absolute.path;
      final absViewModelPath = viewModelDir.absolute.path;

      print('creating directories...\n');

      // data directory
      print('creating data directory...');
      await Directory(absDataPath).create();
      await Directory('$absDataPath/$_network').create();
      await Directory('$absDataPath/$_response').create();

      //creating l10n directory
      print('creating l10n directory...');
      await Directory(absL10nPath).create();

      //creating model directory
      print('creating model directory...');
      await Directory(absModelPath).create();

      //creating repository directory
      print('creating repository directory...');
      await Directory(absRepositoryPath).create();

      //creating resources directory
      print('creating resources directory...');
      await Directory(absResourcesPath).create();

      //creating utils directory
      print('creating utils directory...');
      await Directory(absUtilsPath).create();

      //creating view directory
      print('creating view directory...');
      await Directory(absViewPath).create();
      await Directory('$absDataPath/$_screens').create();
      await Directory('$absDataPath/$_widgets').create();

      //creating view_model directory
      print('creating view_model directory...');
      await Directory(absViewModelPath).create();

      //creating images directory
      print('creating images directory...');
      await Directory(_images).create();
      await Directory('$_images/$_assets').create();

      return true;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      return false;
    }
  }
}
