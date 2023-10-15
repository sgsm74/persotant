import 'package:dio/dio.dart';
import 'package:persotant/core/consts/consts.dart';
import 'package:persotant/core/errors/exceptions.dart';
import 'package:persotant/core/services/http_service.dart';
import 'package:persotant/features/categories/data/model/category_model.dart';
import 'package:persotant/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> categories();
  Future<CategoryEntity> getCategory(int id);
  Future<void> saveCategory(CategoryEntity categoryEntity, int id);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  const CategoryRemoteDataSourceImpl({required this.httpService});
  final HTTPService httpService;

  @override
  Future<List<CategoryModel>> categories() async {
    try {
      final categories = <CategoryModel>[];
      final result = await httpService.getData(
        ServerPaths.categories,
      );
      for (final data in result.data) {
        categories.add(CategoryModel.fromJson(data));
      }
      return categories;
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? '');
    }
  }

  @override
  Future<CategoryEntity> getCategory(int id) async {
    try {
      final result = await httpService.getData(
        ServerPaths.getCategory(id: id),
      );
      return CategoryModel.fromJson(result.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? '');
    }
  }

  @override
  Future<void> saveCategory(CategoryEntity categoryEntity, int id) {
    throw UnimplementedError();
  }
}
