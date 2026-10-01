import 'package:flutter/material.dart';
import 'package:flutter_widget_app/flutter_widget_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScaleUtil.init(context, designSize: Size(560, 1268));
    return MaterialApp(
      title: 'Flutter Widget App Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget App Showcase'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contributor Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.indigo, Colors.deepPurple],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Flutter Widget App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 1. Gradient Text Section
            const Text(
              'Gradient Text',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: GradientText(
                  'Stunning Gradient Typography',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  colors: const [Colors.purple, Colors.orange, Colors.pink],
                  gradientDirection: GradientDirection.ltr,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. Tinted Clicker (Buttons & Animations)
            const Text(
              'Tinted Clicker & Animations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TintedClicker(
                    mode: TintedClickerMode.both,
                    color: Colors.black26,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tinted Clicker tapped!')),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Tap Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TintedClicker(
                    mode: TintedClickerMode.onlyAnim,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Scale Clicker tapped!')),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Scale Only',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Custom Switch Section
            const Text(
              'Custom Switch',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Enable Feature', style: TextStyle(fontSize: 16)),
                  CustomSwitch(
                    value: _switchValue,
                    onChanged: (val) {
                      setState(() {
                        _switchValue = val;
                      });
                    },
                    activeTrackColor: Colors.indigo,
                    inactiveTrackColor: Colors.grey.shade300,
                    activeThumbColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. Sliding Segment Bar Section
            const Text(
              'Sliding Segment Bars',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Sliding Style:', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  SlidingSegmentBar(
                    style: SegmentBarStyle.sliding,
                    height: 4,
                    fillGradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Growing Style:', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  SlidingSegmentBar(
                    style: SegmentBarStyle.growing,
                    height: 6,
                    fillColor: Colors.teal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 5. Shimmer Section
            const Text(
              'Shimmer Loading Placeholder',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 200,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ),


            // 6. PressUnPressWidget
            PressUnpressWidget(
              onTap: () {

              },
              widget: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: const Text(
                  'PressUnpressWidget',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
