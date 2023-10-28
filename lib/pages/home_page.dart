import 'package:atividade_flutter/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 59, 65, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCard(
              title: "Conversão de Moedas",
              subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing"
                  "elit. Fusce ac augue sit amet odio porttitor imperdiet"
                  "quis at dui. Vivamus id semper enim. Sed interdum "
                  "nunc magna, id vulputate ex iaculis sed. Nulla eu"
                  "massa pretium, dignissim ante non, scelerisque "
                  "tortor. Praesent sollicitudin nibh id egestas "
                  " malesuada. Suspendisse eu nisl sed nisl placerat"
                  "sodales et non lacus. Ut in turpis tincidunt, auctor"
                  "quam at, aliquet lorem. Suspendisse potenti. Nulla "
                  "condimentum diam enim, a ultricies libero dapibus ",
              animation: 'assets/animation_currency.json',
              color: Colors.purple.shade300,
              width: 250,
              height: 250,
            ),
            HomeCard(
              title: "Indices e taxas",
              subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing"
                  "elit. Fusce ac augue sit amet odio porttitor imperdiet"
                  "quis at dui. Vivamus id semper enim. Sed interdum "
                  "nunc magna, id vulputate ex iaculis sed. Nulla eu"
                  "massa pretium, dignissim ante non, scelerisque "
                  "tortor. Praesent sollicitudin nibh id egestas "
                  " malesuada. Suspendisse eu nisl sed nisl placerat"
                  "sodales et non lacus. Ut in turpis tincidunt, auctor"
                  "quam at, aliquet lorem. Suspendisse potenti. Nulla "
                  "condimentum diam enim, a ultricies libero dapibus ",
              animation: 'assets/animation_index.json',
              color: Colors.yellow.shade900,
              width: 250,
              height: 250,
            ),
            HomeCard(
              title: "Bolsa de ações",
              subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing"
                  "elit. Fusce ac augue sit amet odio porttitor imperdiet"
                  "quis at dui. Vivamus id semper enim. Sed interdum "
                  "nunc magna, id vulputate ex iaculis sed. Nulla eu"
                  "massa pretium, dignissim ante non, scelerisque "
                  "tortor. Praesent sollicitudin nibh id egestas "
                  " malesuada. Suspendisse eu nisl sed nisl placerat"
                  "sodales et non lacus. Ut in turpis tincidunt, auctor"
                  "quam at, aliquet lorem. Suspendisse potenti. Nulla "
                  "condimentum diam enim, a ultricies libero dapibus ",
              animation: 'assets/animation_stocks.json',
              color: Colors.green.shade300,
              width: 250,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
