import 'package:dartz/dartz.dart';
import 'package:persotant/core/errors/errors.dart';
import 'package:persotant/core/utils/ok.dart';
import 'package:persotant/features/categories/domain/entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoryEntity>> getCategory({required int id});
  Future<Either<Failure, List<CategoryEntity>>> categories();
  Future<Either<Failure, OK>> saveCategory();
}
