import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/core/utils/responsive_layout.dart';
import 'package:sapa_mata/core/constants/image_constants.dart';
import 'package:sapa_mata/features/home_page/presentation/widgets/product_card_widget.dart';
import 'package:sapa_mata/features/home_page/presentation/widgets/sliver_section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName = "";

  List<String> categories = [
    "Fragrance",
    "Skincare",
    "Makeup",
    "Haircare",
    "Bath & Body",
    "Tools & Brushes",
  ];

  List<Map<String, String>> topProducts = [
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=60",
      "trendingTag": "TRENDING",
      "description": "TikTok says this fragrance causes emotional flashbacks.",
    },
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=60",
      "trendingTag": "POPULAR",
      "description": "This moisturizer is a cult favorite for dry skin.",
    },
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?auto=format&fit=crop&w=800&q=60",
      "trendingTag": "NEW",
      "description": "This serum is the latest buzz in skincare circles.",
    },
  ];

  List<Map<String, String>>? bannerData = [
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=60",
      "title": "Skincare essentials",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "discountPercent": "20",
    },
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=60",
      "title": "Makeup must-haves",
      "description": "Discover the latest trends in makeup products.",
      "discountPercent": "15",
    },
    {
      "imageUrl":
          "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?auto=format&fit=crop&w=800&q=60",
      "title": "Haircare heroes",
      "description": "Top-rated products for healthy, beautiful hair.",
      "discountPercent": "25",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isTablet = Responsive.isTablet(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverToBoxAdapter(
              child: _buildHeader(
                context,
                isTablet,
                userName,
                onSearchTap: () {
                  print("Navigate to search page");
                },
              ),
            ),

            // Promo Banner
            SliverToBoxAdapter(
              child: _buildBannerSection(
                context,
                isTablet,
                bannerData: bannerData,
              ),
            ),

            // Categories
            SliverSectionHeader(
              title: "Kategoriyalar",
              onActionTap: () {
                print("Navigate to categories page");
              },
            ),
            SliverToBoxAdapter(
              child: _buildCategoryCard(context, isTablet, categories),
            ),

            // New Products Title
            SliverSectionHeader(
              title: "Täze harytlar",
              onActionTap: () {
                print("Navigate to new products page");
              },
            ),

            // New Products ListView
            SliverToBoxAdapter(child: _buildNewProducts(context, isTablet)),

            // Recommended Products Title
            SliverSectionHeader(
              title: "Siz üçin",
              onActionTap: () {
                print("Navigate to recommended products page");
              },
            ),

            // Recommended Products ListView
            SliverToBoxAdapter(
              child: _buildRecommendedProducts(context, isTablet),
            ),

            // Top Products Title
            SliverSectionHeader(
              title: "Top harytlar",
              onActionTap: () {
                print("Navigate to top products page");
              },
            ),

            SliverToBoxAdapter(
              child: _buildTopProductSection(context, isTablet, topProducts),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(
  BuildContext context,
  bool isTablet,
  String? userName, {
  VoidCallback? onSearchTap,
}) {
  final String displayName = (userName?.isNotEmpty ?? false)
      ? userName!
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
          child: GestureDetector(
            onTap: onSearchTap ?? () => print("Navigate to search page"),
            child: Container(
              height: isTablet ? 55 : 45,
              width: isTablet ? 55 : 45,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).canvasColor),
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
        ),
      ],
    ),
  );
}

Widget _buildBannerSection(
  BuildContext context,
  bool isTablet, {
  List<Map<String, String>>? bannerData,
}) {
  final Color gradientStart = const Color.fromRGBO(255, 255, 255, 0.15);
  final Color gradientEnd = const Color.fromRGBO(0, 0, 0, 0.65);

  return SizedBox(
    height: isTablet ? 260 : 230,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: bannerData?.length ?? 3,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 500 : MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(right: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: bannerData?.isNotEmpty ?? false
                      ? CachedNetworkImage(
                          imageUrl: bannerData![index]['imageUrl']!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.broken_image),
                        )
                      : _buildFallbackAsset(),
                ),

                // Gradient Overlay
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

                // FIX 2: Anchor the components safely using Positioned instead of standard blanket Padding
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 14, // Pin cleanly relative to bottom boundary
                  top: 14, // Allow bounds definition to control layout stretch
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment
                        .end, // Keeps items pushed to bottom safely
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        bannerData?[index]['title'] ?? '',
                        maxLines:
                            2, // Reduced to 1 line for phones to maximize rendering safety margin
                        overflow: TextOverflow.ellipsis,
                        style: context.headline.copyWith(
                          color: const Color(
                            0xFF71DC37,
                          ), // Matches your brand green color from image
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        bannerData?[index]['description'] ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.bodyMedium.copyWith(
                          color: ColorConstants.primaryWhite,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // The Arzanlaşyk Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF71DC37,
                          ), // Solid brand match color hex
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${bannerData?[index]['discountPercent'] ?? ''}% ${context.languageLoc.discount}",
                          style: context.bodyMedium.copyWith(
                            color: ColorConstants.primaryWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 14 : 12,
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

Widget _buildCategoryCard(
  BuildContext context,
  bool isTablet,
  List<String> categories,
) {
  return AspectRatio(
    aspectRatio: isTablet ? 25 / 2 : 25 / 4,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).canvasColor),
                ),
                child: GestureDetector(
                  onTap: () {
                    print("Navigate to ${categories[index]} category page");
                  },
                  child: Text(
                    categories[index],
                    style: context.labelSmall.copyWith(
                      color: Theme.of(context).canvasColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildNewProducts(BuildContext context, bool isTablet) {
  return AspectRatio(
    aspectRatio: isTablet ? 16 / 5 : 16 / 10,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 210 : 160,
          margin: const EdgeInsets.only(right: 12),
          child: ProductCard(),
        );
      },
    ),
  );
}

Widget _buildRecommendedProducts(BuildContext context, bool isTablet) {
  return AspectRatio(
    aspectRatio: isTablet ? 16 / 5 : 16 / 10,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 210 : 160,
          margin: const EdgeInsets.only(right: 12),
          child: ProductCard(),
        );
      },
    ),
  );
}

Widget _buildTopProductSection(
  BuildContext context,
  bool isTablet,
  List<Map<String, String>>? topProducts,
) {
  return SizedBox(
    height: isTablet ? 360 : 290,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: topProducts?.length ?? 3,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 450 : MediaQuery.of(context).size.width * 0.82,
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: isTablet ? 16 / 9 : 16 / 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: CachedNetworkImage(
                    imageUrl:
                        topProducts?[index]["imageUrl"] ??
                        "assets/images/mary_mata_market.png",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                topProducts?[index]["trendingTag"] ?? "TRENDING",
                style: context.bodyMedium.copyWith(
                  fontSize: isTablet ? 15 : 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Theme.of(context).dividerColor,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                topProducts?[index]["description"] ??
                    "Description not available",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.bodyMedium.copyWith(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.4,
                  height: 1.2,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
