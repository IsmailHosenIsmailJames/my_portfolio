import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/src/theme/colors/app_colors.dart';
import 'package:my_portfolio/src/theme/controller/theme_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: themeIconButton(context),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.broken_image_rounded, size: 40),
                  progressIndicatorBuilder:
                      (context, url, progress) => CircularProgressIndicator(
                        value:
                            (progress.downloaded) / (progress.totalSize ?? 1),
                      ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
