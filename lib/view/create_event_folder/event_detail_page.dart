import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vooluntee/my_widgets/colors.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Agege Park Cleanup',
              style: GoogleFonts.raleway(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Subtitle
            Text(
              'SYSUP Groups',
              style: GoogleFonts.raleway(color: Colors.black54),
            ),
            const SizedBox(height: 25),
            // Description text
            //this text would display the description from the details of
            //the organizer's create event form.
            Text(
              'In accordance to SDG4, we would be launching out to Obadore for a brief session of clean up and envireonment cleanliness awareness movement.',
              style: GoogleFonts.raleway(color: Colors.black87, height: 1.4),
            ),
            const SizedBox(height: 25),

            //location
            Row(
              spacing: 20,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.secondary,
                ),
                Text(
                  'Solutions Arena, Agege, Lagos',
                  style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            //timeframe
            Row(
              spacing: 20,
              children: [
                Icon(
                  Icons.timeline,
                  color: AppColors.primary,
                ),
                //display info from event creation form
                Text(
                  '4pm - 6pm',
                  style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 25),
            // Organizer info
            Text(
              'Organizer info',
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 16,
              children: [
                // Badge card
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Badges',
                      style: GoogleFonts.raleway(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Badge icon 2010
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.orange[200],
                  child: const Icon(Icons.emoji_events, color: Colors.white),
                ),
                // Badge icon 0000
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red[200],
                  child: const Icon(Icons.local_fire_department,
                      color: Colors.white),
                ),
                const SizedBox(height: 4),
              ],
            ),
            const SizedBox(height: 24),
            // Hours volunteered title
            Text(
              'Hours volunteered',
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            Text('70', style: GoogleFonts.raleway(fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            // Hours volunteered title
            Text(
              'Events organized',
              style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
            ),
            Text('10', style: GoogleFonts.raleway(fontWeight: FontWeight.w500)),
            const SizedBox(height: 24),
            Text(
              'Find more details on www.sysup.com',
              style: GoogleFonts.raleway(color: Colors.black54),
            ),
            Text(
              'Tel.: +234 8012345677',
              style: GoogleFonts.raleway(color: Colors.black54),
            ),
            Text(
              'Mail: synuplagos@gmail.com',
              style: GoogleFonts.raleway(color: Colors.black54),
            ),
            const Spacer(),
            // Join button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'Join',
                  style: GoogleFonts.raleway(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
