import 'package:bookmybeauty/constants/colors.dart';
import 'package:bookmybeauty/constants/images.dart';
import 'package:bookmybeauty/screens/home_screen/widgets/services_list.dart';
import 'package:bookmybeauty/shared/globle_app_bar.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/kcustom_button.dart';
import '../../../components/ktoggle_button.dart';
import '../widgets/saloon_type.dart';
import '../widgets/trending_services.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.09,
              width: Get.width * 0.09,
              child: const Image(image: AssetImage(appLogo)),
            ),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                "BookMyBeauty",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: Get.width / 360 * 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        leading: const Icon(
          Icons.line_weight_outlined,
          color: dimBlackColor,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              size: Get.width * 0.06,
              color: dimBlackColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Colors.white,
              border: Border.all(
                color: dimBlackColor,
                width: 2.0,
              ),
            ),
            child: ClipOval(
              child: Icon(
                Icons.person,
                size: Get.width * 0.04,
                color: dimBlackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 8),
            child: Icon(
              Icons.shopping_cart,
              size: Get.width * 0.07,
              color: dimBlackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: Get.height * 0.16,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Looking For",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      KToggleButton(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SaloonTypeWidget(),
                  const TrendingServiceWidget(
                    serviceImages: [
                      girlImage,
                      girlImage,
                      girlImage,
                    ],
                  ),
                  const ServiceListWidget(
                    serviceImages: [
                      girlImage2,
                      girlImage2,
                      girlImage2,
                    ],
                    serviceTitles: [
                      "Hair Cut",
                      "Hair Cut",
                      "Hair Cut",
                    ],
                  ),
                ],
              ),
            ),
            const BasicExamplesPage()


          ],
        ),
      ),
    );
  }
}


class BasicExamplesPage extends StatefulWidget {
  const BasicExamplesPage({super.key});

  @override
  BasicExamplesPageState createState() => BasicExamplesPageState();
}

class BasicExamplesPageState extends State<BasicExamplesPage> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      saloonImage,
      saloonImage,
      saloonImage,
      saloonImage,
      saloonImage,
    ];
    List<String> titles = [
      "Hi",
      "Hi",
      "Hi",
      "Hi",
      "Hi",
    ];

    return SingleChildScrollView(
      child: Container(
        color: dimRedColor,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Center East Delhi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      // Implement navigation to all services
                    },
                    child: const Text('View All',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            ExpandablePageView.builder(
              controller: _pageController,
              animateFirstPage: true,
              estimatedPageSize: 100,
              itemCount: images.length,
              itemBuilder: (context, index) {
                final double scale = (_currentPage - index).abs().clamp(0.0, 1.0);
                final double currentScale = 1 - (scale * 0.1);
                final double currentOpacity = 1 - (scale * 0.5);

                return Transform.scale(
                  scale: currentScale,
                  child: Opacity(
                    opacity: currentOpacity,
                    child: IntrinsicHeight(
                      child: SalonCard(
                        image: images[index],
                        title: titles[index],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text("UNDER PAGE VIEW WIDGET"),
          ],
        ),
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  final String image;
  final String title;

  const SalonCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: AspectRatio(
              aspectRatio: 2 / 1,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Text(
                      'Rohini, New Delhi',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.green,
                          size: 16,
                        ),
                        Text(
                          '3.1 Km',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ambience Rating',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Row(
                      children: List.generate(4, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                    const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '4.5/5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '482 Reviews',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const KCustomButton(
                  buttonText: "Book Appointment",
                  radius: 70,
                  verticalPadding: 10,
                  iconChild: Icon(Icons.arrow_forward_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
