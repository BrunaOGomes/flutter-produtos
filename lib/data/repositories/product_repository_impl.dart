//implementacao do contrato
import 'package:appdio/data/datasources/product_datasource.dart';
import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  // Implementação do contrato ProductRepository
  final ProductDatasource productDatasource;
  // Fonte de dados (responsável por acessar API, banco, etc.)
  
  ProductRepositoryImpl(this.productDatasource);
  // Construtor que recebe o datasource

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await productDatasource.getProducts();
  }
    // Implementação do método definido no contrato
    // Apenas repassa a chamada para o datasource
  
@override
  Future<bool> createProduct (ProductEntity product) async {
    return await productDatasource.createProduct(product);
  }
  // Implementação do método de criar produto
  // Também repassa a ação para o datasource
}