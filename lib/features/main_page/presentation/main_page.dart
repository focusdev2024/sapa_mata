import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/core/utils/responsive_layout.dart';
import 'package:sapa_mata/core/constants/image_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? apiName = "";

  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverToBoxAdapter(child: _buildHeader(context, isTablet)),

            // Promo Banner
            SliverToBoxAdapter(child: _buildBannerSection(context, isTablet)),

            // Categories
            SliverToBoxAdapter(child: _CategoryCard(index: 1)),

            // Grid Title
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New arrivals",
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: context.labelSmall.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Product Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 4 : 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.7, // Adjusted for the taller card design
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ProductCard(),
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader(BuildContext context, bool isTablet) {
    final String displayName = (apiName?.isNotEmpty ?? false)
        ? apiName!
        : "Müşderi";
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.languageLoc.welcome, style: context.bodyMedium),
              Text(displayName, style: context.headline),
            ],
          ),
          Material(
            shape: const CircleBorder(),
            child: Container(
              height: isTablet ? 55 : 45,
              width: isTablet ? 55 : 45,
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset(
                  IconsConstants.search,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).canvasColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildBannerSection(BuildContext context, bool isTablet) {
  final Color gradientStart = Color.fromRGBO(255, 255, 255, 0.623);
  final Color gradientEnd = Color.fromRGBO(0, 0, 0, 0.418);
  const String apiImageUrl =
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=60";
  const String bannerTitle = "Skincare essentials";
  const String bannerDesc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
  const int discountPercent = 20;
  return AspectRatio(
    // Handles across mobile & tablet
    aspectRatio: isTablet ? 21 / 8 : 16 / 10,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: 3,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 500 : MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                // LAYER 1: API Image Handler with explicit fail-safes
                Positioned.fill(
                  child: apiImageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: apiImageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              _buildFallbackAsset(),
                        )
                      : _buildFallbackAsset(),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [gradientStart, gradientEnd],
                      ),
                    ),
                  ),
                ),

                // Interactive Content Components
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        bannerTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.headline.copyWith(
                          color: ColorConstants.primaryWhite,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: isTablet ? 300 : 220,
                        child: Text(
                          bannerDesc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodyMedium.copyWith(
                            color: ColorConstants.primaryWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(160, 113, 220, 55),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "$discountPercent% ${context.languageLoc.discount}",
                          style: context.bodyMedium.copyWith(
                            color: ColorConstants.primaryWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget _buildFallbackAsset() {
  return Image.asset('assets/images/mary_mata_market.png', fit: BoxFit.cover);
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Heart
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
                const Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite_border, size: 20),
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

class _CategoryCard extends StatelessWidget {
  final int index;
  const _CategoryCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Fixed width for horizontal scroll
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(
              Icons.category_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Category $index",
            style: context.labelSmall, // Using your typography extension
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
