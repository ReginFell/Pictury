import 'package:pictury/data/category/category_repository.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class SaveCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  SaveCategoriesUseCase(this._categoryRepository);

  void saveCategories(List<Category> categories) {
    return _categoryRepository.selectCategories(categories);
  }
}
