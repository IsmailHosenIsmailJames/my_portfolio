import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/src/resources/svgs_string.dart';
import 'package:my_portfolio/src/screens/home/cubit/hover_on_card_cubit.dart';
import 'package:my_portfolio/src/theme/colors/app_colors.dart';
import 'package:my_portfolio/src/theme/controller/theme_icon_button.dart';
import 'package:simple_icons/simple_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light;
    double cardWidth = MediaQuery.of(context).size.width;
    if (cardWidth > 500) cardWidth = 500;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
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
                    color: AppColors.primary.withValues(alpha: 0.1),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://raw.githubusercontent.com/IsmailHosenIsmailJames/my_portfolio/refs/heads/master/assets/IMG_20240628_162010_317%20(1)%7E2%20(1).jpg",
                    errorWidget:
                        (context, url, error) =>
                            Icon(Icons.broken_image_rounded, size: 40),
                    progressIndicatorBuilder:
                        (context, url, progress) => Center(
                          child: CircularProgressIndicator(
                            value:
                                (progress.downloaded) /
                                (progress.totalSize ?? 1),
                          ),
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(15),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Ismail Hessian James',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Gap(10),
            Align(
              alignment: Alignment.center,
              child: Text(
                'A Full Stack Android & iOS Developer',
                style: TextStyle(
                  color:
                      isLight
                          ? AppColors.lightMutedGray
                          : AppColors.darkMutedGray,
                ),
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(
                    SimpleIcons.github,
                    color: isLight ? Colors.grey.shade900 : Colors.white,
                  ),
                ),
                Gap(15),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(SimpleIcons.facebook, color: Color(0xff0866FF)),
                ),
                Gap(15),

                IconButton.filled(
                  onPressed: () {},
                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.string(linkedIn),
                  ),
                ),
                Gap(15),

                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(
                    SimpleIcons.googleplay,
                    color: isLight ? Colors.grey.shade900 : Colors.white,
                  ),
                ),
                Gap(15),

                IconButton.filled(
                  onPressed: () {},
                  icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.string(gmail),
                  ),
                ),
              ],
            ),
            Gap(30),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List.generate(10, (index) {
                  return getProjectCard(cardWidth, isLight, index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getProjectCard(double cardWidth, bool isLight, int index) {
    return Stack(
      children: [
        BlocBuilder<HoverOnProjectCardCubit, int?>(
          builder: (context, state) {
            bool expand = (state != null && state == index);
            if (state == null) expand = false;
            return SizedBox(
              height: 400,
              width: cardWidth,
              child: Align(
                alignment: Alignment.bottomRight,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(expand ? 10 : 100),
                      topLeft: Radius.circular(expand ? 10 : 100),
                      bottomRight: Radius.circular(expand ? 10 : 100),
                      topRight: Radius.circular(expand ? 10 : 100),
                    ),
                  ),

                  height: expand ? 400 : 0,
                  width: expand ? cardWidth : 0,
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onPanDown: (details) {
            context.read<HoverOnProjectCardCubit>().onHover(index);
          },

          child: SizedBox(
            height: 400,
            width: cardWidth,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    isLight
                        ? Colors.grey.shade400.withValues(alpha: 0.1)
                        : Colors.grey.shade600.withValues(alpha: 0.1),
                overlayColor: Colors.transparent,
                padding: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              onHover: (value) {
                if (value) {
                  context.read<HoverOnProjectCardCubit>().onHover(index);
                } else {
                  context.read<HoverOnProjectCardCubit>().cancelHover();
                }
              },
              onPressed: () {},
              child: SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
