//implementacao do contrato
import 'package:appdio/data/datasources/product_datasource.dart';
import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  final ProductDatasource productDatasource;

  ProductRepositoryImpl(this.productDatasource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await productDatasource.getProducts();
  }
@override
  Future<bool> createProduct (ProductEntity product) async {
    return await productDatasource.createProduct(product);
  }
}