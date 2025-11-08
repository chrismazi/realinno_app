import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Onboarding screen matching exact design from HTML and provided images
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;

  // Uses 2 Network images (provided by user) and 1 local asset
  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Your wellbeing, your growth',
      description:
          "RealWorks EAP is your confidential partner in navigating life's challenges and fostering personal development.",
      imageSrc:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCwd1ri9zhSsm-S4usAnPx7yXfNxgbNmLy-7Q-QaUZ6-LtP3a8d9PflVLLjzQPINvapIutgZPYwCgiVmTqEWkMSH_e9IfkGvSSKq1i5t2rqwo1SyhWgzvFxuIf2hu0pODo_kCXi6QrxgiPkYK7uIzoMk_FxW5CdCDbfCxhKC9kJ3bijzQ-ofymsaz92SLSsIbk1QRLloJV-MmXwMHiedi5D8IVSVLyhWnZlGjhT0IAGFkxbqXbNqmaR_7VLwuGNCOvzgJmGJ5O9S_Y',
      isNetwork: true,
    ),
    OnboardingPage(
      title: 'Financial tools for your future',
      description:
          'Access resources to help you manage your finances, plan for the future, and achieve your financial goals with confidence.',
      imageSrc:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAYNlssoHj50Ft1tDsNzlXZ3htsplXlyC388MXVtWUlLzH83RpT8xSOyLSv5n4gZhsYZJfI6tX1-QmmqyEvBgcVKiZn16KTUn1p0s6TrYmgG57bAWFc5Xu9MqD783UV1FtMpEGtzchnEDesFKEgvOhBEwlfHvMYrXipsQ7gXbUIAkfak1FSZnKD0JsaR4NZ5Euj9mKoOCI5VpVxPQx0SH37mJpBGBOnHKPrFvcRsdy6pyz3AySU2r-vZ8H6Ppo6QWQnIOOBJ1RErQw',
      isNetwork: true,
    ),
    OnboardingPage(
      title: 'Stay safe. Stay supported.',
      description: '',
      imageSrc: 'designs/realworks_app_onboarding_-_step_1_2/screen.png',
      isNetwork: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/signup');
    }
  }

  void _skip() {
    context.go('/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Stack(
        children: [
          // Animated floating background petals (matching HTML design)
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.15,
            left: -MediaQuery.of(context).size.width * 0.25,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    10 * _animationController.value,
                    10 * _animationController.value,
                  ),
                  child: Opacity(
                    opacity: 0.07,
                    child: Icon(
                      Icons.spa,
                      size: 400,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: -MediaQuery.of(context).size.height * 0.2,
            right: -MediaQuery.of(context).size.width * 0.25,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    -15 * _animationController.value,
                    -15 * _animationController.value,
                  ),
                  child: Opacity(
                    opacity: 0.06,
                    child: Icon(
                      Icons.spa,
                      size: 500,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return _buildPage(_pages[index]);
                    },
                  ),
                ),
                _buildBottomSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: page.isNetwork
                  ? Image.network(
                      page.imageSrc,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.image,
                          size: 100,
                          color: AppColors.primary.withOpacity(0.5),
                        );
                      },
                    )
                  : Image.asset(
                      page.imageSrc,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.image,
                          size: 100,
                          color: AppColors.primary.withOpacity(0.5),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32), // 2rem from HTML
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 40,
            offset: const Offset(0, -20),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _pages[_currentPage].title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          if (_pages[_currentPage].description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              _pages[_currentPage].description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textLight,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 32),
          // Page indicators matching HTML design
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 16 : 8, // Elongated for active
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColors.primary
                      : AppColors.gray300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Navigation buttons: Slide 2 has Skip/Next; Slide 1 and 3 use full-width Get Started
          if (_currentPage == 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _skip,
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textLight,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.primary.withOpacity(0.3),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      _skip();
                    } else {
                      _nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 8,
                    shadowColor: AppColors.primary.withOpacity(0.3),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Get Started',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String imageSrc; // network URL or asset path
  final bool isNetwork;
  final String title;
  final String description;

  OnboardingPage({
    required this.imageSrc,
    required this.isNetwork,
    required this.title,
    required this.description,
  });
}
