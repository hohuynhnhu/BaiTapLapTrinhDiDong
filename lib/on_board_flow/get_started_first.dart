import 'package:flutter/material.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'titles': 'Easy Time Management',
      'description':
      'Time management and the determination of more important tasks will give your job statistics better and always improve',
      'image': 'assets/first.jpg',
    },
    {
      'titles': 'Increase Work Effectiveness',
      'description':
      'Time management and the determination of more important tasks will give your job statistics better and always improve',
      'image': 'assets/second.jpg',
    },
    {
      'titles': 'Reminder Notification',
      'description':
      'The advantage of this application is that it also provides reminders so you don’t forget to keep doing your assignments well and according to the time you have set',
      'image': 'assets/third.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const UIComponent()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(onboardingData.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: _currentIndex == index ? 12 : 8,
              height: _currentIndex == index ? 12 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),

      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final page = onboardingData[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Hình ảnh ---
                Image.asset(
                  page['image']!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // --- Tiêu đề ---
                Text(
                  page['titles']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // --- Mô tả ---
                Text(
                  page['description']!,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 150),

                // --- Hàng nút Back / Next ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Nút Back
                    IconButton(
                      icon:
                      const Icon(Icons.arrow_back, color: Colors.blue),
                      onPressed: _currentIndex > 0
                          ? () {
                        _controller.previousPage(
                          duration:
                          const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                          : null,
                    ),

                    // Nút Next / Get Started
                    ElevatedButton(
                      onPressed: () {
                        if (_currentIndex < onboardingData.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UIComponent()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        _currentIndex < onboardingData.length - 1
                            ? 'Next'
                            : 'Get Started',
                        style: const TextStyle(
                            fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- Màn hình sau khi Skip hoặc Next ---
class UIComponent extends StatelessWidget {
  const UIComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Component')),
      body: const Center(
        child: Text(
          'Đây là màn hình UIComponent',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
