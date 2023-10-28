import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String animation;
  final double width;
  final double height;
  final Color? color;
  final int? red;
  final int? green;
  final int? blue;

  const HomeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animation,
    required this.width,
    required this.height,
    this.color,
    this.red,
    this.green,
    this.blue,
  });

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.red != null
          ? Color.fromRGBO(widget.red!, widget.green!, widget.blue!, 1.0)
          : widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      margin: const EdgeInsets.only(top: 10, right: 20, bottom: 0, left: 20),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final isSmallScreen = availableWidth < 600;

            return Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: isSmallScreen ? 10 : 40,
                      left: isSmallScreen ? 10 : 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: isSmallScreen ? 18 : 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 10 : 30),
                        Text(
                          widget.subtitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallScreen ? 12 : 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: Lottie.asset(
                    widget.animation, // Caminho para o arquivo .json
                    height: isSmallScreen ? widget.height * 0.7 : widget.height,
                    width: isSmallScreen ? widget.width * 0.7 : widget.width,
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
