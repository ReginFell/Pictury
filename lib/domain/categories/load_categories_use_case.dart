import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class LoadCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  LoadCategoriesUseCase(this._categoryRepository);

  Future<List<Category>> loadCategories() {
    return _categoryRepository.loadCategories();
  }

  Stream<List<Category>> observeSelectedCategories() {
    return _categoryRepository.observeSelectedCategories();
  }
}
