// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class DetailsPage extends StatefulWidget {
//   final String mealId;

//   const DetailsPage({super.key, required this.mealId});

//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   Map<String, dynamic>? meal;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchMealDetails();
//   }

//   Future<void> fetchMealDetails() async {
//     final response = await Dio().get(
//       "https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealId}",
//     );

//     setState(() {
//       meal = response.data["meals"][0];
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       backgroundColor: const Color(0xFF1C1C1E),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Top Image Section
//             Stack(
//               children: [
//                 Image.network(
//                   meal!["strMealThumb"],
//                   height: 320,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),

//                 Positioned(
//                   top: 40,
//                   left: 20,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white24,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                 ),

//                 Positioned(
//                   top: 40,
//                   right: 70,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white24,
//                     child: Icon(Icons.favorite_border, color: Colors.white),
//                   ),
//                 ),

//                 Positioned(
//                   top: 40,
//                   right: 20,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white24,
//                     child: Icon(Icons.share, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),

//             // Details Section
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF2C2C2E),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Meal Name & Rating
//                   Row(
                    
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
                      
//                       SingleChildScrollView(
                        
//                         scrollDirection: Axis.horizontal,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.7,

//                           child: Text(
//                             meal!["strMeal"],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: const [
//                           Icon(Icons.star, color: Colors.yellow, size: 22),
//                           SizedBox(width: 5),
//                           Text("4.7", style: TextStyle(color: Colors.white)),
//                         ],
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 10),

//                   Text(
//                     "Country: ${meal!["strArea"]}",
//                     style: const TextStyle(color: Colors.white60),
//                   ),

//                   const SizedBox(height: 20),
//                   const Text(
//                     "Description",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 10),
//                   Text(
//                     meal!["strInstructions"],
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(color: Colors.white70),
//                   ),

//                   const SizedBox(height: 15),
//                   const Text(
//                     "Ingredients",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   // Ingredients Grid
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: 20, // TheMealDB gives up to 20 ingredients
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       childAspectRatio: 0.8,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                     ),
//                     itemBuilder: (context, index) {
//                       final ing = meal!["strIngredient${index + 1}"];
//                       final measure = meal!["strMeasure${index + 1}"];

//                       if (ing == null || ing.isEmpty) return const SizedBox();

//                       return Column(
//                         children: [
//                           Image.network(
//                             "https://www.themealdb.com/images/ingredients/$ing.png",
//                             height: 60,
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             ing,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             measure,
//                             style: const TextStyle(color: Colors.white54),
//                           ),
//                         ],
//                       );
//                     },
//                   ),

//                   const SizedBox(height: 40),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }











import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final String mealId;

  const DetailsPage({super.key, required this.mealId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map<String, dynamic>? meal;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMealDetails();
  }

  Future<void> fetchMealDetails() async {
    try {
      final response = await Dio().get(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=${widget.mealId}",
      );

      setState(() {
        meal = response.data["meals"][0];
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching meal details: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _launchVideo() async {
    final url = meal?["strYoutube"];

    if (url == null || !url.startsWith("http")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No valid video available")),
      );
      return;
    }

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open video")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (meal == null) {
      return const Scaffold(
        body: Center(child: Text("Meal not found")),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image Section
            Stack(
              children: [
                Image.network(
                  meal!["strMealThumb"],
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Back Button
                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                // Favorite Button
                Positioned(
                  top: 40,
                  right: 70,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),

                // Share Button
                Positioned(
                  top: 40,
                  right: 20,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.share, color: Colors.white),
                  ),
                ),

                // Video Play Button at Bottom Center
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: _launchVideo,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.play_circle_fill,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Details Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meal Name & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            meal!["strMeal"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.yellow, size: 22),
                          SizedBox(width: 5),
                          Text("4.7", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Country: ${meal!["strArea"]}",
                    style: const TextStyle(color: Colors.white60),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text(
                    meal!["strInstructions"],
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 15),
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Ingredients Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final ing = meal!["strIngredient${index + 1}"];
                      final measure = meal!["strMeasure${index + 1}"];

                      if (ing == null || ing.isEmpty) return const SizedBox();

                      return Column(
                        children: [
                          Image.network(
                            "https://www.themealdb.com/images/ingredients/$ing.png",
                            height: 60,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ing,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            measure,
                            style: const TextStyle(color: Colors.white54),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
