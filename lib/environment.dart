import 'package:meta/meta.dart';

enum BuildFlavor { all }

BuildEnvironment get environment => _environment;
BuildEnvironment _environment;

class BuildEnvironment {
  final String baseUrl;
  final String clientId;
  final BuildFlavor flavor;
  final List<String> supportedTypes;

  BuildEnvironment._init({this.flavor, this.baseUrl, this.clientId, this.supportedTypes});

  static void init({@required flavor, @required baseUrl, @required clientId, @required supportedTypes}) =>
      _environment ??= BuildEnvironment._init(
          flavor: flavor, baseUrl: baseUrl, clientId: clientId, supportedTypes: supportedTypes);
}
