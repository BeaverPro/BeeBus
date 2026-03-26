import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Where?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search destinations',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black87,
                    size: 28,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Suggested destinations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildDestinationItem(
              icon: Icons.near_me_outlined,
              iconColor: Colors.blue.shade600,
              iconBgColor: Colors.blue.shade50,
              title: 'Nearby',
              subtitle: "Find what's around you",
            ),
            const SizedBox(height: 20),
            _buildDestinationItem(
              icon: Icons.beach_access_outlined,
              iconColor: Colors.brown.shade600,
              iconBgColor: const Color(0xFFFDF6E3), // Soft sand color
              title: 'North Goa, Goa',
              subtitle: 'Popular beach destination',
            ),
            const SizedBox(height: 20),
            _buildDestinationItem(
              icon: Icons.holiday_village_outlined,
              iconColor: Colors.green.shade800,
              iconBgColor: Colors.green.shade50,
              title: 'South Goa, Goa',
              subtitle: 'For sights like Basilica of Bom Jesus',
            ),
            const SizedBox(height: 20),
            _buildDestinationItem(
              icon: Icons.beach_access_outlined,
              iconColor: Colors.brown.shade600,
              iconBgColor: const Color(0xFFFDF6E3), // Soft sand color
              title: 'Calangute, Goa',
              subtitle: 'For its bustling nightlife',
            ),
            const SizedBox(height: 120), // Space for bottom nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
