import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sapa_mata/core/constants/image_constants.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                    color: Colors.grey[300],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SvgPicture.asset(
                      IconsConstants.favoriteLight,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                                .elevatedButtonTheme
                                .style
                                ?.backgroundColor
                                ?.resolve({MaterialState.selected}) ??
                            Colors.green,
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
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "LIMITED",
                      style: TextStyle(color: Colors.white, fontSize: 8),
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
                const Text(
                  "The Ordinary",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const Text(
                  "Glycolic Acid 7%...",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$14.50",
                      style: context.titleLarge.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
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
