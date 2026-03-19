
// A diferença: ProductEntity é a camada de negócio, ProductModel é a camada de dados
import 'package:appdio/domain/entities/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  // Construtor que recebe id, title e price
  ProductModel({required this.id, required this.title, required this.price});

  // Factory é um construtor especial que cria um ProductModel a partir de um JSON (Map)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],           // Pega o id do JSON
      title: json['title'],     // Pega o title do JSON
      price: json['price'],     // Pega o price do JSON
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'title':title,
      'price': price
    };
  }
  //conversores que de model viram entidade
//transforma em um model para enviar para a API 
//factpry = faz uma instancia a partir dela propria
  factory ProductModel.fromProductEntity(ProductEntity productEntity){
    return ProductModel(
      id: productEntity.id,
     title: productEntity.title,
      price: productEntity.price);
  }

  //pega oq veio da api para usar no sistema 
  ProductEntity toProductEntity(){
return ProductEntity(id: id, title: title, price: price);
  }
}
