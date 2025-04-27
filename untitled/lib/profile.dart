import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsProfileScreen extends StatelessWidget {
  const SettingsProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusBar(),
                      const SizedBox(height: 45),
                      Text(
                        'Settings',
                        style: GoogleFonts.raleway(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF202020),
                          height: 1,
                          letterSpacing: -0.28,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Your Profile',
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          height: 1,
                          letterSpacing: -0.16,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Center(
                        child: Image.network(
                          'https://cdn.builder.io/api/v1/image/assets/TEMP/55d907a645a5d12a0c3df4358ca8fd59ad340214?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                          width: 105,
                          height: 105,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInputField('Romina', weight: FontWeight.w400),
                      const SizedBox(height: 10),
                      _buildInputField('gmail@example.com'),
                      const SizedBox(height: 10),
                      _buildInputField('************'),
                      const SizedBox(height: 218),
                      _buildSaveButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  // child: Image.network(
                  //   'https://cdn.builder.io/api/v1/image/assets/TEMP/2bf392a41e7117f487e48f9beaa2042727f9a55b?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
                  //   width: double.infinity,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          // Row(
          //   children: [
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/94c04ae2a34f41b7ebc51be6683056f9d9997ab5?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 17,
          //       height: 10,
          //       fit: BoxFit.contain,
          //     ),
          //     const SizedBox(width: 5),
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/decb808e0ccfbafe1b4ce11553cd0e3952a1a3c6?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 15,
          //       height: 11,
          //       fit: BoxFit.contain,
          //     ),
          //     const SizedBox(width: 5),
          //     Image.network(
          //       'https://cdn.builder.io/api/v1/image/assets/TEMP/b7e1a147832da4504704854985e7a2c4dba162e7?placeholderIfAbsent=true&apiKey=c1a770d5efc842ad9b9b4a132f585b39',
          //       width: 24,
          //       height: 12,
          //       fit: BoxFit.contain,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildInputField(String text, {FontWeight weight = FontWeight.w500}) {
    return Container(
      width: 335,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4FE),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontSize: 17,
          fontWeight: weight,
          color: Colors.black,
          height: 1,
          letterSpacing: -0.17,
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF004CFF),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        'Save Changes',
        style: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: const Color(0xFFF3F3F3),
          height: 2,
        ),
      ),
    );
  }
}