import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/src/settings/router/app_router.dart';

enum BottomNavItem {
  home,
  search,
  favorites,
  profile,
}

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key,required this.title});

  final String title;

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  BottomNavItem _selectedItem = BottomNavItem.home;

  void _onItemTapped(BottomNavItem item) {
    setState(() {
      _selectedItem = item;
      context.goNamed(_selectedItem.name);
      print(_selectedItem.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: NotchPainter(),
              child: SizedBox(
                height: 80,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: SizedBox(
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: _selectedItem.index,
                        onTap: (index) => _onItemTapped(BottomNavItem.values[index]),
                        enableFeedback: false,
                        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                        mouseCursor: SystemMouseCursors.click,
                        selectedItemColor: Colors.white,
                        unselectedItemColor: Colors.white70,
                        showSelectedLabels: true,
                        showUnselectedLabels: true,
                        selectedFontSize: 9,
                        unselectedFontSize: 9,
                        iconSize: 22,
                        selectedLabelStyle: const TextStyle(
                          height: 0.8,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w400,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          height: 0.8,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w400,
                        ),
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: 'Inicio',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.search),
                            label: 'Buscar',
                          ),
                          BottomNavigationBarItem(
                            icon: SizedBox(width: 0, height: 0),
                            label: '',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.favorite),
                            label: 'Favoritos',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person),
                            label: 'Perfil',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                elevation: 3,
                backgroundColor: const Color(0xFF4A90E2),
                shape: const CircleBorder(),
                onPressed: () {
                  // Acción del botón flotante
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D2D2D)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.35, 0)
      ..quadraticBezierTo(
        size.width * 0.40,
        0,
        size.width * 0.45,
        25,
      )
      ..quadraticBezierTo(
        size.width * 0.5,
        45,
        size.width * 0.55,
        25,
      )
      ..quadraticBezierTo(
        size.width * 0.60,
        0,
        size.width * 0.65,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path, Colors.black26, 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
