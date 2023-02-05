import 'package:flutter/material.dart';
import 'package:simple/widgets/scrim.dart';

import '../widgets/rating_widget.dart';

class FullView extends StatelessWidget {
  const FullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://housing.com/news/wp-content/uploads/2022/11/All-about-coconut-tree.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned.fill(
                child: Scrim(
              opacity: 0.7,
            )),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                ),
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
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Kota Beach',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Bal, Indonesia',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquam lacinia turpis, ac consequat magna volutpat sed. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis quis ipsum ac elit pharetra euismod. Donec euismod purus vel dapibus lobortis. Nunc venenatis sollicitudin viverra. Ut ultrices turpis id mollis lobortis. Sed vulputate tellus nisl, porttitor auctor nisl rhoncus eget. Etiam vestibulum urna vel nunc blandit consectetur. Nam ut commodo massa. Vestibulum ut commodo nisl, ac porttitor ex. Sed a efficitur elit. Ut tellus metus, luctus quis dui maximus, faucibus mollis massa. Duis elementum in tortor ut fringilla.",
                    maxLines: 5,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const StarRating(rating: 3.5, size: 20, color: Colors.yellow),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$15,000/person',
                        style: TextStyle(color: Colors.white),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow),
                          onPressed: () {},
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
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
