import 'package:persotant/core/consts/consts.dart';
import 'package:persotant/core/utils/hive_utils.dart';
import 'package:persotant/features/categories/domain/entities/category_entity.dart';
import 'package:queue/queue.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryEntity>> categories();
  Future<CategoryEntity> getCategory(int id);
  Future<void> saveCategory(CategoryEntity categoryEntity, int id);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  const CategoryLocalDataSourceImpl({required this.queue});
  final Queue queue;

  @override
  Future<List<CategoryEntity>> categories() => queue.add(
      () async => await loadListFromHive<CategoryEntity>(HiveKeys.categories));

  @override
  Future<CategoryEntity> getCategory(int id) => queue.add(() async =>
      await loadMapFromHive<CategoryEntity>(HiveKeys.categories, '$id'));

  @override
  Future<void> saveCategory(CategoryEntity categoryEntity, int id) =>
      queue.add(() async => await saveMapToHive<CategoryEntity>(
          HiveKeys.token, '${categoryEntity.id}', categoryEntity));
}
