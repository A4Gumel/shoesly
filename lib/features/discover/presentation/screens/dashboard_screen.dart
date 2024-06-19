import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/discover/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_project/features/discover/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_project/features/discover/presentation/widgets/app_bar.dart';
import 'package:flutter_project/features/discover/presentation/widgets/body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/animation/fadeanimation.dart';
import '../../../../shared/data/dummy_data.dart';
import '../../../../shared/data/shoe_model.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/custom_app_theme.dart';
import '../../../product_detail/domain/presentation/screens/detail_screen.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  static const String routeName = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  Timer? _debounce;

  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void scrollControllerListener() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(dashboardNotifierProvider.notifier);
      if (isSearchActive) {
        notifier.searchProducts(searchController.text);
      } else {
        notifier.fetchProducts();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    ref.listen(
      dashboardNotifierProvider.select((value) => value),
      ((DashboardState? previous, DashboardState next) {
        //show Snackbar on failure
        if (next.state == DashboardConcreteState.fetchedAllProducts) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );

    return Scaffold(
      appBar: customAppBar(),
      body: state.state == DashboardConcreteState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
              ? Column(
        children: [
          topCategoriesWidget(width, height),
          SizedBox(height: 10),
          middleCategoriesWidget(width, height),
          SizedBox(height: 5),
          moreTextWidget(),
          lastCategoriesWidget(width, height),
        ],
      )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(dashboardNotifierProvider.notifier).searchProducts(query);
    });
  }

  // Top Categories Widget Components
  topCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height / 18,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index ? 21 : 18,
                          color: selectedIndexOfCategory == index
                              ? AppConstantsColor.darkTextColor
                              : AppConstantsColor.unSelectedTextColor,
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.bold
                              : FontWeight.w400),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

// Middle Categories Widget Components
  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: width / 16,
          height: height / 2.7,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: featured.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexOfFeatured = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontSize:
                            selectedIndexOfFeatured == index ? 19 : 17,
                            color: selectedIndexOfFeatured == index
                                ? AppConstantsColor.darkTextColor
                                : AppConstantsColor.unSelectedTextColor,
                            fontWeight: selectedIndexOfFeatured == index
                                ? FontWeight.bold
                                : FontWeight.w400),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Container(
          width: width / 1.2,
          height: height / 2.4,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: availableShoes.length,
            itemBuilder: (ctx, index) {
              ShoeModel model = availableShoes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                        model: model,
                        isComeFromMoreSection: false,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: width / 1.81,
                        decoration: BoxDecoration(
                          color: model.modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(model.name,
                                  style: AppThemes.homeProductName),
                              SizedBox(
                                width: 120,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: Text(model.model,
                              style: AppThemes.homeProductModel),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text("\$${model.price.toStringAsFixed(2)}",
                              style: AppThemes.homeProductPrice),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 60,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-30 / 360),
                              child: Container(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.arrowCircleRight,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

// More Text Widget Components
  moreTextWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("More", style: AppThemes.homeMoreText),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                CupertinoIcons.arrow_right,
                size: 27,
              ))
        ],
      ),
    );
  }

// Last Categories Widget Components
  lastCategoriesWidget(width, height) {
    return Container(
      width: width,
      height: height / 4,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: availableShoes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            ShoeModel model = availableShoes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      model: model,
                      isComeFromMoreSection: true,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: width / 2.24,
                height: height / 4.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      child: FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: width / 13,
                          height: height / 10,
                          color: Colors.red,
                          child: RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                  child: FadeAnimation(
                                    delay: 1.5,
                                    child: Text("NEW",
                                        style: AppThemes.homeGridNewText),
                                  ))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppConstantsColor.darkTextColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 25,
                      child: FadeAnimation(
                        delay: 1.5,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-15 / 360),
                          child: Container(
                            width: width / 3,
                            height: height / 9,
                            child: Hero(
                              tag: model.model,
                              child: Image(
                                image: AssetImage(model.imgAddress),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 124,
                      left: 45,
                      child: FadeAnimation(
                        delay: 2,
                        child: Container(
                          width: width / 4,
                          height: height / 42,
                          child: FittedBox(
                            child: Text("${model.name} ${model.model}",
                                style: AppThemes.homeGridNameAndModel),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 45,
                      child: FadeAnimation(
                        delay: 2.2,
                        child: Container(
                          width: width / 4,
                          height: height / 42,
                          child: FittedBox(
                            child: Text(
                                "\$${model.price.toStringAsFixed(2)}",
                                style: AppThemes.homeGridPrice
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
