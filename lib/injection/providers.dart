import 'package:provider/provider.dart';
import '../data/data_module.dart' as dataModule;
import '../domain/domain_module.dart' as domainModule;

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  ...dataModule.independentServices,
  ...dataModule.independentServices
];

List<SingleChildCloneableWidget> dependentServices = [
  ...dataModule.dependentServices,
  ...domainModule.dependentServices
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
