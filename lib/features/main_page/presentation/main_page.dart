import 'package:flutter/material.dart';
import 'package:sapa_mata/core/utils/context_extensions.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Header: Welcome Text & Search
            SliverToBoxAdapter(child: _buildHeader(context)),

            // 2. Promo Banner (Horizontal PageView or ListView)
            SliverToBoxAdapter(child: _buildBannerSection(isTablet)),

            // 3. Categories (Filter Chips)
            SliverToBoxAdapter(child: _CategoryCard(index: 1)),

            // 4. Grid Title
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

            // 5. Product Grid
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: context.bodyMedium.copyWith(color: Colors.grey),
              ),
              Text(
                "Olivia",
                style: context.headline.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

Widget _buildBannerSection(bool isTablet) {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: isTablet ? 500 : MediaQuery.of(context).size.width * 0.85,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF76E05F), Color(0xFF4CAF50)],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text("Promo Content Here"), // Add your text/images here
          ),
        );
      },
    ),
  );
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
