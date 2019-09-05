import 'package:meta/meta.dart';

enum BuildFlavor { all }

BuildEnvironment get environment => _environment;
BuildEnvironment _environment;

class BuildEnvironment {
  final String baseUrl;
  final BuildFlavor flavor;
  final List<String> supportedTypes;

  final String accessKey;

  BuildEnvironment._init({
    this.flavor,
    this.baseUrl,
    this.supportedTypes,
    this.accessKey,
  });

  static void init({
    @required flavor,
    @required baseUrl,
    @required supportedTypes,
    @required accessKey,
  }) =>
      _environment ??= BuildEnvironment._init(
        flavor: flavor,
        baseUrl: baseUrl,
        supportedTypes: supportedTypes,
        accessKey: accessKey,
      );
}
