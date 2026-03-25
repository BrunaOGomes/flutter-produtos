import 'package:appdio/domain/entities/product_entity.dart';
import 'package:appdio/domain/usecases/get_product_use_case.dart';
import 'package:flutter/widgets.dart';

class ProductController extends ChangeNotifier{
  // Caso de uso que busca os produtos (regra de negócio)

  final GetProductUseCase _getProductUseCase;
  List<ProductEntity> _products =[];
    // Indica se os dados estão sendo carregados

  bool isLoading = false;
  String? error;
  // Construtor que recebe o caso de uso
  ProductController(this._getProductUseCase);

  //garante que só o controller acessa a lista
  List<ProductEntity> get products => _products;
  // Método para buscar os produtos (não retorna nada, só atualiza o estado)
  //void pq não retorna nada, apenas notifica
  Future<void> fetchProducts() async{
    try {
      isLoading = true;
      _products = await _getProductUseCase.execute();
      error = null;
    } catch (e) {
      error = "Falha ao buscar produtos";
    } finally{
      //quando o bloco terminar executa:
      isLoading = false;
      // Notifica a UI para atualizar a tela
      notifyListeners();
    }
  }

}