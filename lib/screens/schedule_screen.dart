import 'package:flutter/material.dart';
import '../services/schedule_service.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late Future<List<dynamic>> schedules;
  final Set<int> _favoriteIndices = {};
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  String _selectedStatus = 'ALL'; // ALL, VACANT, OCCUPIED

  @override
  void initState() {
    super.initState();
    schedules = ScheduleService.getSchedules();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Filter by Status',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    children: ['ALL', 'VACANT', 'OCCUPIED'].map((status) {
                      final isSelected = _selectedStatus == status;
                      return ChoiceChip(
                        label: Text(status),
                        selected: isSelected,
                        selectedColor: const Color(0xFFF59E0B),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF111827),
                          fontWeight: FontWeight.w700,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setModalState(() => _selectedStatus = status);
                            setState(() => _selectedStatus = status);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1C1C1E)),
              child: Text(
                'RoomSeek',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.meeting_room_outlined),
              title: Text('All Rooms'),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Color(0xFF4B5563),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'RoomSeek',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),

            // TITLE
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 18, 20, 16),
              child: Text(
                'List of Rooms',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                ),
              ),
            ),

            // SEARCH & FILTER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() => _searchQuery = value.trim().toLowerCase());
                        },
                        decoration: InputDecoration(
                          hintText: 'Search room number...',
                          hintStyle: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF9CA3AF),
                            size: 20,
                          ),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.close, size: 18),
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() => _searchQuery = '');
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _showFilterSheet,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1C1E),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Color(0xFFFACC15),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ROOM LIST
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: schedules,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final allItems = snapshot.data ?? [];

                  final filteredItems = allItems.where((schedule) {
                    final roomInfo = schedule['roomInfo'] ?? {};
                    final roomNumber =
                        (roomInfo['roomNumber'] ?? '').toString().toLowerCase();
                    final isOccupied = schedule['isOccupied'] == true;

                    final matchesSearch = roomNumber.contains(_searchQuery);
                    final matchesStatus = _selectedStatus == 'ALL' ||
                        (_selectedStatus == 'OCCUPIED' && isOccupied) ||
                        (_selectedStatus == 'VACANT' && !isOccupied);

                    return matchesSearch && matchesStatus;
                  }).toList();

                  if (filteredItems.isEmpty) {
                    return const Center(
                      child: Text(
                        'No room schedules found.',
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final schedule = filteredItems[index];
                      final originalIndex = allItems.indexOf(schedule);
                      final isFavorite = _favoriteIndices.contains(originalIndex);

                      final roomInfo = schedule['roomInfo'] ?? {};
                      final roomText =
                          (roomInfo['roomNumber'] ?? 'N/A').toString();
                      final isOccupied = schedule['isOccupied'] == true;

                      final dayText =
                          (schedule['day'] ?? 'N/A').toString().toUpperCase();
                      final startText =
                          (schedule['fromTime'] ?? 'N/A').toString().toUpperCase();
                      final endText =
                          (schedule['toTime'] ?? 'N/A').toString().toUpperCase();

                      return GestureDetector(
                        onTap: () => _showRoomDetails(schedule),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      // ROOM NUMBER
                                      Container(
                                        width: 68,
                                        height: 68,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFEF6E4),
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          roomText,
                                          style: const TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 14),

                                      // DETAILS
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 14,
                                                vertical: 4,
                                              ),
                                              decoration: BoxDecoration(
                                                color: isOccupied
                                                    ? const Color(0xFFFEE2E2)
                                                    : const Color(0xFFDCFCE7),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                isOccupied ? 'OCCUPIED' : 'VACANT',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  letterSpacing: 0.5,
                                                  color: isOccupied
                                                      ? const Color(0xFFDC2626)
                                                      : const Color(0xFF16A34A),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: _buildInfoColumn(
                                                    label: 'DAY',
                                                    icon: Icons
                                                        .calendar_today_outlined,
                                                    value: dayText,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: _buildInfoColumn(
                                                    label: 'START',
                                                    icon: Icons.access_time,
                                                    value: startText,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: _buildInfoColumn(
                                                    label: 'END',
                                                    icon: Icons.access_time,
                                                    value: endText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // FAVORITE BADGE
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFavorite) {
                                          _favoriteIndices.remove(originalIndex);
                                        } else {
                                          _favoriteIndices.add(originalIndex);
                                        }
                                      });
                                    },
                                    child: CustomPaint(
                                      size: const Size(52, 52),
                                      painter: _CornerTrianglePainter(
                                        color: isFavorite
                                            ? const Color(0xFFF9A8D4)
                                            : const Color(0xFFE5E7EB),
                                      ),
                                      child: SizedBox(
                                        width: 52,
                                        height: 52,
                                        child: Align(
                                          alignment: const Alignment(0.55, -0.55),
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 16,
                                            color: isFavorite
                                                ? const Color(0xFFE11D48)
                                                : const Color(0xFF9CA3AF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRoomDetails(Map<String, dynamic> schedule) {
    final roomInfo = schedule['roomInfo'] ?? {};

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Room ${roomInfo['roomNumber'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${roomInfo['building'] ?? 'N/A'} • Floor ${roomInfo['floor'] ?? 'N/A'}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Schedule Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow(
                Icons.calendar_today_outlined,
                'Day',
                schedule['day']?.toString() ?? 'N/A',
              ),
              const SizedBox(height: 14),
              _buildDetailRow(
                Icons.access_time,
                'Start Time',
                schedule['fromTime']?.toString() ?? 'N/A',
              ),
              const SizedBox(height: 14),
              _buildDetailRow(
                Icons.access_time,
                'End Time',
                schedule['toTime']?.toString() ?? 'N/A',
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFF59E0B), size: 20),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF6B7280),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn({
    required String label,
    required IconData icon,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(icon, size: 13, color: const Color(0xFFF59E0B)),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CornerTrianglePainter extends CustomPainter {
  final Color color;

  _CornerTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _CornerTrianglePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}