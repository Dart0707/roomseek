import 'package:flutter/material.dart';
import '../services/schedule_service.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late Future<List<dynamic>> schedules;
  final Set<int> _favoriteIndices = {}; // Tracks liked cards

  @override
  void initState() {
    super.initState();
    schedules = ScheduleService.getSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Room Schedules'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: schedules,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final items = snapshot.data ?? [];

          if (items.isEmpty) {
            return const Center(child: Text('No room schedules available.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final schedule = items[index];
              final isOccupied = schedule['isOccupied'] == true;
              final isFavorite = _favoriteIndices.contains(index);

              final roomText = (schedule['room'] ?? 'N/A')
                  .toString()
                  .replaceFirst(RegExp(r'^room\s*', caseSensitive: false), '');
              final dayText = (schedule['day'] ?? 'N/A').toString().toUpperCase();
              final startText = (schedule['fromTime'] ?? 'N/A').toString().toUpperCase();
              final endText = (schedule['toTime'] ?? 'N/A').toString().toUpperCase();

              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      // MAIN CARD CONTENT
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            // LEFT: ROOM NUMBER BOX
                            Container(
                              width: 76,
                              height: 76,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEF8E6),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                roomText,
                                style: const TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),

                            const SizedBox(width: 14),

                            // RIGHT: STATUS PILL & SCHEDULE INFO
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // STATUS PILL
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isOccupied
                                          ? const Color(0xFFFEE2E2)
                                          : const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      isOccupied ? 'OCCUPIED' : 'VACANT',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.5,
                                        color: isOccupied
                                            ? const Color(0xFFDC2626)
                                            : const Color(0xFF16A34A),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // DAY / START / END COLUMNS
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: _buildInfoColumn(
                                          label: 'DAY',
                                          icon: Icons.calendar_today_outlined,
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

                      // TOP-RIGHT DIAGONAL CORNER BADGE
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isFavorite) {
                                _favoriteIndices.remove(index);
                              } else {
                                _favoriteIndices.add(index);
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
              );
            },
          );
        },
      ),
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
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: const Color(0xFFF59E0B),
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
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