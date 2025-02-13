import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/bloc/product_bloc/bloc/product_bloc.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProdDatState) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.prod.data.length + 1,
            itemBuilder: (context, index) {
              if (index == 3) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blue[100],
                  child: const Center(
                    child: Text(
                      "Ad Banner 01",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              } else if (index == 7) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.blue[100],
                  child: const Center(
                    child: Text(
                      "Ad Banner 02",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              } else {
                final int productIndex =
                    index < 3 || (index > 3 && index < 7) ? index : index - 1;
                final x = state.prod.data[productIndex];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey[200],
                  child: Center(
                    child: Text(
                      x.marketingName,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            },
          );
        }
        if (state is ProdErrorState) {
          print("ERROR ${state.errorMessage}");
          return Center(
            child: Text("ERROR: ${state.errorMessage}"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
