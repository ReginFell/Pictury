import 'package:pictury/core/ui/base/base_view_model.dart';
import 'package:pictury/data/remote_config/models/category.dart';
import 'package:pictury/data/remote_config/remote_config_repository.dart';

import 'categories_view_state.dart';

class CategoriesViewModel extends BaseViewModel<CategoriesViewState> {
  final RemoteConfigRepository _remoteConfigRepository;

  CategoriesViewModel(this._remoteConfigRepository);

  void loadCategories() async {
    mutateViewState((viewState) => viewState.copy(isLoading: true));

    final List<Category> categories = _remoteConfigRepository.loadCategories();

    mutateViewState(
        (viewState) => viewState.copy(isLoading: false, pictures: categories));
  }

  @override
  CategoriesViewState initialViewState() => CategoriesViewState.createDefault();
}
