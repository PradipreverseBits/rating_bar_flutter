import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/gauge_rating_bar.dart';
import '../theme.dart';

@RoutePage()
class GaugeRatingScreen extends StatefulWidget {
  const GaugeRatingScreen({super.key});

  @override
  State<GaugeRatingScreen> createState() => _GaugeRatingScreenState();
}

class _GaugeRatingScreenState extends State<GaugeRatingScreen> {
  int _gaugeScore = 171;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar:AppBar(
        title: const Text('Gauge Rating'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppStyle.sp24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppStyle.sp32 * 2),
              Text(
                'Interactive Gauge Rating',
                style: AppStyle.heading.copyWith(
                  color: AppStyle.textDark,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              Center(
                child: GaugeRatingBar(
                  score: _gaugeScore,
                  maxScore: 999,
                  onScoreChanged: (newScore) {
                    setState(() {
                      _gaugeScore = newScore;
                    });
                  },
                ),
              ),
              const SizedBox(height: AppStyle.sp32 * 2),
              Center(
                child: Text(
                  'Current Score: $_gaugeScore',
                  style: AppStyle.subheading.copyWith(
                    color: AppStyle.textDark,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: AppStyle.sp16),
              Center(
                child: Text(
                  'Drag the indicator to change the score',
                  style: AppStyle.body.copyWith(
                    color: AppStyle.textGreyLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
