import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/repositories/product_repository.dart';

class GetProductUseCase {
  final ProductRepository productRepository;
// Repositório responsável por fornecer os dados
  GetProductUseCase(this.productRepository);
// Construtor que recebe o repositório
  Future<List<ProductEntity>> execute()async{
    return productRepository.getProducts();
  }
// Método que executa a ação de buscar produto
// Chama o repositório e retorna a lista de produtos
}