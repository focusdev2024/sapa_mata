import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sapa_mata/core/constants/color_constants.dart';
import 'package:sapa_mata/core/utils/context_ext.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';
import 'package:sapa_mata/core/utils/responsive_layout.dart';
import 'package:sapa_mata/core/constants/image_constants.dart';
import 'package:sapa_mata/features/home_page/presentation/widgets/product_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? apiName = "";

  List<String> categories = [
    "Fragrance",
    "Skincare",
    "Makeup",
    "Haircare",
    "Bath & Body",
    "Tools & Brushes",
  ];

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
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kategories",
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
            SliverToBoxAdapter(
              child: _buildCategoryCard(context, isTablet, categories),
            ),

            // Grid Title
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Täze harytlar",
                      style: context.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hemmesi",
                      style: context.labelSmall.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Product Grid
            SliverToBoxAdapter(child: _buildNewProducts(context, isTablet)),
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
                        style: context.headline,
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
                child: Text(
                  categories[index],
                  style: context.labelSmall.copyWith(
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold,
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
