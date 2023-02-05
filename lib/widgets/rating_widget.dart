import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final double size;
  final Color color;
  final Color textColor;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0,
    this.size = 30,
    this.color = Colors.yellow,
    this.textColor = Colors.white,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.starCount,
                (index) => Icon(
                  Icons.star,
                  size: widget.size,
                  color: index >= widget.rating
                      ? widget.color.withOpacity(0.5)
                      : widget.color,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.starCount,
                (index) => SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: ClipRect(
                    clipper: StarClipper(index + 1 - widget.rating),
                    child: Icon(
                      Icons.star,
                      size: widget.size,
                      color: widget.color,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          "${widget.rating}",
          style: TextStyle(
              fontSize: widget.size - 5,
              color: widget.textColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class StarClipper extends CustomClipper<Rect> {
  final double rating;

  StarClipper(this.rating);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, rating * size.width / 5, size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) => oldClipper.rating != rating;
}
