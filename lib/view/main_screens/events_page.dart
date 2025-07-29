import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vooluntee/my_widgets/colors.dart';
import 'package:vooluntee/view/create_event_folder/event_detail_page.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NearbyEventsScreen(),
      ),
    );
  }
}

class NearbyEventsScreen extends StatelessWidget {
  const NearbyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Nearby', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Sort', style: TextStyle(color: Colors.black)),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Buttons row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('0 routes viewed'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Record'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Map placeholder
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.location_on, size: 40, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 16),
            // Nearby/Events section
            Text(
              'UpComing Events',
              style: GoogleFonts.raleway(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Details section
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventDetailPage()));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(79, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SynsUp Groups',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Event: Agege CarPark Clean Up',
                      style: GoogleFonts.raleway(
                          color: Colors.black54, fontSize: 13),
                    ),
                    const Divider(),
                    Row(
                      spacing: 15,
                      children: [
                        Icon(Icons.location_on, color: Colors.green[600]),

                        //display info from event creation form
                        Text(
                          'Comment Heads 5 Park',
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(34, 227, 139, 91),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            spacing: 15,
                            children: [
                              Icon(
                                Icons.timeline,
                                color: AppColors.primary,
                              ),
                              //display info from event creation form
                              Text(
                                '4pm - 6pm',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Step 2: Enable Google Maps API

// Go to Google Cloud Console.

// Enable the Maps SDK for Android and/or Maps SDK for iOS.

// Create an API key.

// Add your API key in the proper place:

// Android → android/app/src/main/AndroidManifest.xml:


// <manifest>
//   <application>
//     <meta-data android:name="com.google.android.geo.API_KEY"
//                android:value="YOUR_API_KEY"/>
//   </application>
// </manifest>

//for iOS → 
//ios/Runner/AppDelegate.swift (or in AppDelegate.m if Objective-C) and Info.plist.

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class NearbyEventsScreen extends StatefulWidget {
//   const NearbyEventsScreen({super.key});

//   @override
//   State<NearbyEventsScreen> createState() => _NearbyEventsScreenState();
// }

// class _NearbyEventsScreenState extends State<NearbyEventsScreen> {
//   late GoogleMapController mapController;

//   final LatLng _center = const LatLng(37.7749, -122.4194); // example coords (San Francisco)

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nearby', style: TextStyle(fontWeight: FontWeight.bold)),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: const Text('Sort', style: TextStyle(color: Colors.black)),
//           ),
//         ],
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Buttons row
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                       foregroundColor: Colors.black,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: const Text('0 routes viewed'),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.grey[200],
//                     foregroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   ),
//                   child: const Text('Record'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Google Map
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: SizedBox(
//                 height: 150,
//                 child: GoogleMap(
//                   onMapCreated: _onMapCreated,
//                   initialCameraPosition: CameraPosition(
//                     target: _center,
//                     zoom: 14.0,
//                   ),
//                   markers: {
//                     Marker(
//                       markerId: const MarkerId('nearbyMarker'),
//                       position: _center,
//                       infoWindow: const InfoWindow(title: 'Event Location'),
//                     ),
//                   },
//                   zoomControlsEnabled: false,
//                   myLocationEnabled: false,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Nearby/Events section
//             const Text(
//               'Nearby/Events',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             ListTile(
//               leading: Icon(Icons.location_on, color: Colors.green[600]),
//               title: const Text('Comment Heads 5 Park'),
//               subtitle: const Text('2+ all – 5 to PM'),
//               contentPadding: EdgeInsets.zero,
//             ),
//             const Divider(),
//             // Details section
//             const Text(
//               'Details: pntine',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             const Text(
//               'Lorenn ipoum public leolath poils\nNalaata coooinuerm eroeroemaa',
//               style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
