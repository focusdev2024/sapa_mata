import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/constants/image_constants.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.favorite,
    required this.limited,
    this.onFavoriteToggle,
    this.onAddToCart,
    super.key,
  });

  final String title;
  final String description;
  final String image;
  final double price;
  final bool favorite;
  final bool limited;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 50,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onFavoriteToggle, // Triggers parent action cleanly
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      favorite
                          ? IconsConstants.favoriteDark
                          : IconsConstants.favoriteLight,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.primaryGreen,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "LIMITED",
                      style: TextStyle(
                        color: ColorConstants.primaryWhite,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.labelSmall.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: context.titleLarge.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).cardColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
