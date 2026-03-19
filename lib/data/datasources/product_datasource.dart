import 'package:appdio/core/http_client.dart';
import 'package:appdio/data/models/product_model.dart';
import 'package:appdio/domain/entities/product_entity.dart';

class ProductDatasource {
  final CustomHttpClient httpClient;

  ProductDatasource(this.httpClient);

  Future<List<ProductEntity>> getProducts() async{
    //response armazena o retorno da requisição
    final response = await httpClient.getProducts();
final List<dynamic> dataList = response.data is List ? response.data : [];
    return dataList
      .map((e) => ProductModel.fromJson(e))
      .map((model)=> model.toProductEntity())
      .toList();
  }

//metodo para cadastrar um produto
  Future<bool> createProduct(ProductEntity product) async {
    try {
      final model =ProductModel.fromProductEntity(product);
      await httpClient.createProduct(model.toJson());
      return true;
  }catch (e) {
            return false;
    }
  }  
//metodo para atualizar um produto
  /*Future<ProductEntity> updateProduct(int id, Map<String, dynamic> productData) async {
    final response = await httpClient.updateProduct(id, productData);
    return ProductModel.fromJson(response.data);
  }*/

}