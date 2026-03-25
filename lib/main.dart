import 'package:appdio/core/http_client.dart';
import 'package:appdio/data/datasources/product_datasource.dart';
import 'package:appdio/data/repositories/product_repository_impl.dart';
import 'package:appdio/domain/usecases/get_product_use_case.dart';
import 'package:appdio/presentation/controllers/product_controller.dart';
import 'package:appdio/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Ponto de entrada do app (onde tudo começa)
  runApp(const MyApp()); // Inicia o app chamando o widget principal
}

class MyApp extends StatelessWidget {
  // Widget principal do app (não tem estado)
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Cliente HTTP para fazer requisições (ex: API)
    final httpClient = CustomHttpClient();

    // Fonte de dados que usa o httpClient para buscar dados
    final productDataSource = ProductDatasource(httpClient);

    // Repositório que organiza e abstrai os dados
    final productRepository = ProductRepositoryImpl(productDataSource);

    // Caso de uso (ação do sistema: buscar produtos)
    final getProductUseCase = GetProductUseCase(productRepository);

    return MultiProvider(
      // Aqui definimos os providers (injeção de dependência / estado)
      providers: [
        ChangeNotifierProvider(
          // Controller que gerencia o estado da tela
          create: (_) => ProductController(getProductUseCase),
        ),
      ],

      child: MaterialApp(
        // Configuração principal do app

        title: 'Consumo de API Flutter', // Nome do app

        theme: ThemeData(
          // Tema visual do app
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, // Cor principal
          ),
        ),

        home: const ProductPage(), // Tela inicial do app
      ),
    );
  }
}
