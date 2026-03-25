import 'package:appdio/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<bool>createProduct(ProductEntity product);
}
// Classe abstrata (contrato)
  // Define o que deve ser implementado, mas não como

  // Método para buscar uma lista de produtos
  // Future = operação assíncrona (ex: API)
  // Retorna uma lista de ProductEntity

  // Método para criar um produto
  // Recebe um ProductEntity como parâmetro
  // Retorna true/false indicando sucesso ou falha