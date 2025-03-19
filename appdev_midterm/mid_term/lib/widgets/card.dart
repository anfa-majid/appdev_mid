import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mid_term/model/product.dart';

class Product_Card extends StatelessWidget {
  final Product product;
  Product_Card({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    
                    imageUrl: product.image,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Container(
                      height: 120,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Category Badge (Fixed Background)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple, // Fixed to match original UI
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product.category.toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 6),

                // Product Name (Bolder)
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 6),

                // Rating & Stars (Smaller)
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text(product.rating.rate.toString(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),

                SizedBox(height: 6),

                // Price & Discount (Larger)
                Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    if (product.price < 20) // Show discount conditionally
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "\$${(product.price * 1.2).toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 6),

                // Add to Cart Button (Fixed Transparent Style)
                OutlinedButton.icon(
                  onPressed: () {},
                  icon:
                      Icon(Icons.shopping_cart, size: 16, color: Colors.purple),
                  label: Text("Add to Cart",
                      style: TextStyle(color: Colors.purple)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.purple, width: 1.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            ),
          ),

          // Favorite Button (Smaller & Properly Positioned)
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
                ),
                padding: EdgeInsets.all(5), // Smaller padding
                child: Icon(Icons.favorite_border,
                    color: Colors.purple, size: 20), // Smaller icon
              ),
            ),
          ),

          // Sale Tag (Fixed Size & Position)
          if (product.price < 20)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "SALE",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}