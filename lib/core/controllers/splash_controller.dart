import '../../utils/imports.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  final RxBool _isAnimationCompleted = false.obs;
  bool get isAnimationCompleted => _isAnimationCompleted.value;

  @override
  void onInit() {
    super.onInit();
    initAnimations();
    navigateToHome();
  }

  void initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.elasticOut),
      ),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimationCompleted.value = true;
      }
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      print("navigate to login page");
      Get.offAllNamed(RouteConstant.homePage);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
