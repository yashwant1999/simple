import 'package:flutter/material.dart';
import 'package:simple/pages/full_view.dart';
import 'package:simple/widgets/rating_widget.dart';
import 'package:simple/widgets/scrim.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        title: const Text('Hello, Vinetta'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.laptop_mac),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Where do you \n want to explore today?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF6F6F6)),
            ),
            const SizedBox(
              height: 20,
            ),
            const CategoryView(),
            const SizedBox(
              height: 20,
            ),
            const HorizontalView(),
            const PopularPackageView(),
          ],
        ),
      )),
    );
  }
}

class PopularPackageView extends StatelessWidget {
  const PopularPackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Popular Package',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('see all')
          ],
        ),
        SingleChildScrollView(
            child: Column(children: const [
          PopularPakageItem(),
          PopularPakageItem(),
          PopularPakageItem()
        ]))
      ]),
    );
  }
}

class PopularPakageItem extends StatelessWidget {
  const PopularPakageItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300)),
        height: 150,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://housing.com/news/wp-content/uploads/2022/11/All-about-coconut-tree.jpg',
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Kuta Resort ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    '\$20,000',
                    style: TextStyle(color: Colors.red),
                  ),
                  StarRating(
                    rating: 3.4,
                    size: 20,
                    textColor: Colors.black,
                  ),
                  Text(
                    'A resort is place for vacation, enjoyment and fun',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalView extends StatelessWidget {
  const HorizontalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: const [
        HorizontalViewItems(),
        HorizontalViewItems(),
        HorizontalViewItems(),
      ]),
    );
  }
}

class HorizontalViewItems extends StatelessWidget {
  const HorizontalViewItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FullView(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: const BoxDecoration(),
            width: 150,
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://housing.com/news/wp-content/uploads/2022/11/All-about-coconut-tree.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.heart_broken,
                        size: 20,
                        color: Colors.red,
                      ),
                    )),
                const Positioned.fill(
                    child: Scrim(
                  opacity: 0.7,
                )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kota Beach',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Bal, Indonesia',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                      const StarRating(
                          rating: 3.5, size: 20, color: Colors.yellow),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Choose Category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('see all')
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CategoryItem(),
            CategoryItem(),
            CategoryItem(),
          ],
        ),
      )
    ]);
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
                'https://www.shutterstock.com/image-vector/vector-illustration-palm-tree-260nw-416966323.jpg'),
            const Text('Beach')
          ],
        ),
      ),
    );
  }
}
