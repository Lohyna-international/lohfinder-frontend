import 'package:lohfinder_frontend/data/models/category.dart';

abstract class CategoriesService {
  Future<List<Category>> allCategories();
}
