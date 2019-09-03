import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/data/remote_config/remote_config_repository.dart';

class LoadCategoriesUseCase {
  final RemoteConfigRepository _remoteConfigRepository;

  LoadCategoriesUseCase(this._remoteConfigRepository);

  Future<List<Category>> loadCategories() {
    return _remoteConfigRepository.loadCategories();
  }
}
