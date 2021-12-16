import 'package:lohfinder_frontend/data/models/category.dart';

import 'categories_service.dart';

class MockCategoriesService implements CategoriesService {
  @override
  Future<List<Category>> allCategories() => Future.value([
        const Category(id: '0', title: 'Sport'),
        const Category(id: '1', title: 'Music'),
        const Category(id: '2', title: 'Dance'),
      ]);
}
