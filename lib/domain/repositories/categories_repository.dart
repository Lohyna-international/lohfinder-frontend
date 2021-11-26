import 'package:lohfinder_frontend/data/api/categories/categories_service.dart';
import 'package:lohfinder_frontend/data/models/category.dart';

class CategoriesRepository {
  final CategoriesService _service;

  CategoriesRepository(this._service);

  Future<List<Category>> allCategories() => _service.allCategories();
}
