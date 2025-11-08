import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

/// Learning & Training Hub screen matching provided design
class LearningHubCoursesScreen extends StatefulWidget {
  const LearningHubCoursesScreen({super.key});

  @override
  State<LearningHubCoursesScreen> createState() =>
      _LearningHubCoursesScreenState();
}

class _LearningHubCoursesScreenState extends State<LearningHubCoursesScreen> {
  String _selectedCategory = 'All';

  final _categories = const ['All', 'Safety', 'Finance', 'Wellness', 'Skills'];

  final _courses = const [
    _Course(
      title: 'Advanced Site Safety',
      duration: '3h 15m',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBImsWoCrvmmSojGgARq9gw9835adObZae_NmDC2Af4n8yCequeBh9gOEyN5UWg3AjOGBpe0C0kp-qeZFK49GADd_JO_tbDNxLIfObYXHSxttIFwRuoRp5FySctvzqrAVv3EUM2dUkvqfGIAPBi7_qQjDlN7C1e0b1IXPTrp1oKM2BZQVCw061pGocitaY7WHuzYHJX-wIrLOdlTUr-w6U3gPS_sW2Oh-nM9S6Xn-XuIOQ18spOZE0PRkjYbpXGaNfW1YzoJr7GJdA',
    ),
    _Course(
      title: 'Financial Planning 101',
      duration: '1h 30m',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAlrDmS1q2BVQqpsUD3lk6QMNwhwMkmowxqt2hAXkKUnAi94tNKiKJ5B5CTZ2NBlj44sglq7lNlR1fjmhpIQkyBVGaseseI049ExZgVs9Fv50u71V6IEl_yTd4WDQ-vqgt7GU_dB514QgsajuRtgugBs4D0uOyNPT2DQVe_j9PsrdS3xf3D_m1mpfdktYY0wib0zaitctTZp1SbUYIp2CZ1A9GJNRDU-iFv13ibKyiKvPRCYddFNd59pAkADQocCd2ey1vioSs8OR0',
    ),
    _Course(
      title: 'Mindfulness at Work',
      duration: '45m',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDDjjPTzwehdaedfvT7hCVSVpxyg921YTqzQAjcCACPrkVyYQK-ntI-EutApQq-J8Z2S5TG2XDiepEcvruONw17FvBGVCFAgSymFJR65URgS80rJ0DXHdwJc6RW4Lb0p7nbzOlJPi3nc69Ni6YZFRN3e-S6jR21ubYCO8OGfewqX7kRwzOnkyhY_Zz2wus69Afk3ihRHO3qrJe5yLPijKH9lLqmoAljnN4bNSBfiPBEr5RX2gmdxQuwF8fZCtxBjQApRaTIwRfXSLs',
    ),
    _Course(
      title: 'Managing Debt',
      duration: '2h 00m',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAUV2tTv88_aC1m9EAigRwahyUzGovsQ4d36IBl9VLdd771O8Sb1BWYm6iHDT3UaAJUxJkNxGMmcEvAvoQ4tUgX1asShlni3CqlzrMbRCzDHP4AV1CjKMe8qYVF5UkcSGqX6l0PBN-WFrzbv4RH_46J0I6fxn4oNHNeU1YyYFNghGPyK5noH87KgXZQPgxppuz7SMh8PysHVZKxrjHo6dG16oZiy69MvPzzoDsmcekLvoNsiKTmBVSI4JJhAjPj9T3hmmOceBEVEUI',
    ),
  ];

  final _certificates = const [
    _Certificate(
      title: 'Heavy Machinery Safety',
      subtitle: 'Completed: 15 Oct 2023',
      imageUrl:
          'https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=800&q=80',
    ),
    _Certificate(
      title: 'First Aid Basics',
      subtitle: 'Completed: 02 Sep 2023',
      imageUrl:
          'https://images.unsplash.com/photo-1559027615-5ee22b7bbcbb?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Learning & Training',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Expand your skills and knowledge',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.search,
                color: Color(0xFF475569),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        children: [
          _buildCategoryRow(),
          const SizedBox(height: 16),
          _buildCoursesGrid(),
          const SizedBox(height: 32),
          const Text(
            'My Certificates',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 16),
          ..._certificates.map((certificate) => _buildCertificateTile(context, certificate)),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFF97316)
                    : const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFF475569),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoursesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: _courses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final course = _courses[index];
        return _CourseCard(course: course);
      },
    );
  }

  Widget _buildCertificateTile(BuildContext context, _Certificate certificate) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        context.push('/learning-hub', extra: {
          'title': certificate.title,
          'subtitle': certificate.subtitle,
          'imageUrl': certificate.imageUrl,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEDD5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.emoji_events,
                color: Color(0xFFF97316),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    certificate.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  const _CourseCard({required this.course});

  final _Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening: ${course.title}')),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    course.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Icon(
                        Icons.broken_image,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.25),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.6),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            course.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            course.duration,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }
}

class _Course {
  const _Course({
    required this.title,
    required this.duration,
    required this.imageUrl,
  });

  final String title;
  final String duration;
  final String imageUrl;
}

class _Certificate {
  const _Certificate({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}
