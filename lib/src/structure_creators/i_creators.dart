import 'dart:io';

abstract class IIoCreator {
  Future<void> create();
}

abstract class IDirectoryCreator {
  Future<bool> createDirectories();

  Directory get blocDir;

  Directory get dataDir;

  Directory get uiDir;

  Directory get l10nDir;
}

abstract class IFileCreator {
  Future<void> createNecessaryFiles();
}

abstract class IPubspecCreator {
  Future<void> getPackageVersion();
}
