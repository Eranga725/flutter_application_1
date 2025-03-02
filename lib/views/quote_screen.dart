import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/quote_controller.dart';
import 'quote_details_screen.dart';

class QuoteScreen extends StatelessWidget {
  final QuoteController controller = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF004D40),
                  Color(0xFF009688)
                ], // Dark to light green
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category Selector
                  Text(
                    'Select Category',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 81, 180, 149),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedCategory.value,
                            dropdownColor:
                                const Color.fromARGB(179, 104, 218, 176),
                            items: ['Motivational', 'Finance', 'Romance']
                                .map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category,
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            221, 255, 255, 255))),
                              );
                            }).toList(),
                            onChanged: (newCategory) {
                              controller.selectedCategory.value = newCategory!;
                              controller.fetchRandomQuote();
                            },
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),

                  // Quote Card with Glassmorphism Effect
                  Obx(() => GestureDetector(
                        onTap: () => Get.to(() =>
                            QuoteDetailsScreen(controller.currentQuote.value)),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                Colors.white.withOpacity(0.2), // Glass effect
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                '"${controller.currentQuote.value.quote}"',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(color: Colors.black38, blurRadius: 3)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '- ${controller.currentQuote.value.author}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.yellowAccent,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  const SizedBox(height: 30),

                  // "New Quote" Button with Modern Design
                  ElevatedButton.icon(
                    onPressed: controller.fetchRandomQuote,
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: Text(
                      'New Quote',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[700],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
