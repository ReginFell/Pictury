import 'package:provider/provider.dart';
import '../data/data_module.dart' as dataModule;

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  ...dataModule.independentServices
];

List<SingleChildCloneableWidget> dependentServices = [
  ...dataModule.dependentServices
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
