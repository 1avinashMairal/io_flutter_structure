import 'dart:io';

abstract class IIoCreator {
  Future<void> create();
}

abstract class IDirectoryCreator {
  Future<bool> createDirectories();

  Directory get dataDir;

  Directory get modelDir;

  Directory get repositoryDir;

  Directory get resourcesDir;

  Directory get utilsDir;

  Directory get viewDir;

  Directory get viewModelDir;
}

abstract class IFileCreator {
  Future<void> createNecessaryFiles();
}

abstract class IPubspecCreator {
  Future<void> getPackageVersion();
}
