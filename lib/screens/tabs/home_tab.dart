import 'package:flutter/material.dart';

enum SearchStep { where, when }

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  SearchStep _currentStep = SearchStep.where;
  String _selectedCategory = 'Bus';
  String? _selectedDestination;
  String _dateTab = 'Dates';
  String _flexibility = 'Exact dates';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5), // Light grey background like in the image
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildCategoryRow(),
            const SizedBox(height: 8),
            if (_currentStep == SearchStep.when) _buildCollapsedWhereCard(),
            if (_currentStep == SearchStep.where) Expanded(child: _buildWhereExpanded()),
            if (_currentStep == SearchStep.when) Expanded(child: _buildWhenExpanded()),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedWhereCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentStep = SearchStep.where;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Where',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              _selectedDestination ?? 'Select destination',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhereExpanded() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
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
                iconBgColor: const Color(0xFFFDF6E3),
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
                iconBgColor: const Color(0xFFFDF6E3),
                title: 'Calangute, Goa',
                subtitle: 'For its bustling nightlife',
              ),
              const SizedBox(height: 120),
            ],
          ),
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
    return InkWell(
      onTap: () {
        setState(() {
          _selectedDestination = title == 'Nearby' ? 'Current Location' : title;
          _currentStep = SearchStep.when;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
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
        ),
      ),
    );
  }

  Widget _buildWhenExpanded() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'When?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSegmentedControl(),
                    const SizedBox(height: 32),
                    _buildWeekdaysRow(),
                    const SizedBox(height: 16),
                    _buildCalendarMonth('March 2026', 15, 31, 26, startDayOffset: 0),
                    const SizedBox(height: 32),
                    _buildCalendarMonth('April 2026', 1, 30, 1, startDayOffset: 3), // Starts on Wednesday
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
            _buildFlexibilityBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _buildSegmentTab('Dates'),
          _buildSegmentTab('Months'),
          _buildSegmentTab('Flexible'),
        ],
      ),
    );
  }

  Widget _buildSegmentTab(String text) {
    final isSelected = _dateTab == text;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _dateTab = text;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(21),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.black87 : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeekdaysRow() {
    const days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((e) => Expanded(
          child: Center(
            child: Text(
              e, 
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
            ),
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildCalendarMonth(String title, int startDate, int endDate, int activeFrom, {int startDayOffset = 0}) {
    List<Widget> gridItems = [];
    
    // Add empty slots for the offset
    for (int i = 0; i < startDayOffset; i++) {
      gridItems.add(const SizedBox.shrink());
    }

    // Add days
    for (int i = startDate; i <= endDate; i++) {
      bool isActive = i >= activeFrom;
      gridItems.add(
        Center(
          child: Text(
            i.toString(),
            style: TextStyle(
              fontSize: 17,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive ? Colors.black87 : Colors.grey.shade400,
              decoration: isActive ? TextDecoration.none : TextDecoration.lineThrough,
              decorationColor: Colors.grey.shade400,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, 
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.0,
          children: gridItems,
        ),
      ],
    );
  }

  Widget _buildFlexibilityBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFlexChip('Exact dates'),
            const SizedBox(width: 12),
            _buildFlexChip('± 1 day'),
            const SizedBox(width: 12),
            _buildFlexChip('± 2 days'),
            const SizedBox(width: 12),
            _buildFlexChip('± 3 days'),
          ],
        ),
      ),
    );
  }

  Widget _buildFlexChip(String text) {
    final isSelected = _flexibility == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _flexibility = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? Colors.black87 : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryItem(Icons.directions_bus_rounded, 'Bus'),
          const SizedBox(width: 12),
          _buildCategoryItem(Icons.hotel_rounded, 'Stays'),
          const SizedBox(width: 12),
          _buildCategoryItem(Icons.restaurant_rounded, 'Food'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    final isSelected = _selectedCategory == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black87 : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey.shade700,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
