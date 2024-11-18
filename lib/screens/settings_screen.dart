import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.getFont(themeProvider.currentFont, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Select Theme
              Text(
                'Select Theme:',
                style: GoogleFonts.getFont(themeProvider.currentFont,
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                ThemeProvider.themes.length,
                (index) => Card(
                  elevation: 2, // Tambahkan efek bayangan agar seragam
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    tileColor: Colors.white, // Sama seperti Select Font
                    title: Text(
                      'Theme ${String.fromCharCode(65 + index)}',
                      style: GoogleFonts.getFont(
                        themeProvider.currentFont,
                        color: Colors.black, // Warna teks seragam dengan Select Font
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio<int>(
                      value: index,
                      groupValue: ThemeProvider.themes.indexWhere(
                          (theme) => theme.themeData ==
                              themeProvider.currentTheme),
                      onChanged: (value) {
                        themeProvider.changeTheme(value!);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Section: Select Font
              Text(
                'Select Font:',
                style: GoogleFonts.getFont(themeProvider.currentFont,
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...ThemeProvider.themes.map((theme) {
                return Card(
                  elevation: 2, // Sama seperti Select Theme
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    tileColor: Colors.white, // Warna kartu seragam
                    title: Text(
                      theme.font,
                      style: GoogleFonts.getFont(theme.font,
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio<String>(
                      value: theme.font,
                      groupValue: themeProvider.currentFont,
                      onChanged: (value) {
                        themeProvider.changeFont(value!);
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
