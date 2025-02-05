import 'package:dio/dio.dart';
import 'package:flutter_tech_camp/src/cart/cubit/cart_cubit.dart';
import 'package:flutter_tech_camp/src/products/cubit/products_cubit.dart';
import 'package:flutter_tech_camp/src/products/repository/products_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void registerDependencies() {
  // Third party dependencies
  sl.registerSingleton(Dio(BaseOptions(
    baseUrl: 'https://fakestoreapi.com/',
  )));

  // Repositories
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(sl()));

  // Cubits
  sl.registerFactory(() => ProductsCubit(sl()));
  sl.registerFactory(() => CartCubit());
}
