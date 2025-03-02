import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quote.dart';

class QuoteDetailsScreen extends StatelessWidget {
  final Quote quote;
  const QuoteDetailsScreen(this.quote, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Quote Details',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF004D40), Color(0xFF009688)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80), // Gap between header and image
                // Image with rounded corners
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    quote.imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/axill_logo-removebg-preview-150x150.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Gap between image and content

                // Quote Text
                Text(
                  '"${quote.quote}"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                // Author
                Text(
                  '- ${quote.author}',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.yellowAccent),
                ),
                const SizedBox(height: 20),

                // Details
                Text(
                  quote.details,
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
