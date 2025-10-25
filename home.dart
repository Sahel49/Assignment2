import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> courses = const [
    {
      'title': 'Full Stack Web Development with Python, Django & React',
      'image':
      'https://cdn.ostad.app/course/cover/2024-12-19T15-48-52.487Z-Full-Stack-Web-Development-with-Python,-Django-&-React.jpg',
      'batch': '৮',
      'seat': '৬ টি সিট বাকি',
      'days': '৩৬ দিন বাকি'
    },
    {
      'title': 'Full Stack Web Development with PHP, Laravel & Vue Js',
      'image':
      'https://cdn.ostad.app/course/cover/2024-12-23T06-07-44.087Z-Course%20Thumbnail%2016.jpg',
      'batch': '১১',
      'seat': '৯ টি সিট বাকি',
      'days': '৩০ দিন বাকি'
    },
    {
      'title': 'Full Stack Web Development with JavaScript (MERN)',
      'image':
      'https://cdn.ostad.app/course/photo/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg',
      'batch': '১৬',
      'seat': '২৩ টি সিট বাকি',
      'days': '২০ দিন বাকি'
    },
    {
      'title': 'App Development with Flutter',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRdNrDDVBxSg0skTRqi6Qsl4zXRTLFmhmeoA&s.jpg',
      'batch': '১৪',
      'seat': '৩৪ টি সিট বাকি',
      'days': '২৮ দিন বাকি'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Ostad Courses"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: courses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.88, // overflow fix
            ),
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseCard(
                title: course['title']!,
                imageUrl: course['image']!,
                batch: course['batch']!,
                seat: course['seat']!,
                days: course['days']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title, imageUrl, batch, seat, days;

  const CourseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.batch,
    required this.seat,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== Image =====
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // ===== Meta Badges =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 4,
                  runSpacing: 4,
                  children: [
                    _metaChip(Icons.badge, 'ব্যাচ $batch'),
                    _metaChip(Icons.people, seat),
                    _metaChip(Icons.access_time, days),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              // ===== Title =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 8),

              // ===== Button =====
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('বিস্তারিত দেখুন: $title')),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('বিস্তারিত দেখুন'),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== Meta Chip Widget =====
  Widget _metaChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.black54),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

