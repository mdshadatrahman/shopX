import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  //what does it do?
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
