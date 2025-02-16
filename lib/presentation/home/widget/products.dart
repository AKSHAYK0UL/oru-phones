import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/bloc/product_bloc/bloc/product_bloc.dart';
import 'package:oruphones/core/enum/prodenum.dart';
import 'package:oruphones/core/ui_component/toast.dart';
import 'package:oruphones/presentation/home/widget/ad_banner.dart';
import 'package:oruphones/presentation/home/widget/prodtile.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is ProdErrorState &&
            state.errorSource == ProdENUM.fetchProduct) {
          showToast("Error in Fetching Products");
        }
      },
      builder: (context, state) {
        if (state is ProdDatState && state.dataSoure == ProdENUM.fetchProduct) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 0.550,
            ),
            itemCount: state.prod.data.length + 1,
            itemBuilder: (context, index) {
              if (index == 3 || index == 7) {
                return AdBanner(
                    path:
                        index == 3 ? "assets/Sell.png" : "assets/Compare.png");
              } else {
                final int productIndex =
                    index < 3 || (index > 3 && index < 7) ? index : index - 1;
                final data = state.prod.data[productIndex];
                return ProdTile(data: data);
              }
            },
          );
        }
        if (state is ProdLoadingState &&
            state.laodingSource == ProdENUM.fetchProduct) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProdErrorState &&
            state.errorSource == ProdENUM.fetchProduct) {
          return Text(state.errorMessage);
        }

        return const SizedBox();
      },
    );
  }
}
