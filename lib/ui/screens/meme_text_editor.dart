import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemeTextEditor extends StatelessWidget {
  const MemeTextEditor({Key? key}) : super(key: key);
  static const List<String> _fonts = [
    'Roboto',
    'Monoton',
    'Lato',
    'Oswald',
    'Raleway',
    'Macondo',
    'Smooch',
    'Odibee Sans',
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                style: GoogleFonts.getFont(
                  _fonts[1],
                ),
              ),
              SizedBox.fromSize(
                size: Size(0, 20),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._fonts.map(
                      (e) => Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            e,
                            style: GoogleFonts.getFont(e),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
