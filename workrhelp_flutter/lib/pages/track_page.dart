import 'package:flutter/material.dart';
import 'package:workrhelp_flutter/components/abs_text.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AbsText(text: "Requests", fontSize: 24, headColor: true),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- 8px radius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.man_3, color: Colors.blue, size: 25),
                      const SizedBox(width: 10),
                      AbsText(
                        text: "Track Request",
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // <-- 8px radius
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.history, color: Colors.blue, size: 25),
                      const SizedBox(width: 10),
                      AbsText(
                        text: "History",
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
