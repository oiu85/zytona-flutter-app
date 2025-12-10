import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zyktona_app_flutter/gen/assets.gen.dart';
import '../localization/app_text.dart';
import 'bloc_status.dart';

/// Enum to identify different error types
enum ErrorType {
  noInternet,
  timeout,
  notFound,
  generic,
}

/// Helper class to determine error type from error message
class ErrorTypeHelper {
  /// Detects error type from error message
  static ErrorType detectErrorType(String? errorMessage) {
    if (errorMessage == null || errorMessage.isEmpty) {
      return ErrorType.generic;
    }

    final lowerError = errorMessage.toLowerCase();

    // Check for no internet connection (priority: check first)
    if (lowerError.contains('no internet') ||
        lowerError.contains('no internet connection') ||
        lowerError.contains('connection error') ||
        lowerError.contains('network unreachable') ||
        lowerError.contains('socketexception') ||
        lowerError.contains('failed host lookup') ||
        lowerError.contains('connection refused')) {
      return ErrorType.noInternet;
    }

    // Check for timeout (priority: check second)
    if (lowerError.contains('timeout') ||
        lowerError.contains('connection timeout') ||
        lowerError.contains('timed out') ||
        lowerError.contains('deadline exceeded') ||
        lowerError.contains('send timeout') ||
        lowerError.contains('receive timeout')) {
      return ErrorType.timeout;
    }

    // Check for not found (404) (priority: check third)
    if (lowerError.contains('404') ||
        lowerError.contains('not found') ||
        lowerError.contains('server error: 404') ||
        (lowerError.contains('server error') && lowerError.contains('404'))) {
      return ErrorType.notFound;
    }

    return ErrorType.generic;
  }

  /// Gets the Lottie animation path based on error type
  static String getLottiePath(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.noInternet:
        return Assets.lottie.noInternet;
      case ErrorType.timeout:
        return Assets.lottie.timeout;
      case ErrorType.notFound:
        return Assets.lottie.noData;
      case ErrorType.generic:
        return Assets.lottie.noData;
    }
  }
}

class UiHelperStatus extends StatefulWidget {
  final BlocStatus state;
  final String? message;
  final double? size;
  final bool showDefaultMessage;
  final VoidCallback? onRetry;

  const UiHelperStatus({
    super.key,
    required this.state,
    this.message,
    this.size,
    this.showDefaultMessage = true,
    this.onRetry,
  });

  @override
  State<UiHelperStatus> createState() => _UiHelperStatusState();
}

class _UiHelperStatusState extends State<UiHelperStatus> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.isInitial() || widget.state.isSuccess()) {
      return const SizedBox.shrink();
    }

    final animationSize = widget.size ?? 200.w;
    final isLoading = widget.state.isLoading() || widget.state.isLoadingMore();

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Show loading indicator or error animation
            if (isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              )
            else
              _buildErrorAnimation(animationSize),
            SizedBox(height: 24.h),
            if (widget.showDefaultMessage || widget.message != null)
              Text(
                widget.message ??
                    (isLoading
                        ? 'Loading...'
                        : (widget.state.error ??
                            'Something went wrong\nPlease try again')),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                textAlign: TextAlign.center,
              ),
            if (widget.state.isFail() && widget.onRetry != null) ...[
              SizedBox(height: 24.h),
              ElevatedButton.icon(
                onPressed: widget.onRetry,
                icon: Icon(Icons.refresh, size: 20.sp),
                label: Text(
                  'Try Again',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Builds the appropriate error animation based on error type
  Widget _buildErrorAnimation(double size) {
    final errorType = ErrorTypeHelper.detectErrorType(widget.state.error);
    final animationPath = ErrorTypeHelper.getLottiePath(errorType);

    // Use Lottie for specific error types, Image for generic errors
    if (errorType != ErrorType.generic) {
      return Lottie.asset(
        animationPath,
        width: size,
        height: size,
        fit: BoxFit.contain,
        repeat: false,
      );
    } else {
      return Image.asset(
        animationPath,
        width: size,
        height: size,
        fit: BoxFit.contain,
      );
    }
  }
}


class CompactLottieAnimation extends StatelessWidget {
  final BlocStatus state;
  final double? size;

  const CompactLottieAnimation({
    super.key,
    required this.state,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isInitial() || state.isSuccess()) {
      return const SizedBox.shrink();
    }

    final animationSize = size ?? 100.w;
    final isLoading = state.isLoading() || state.isLoadingMore();

    return Center(
      child: Lottie.asset(
        Assets.lottie.loadingAnimation,
        width: animationSize,
        height: animationSize,
        fit: BoxFit.contain,
        repeat: isLoading,
      ),
    );
  }
}

/// Simple Skeleton Loader
/// Usage: SimpleSkeleton(isLoading: true, child: YourWidget())
class SimpleSkeleton extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool ignoreContainers;

  const SimpleSkeleton({
    super.key,
    required this.isLoading,
    required this.child,
    this.ignoreContainers = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: ignoreContainers,
      effect: ShimmerEffect(
        baseColor: isDark 
            ? Colors.grey[800]! 
            : Colors.grey[300]!,
        highlightColor: isDark 
            ? Colors.grey[600]! 
            : Colors.grey[50]!,
        duration: const Duration(seconds: 1),
      ),
      textBoneBorderRadius: TextBoneBorderRadius.fromHeightFactor(0.5),
      justifyMultiLineText: false,
      child: child,
    );
  }
}

/// Simple Skeleton with BlocStatus
/// Usage: SimpleSkeletonStatus(state: blocStatus, child: YourWidget())
class SimpleSkeletonStatus extends StatelessWidget {
  final BlocStatus state;
  final Widget child;

  const SimpleSkeletonStatus({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Show skeleton when loading, loading more, OR initial (first run before data loads)
    return SimpleSkeleton(
      isLoading: state.isLoading() || state.isLoadingMore() || state.isInitial(),
      child: child,
    );
  }
}




class SimplePullToRefresh extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback onRefresh;
  final VoidCallback? onLoading;
  final Widget child;
  final Color? color;
  final bool enablePullUp;

  const SimplePullToRefresh({
    super.key,
    required this.controller,
    required this.onRefresh,
    required this.child,
    this.onLoading,
    this.color,
    this.enablePullUp = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = color ?? theme.colorScheme.primary;
    
    return SmartRefresher(
      controller: controller,
      enablePullDown: true,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      physics: const BouncingScrollPhysics(),
      header: WaterDropMaterialHeader(
        backgroundColor: primaryColor,
        color: theme.colorScheme.surface,
        distance: 80.h,
      ),
      footer: enablePullUp
          ? CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text(
                    "Pull up to load more",
                    style: TextStyle(fontSize: 14.sp),
                  );
                } else if (mode == LoadStatus.loading) {
                  body = CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 2.0,
                  );
                } else if (mode == LoadStatus.failed) {
                  body = Text(
                    "Load Failed! Tap to retry",
                    style: TextStyle(fontSize: 14.sp),
                  );
                } else if (mode == LoadStatus.canLoading) {
                  body = Text(
                    "Release to load more",
                    style: TextStyle(fontSize: 14.sp),
                  );
                } else {
                  body = Text(
                    "No more data",
                    style: TextStyle(fontSize: 14.sp),
                  );
                }
                return Container(
                  height: 55.h,
                  child: Center(child: body),
                );
              },
            )
          : null,
      child: child,
    );
  }
}

/// No Data Widget - Shows no data image with text
class NoDataWidget extends StatelessWidget {
  final String? message;
  final double? imageWidth;
  final double? imageHeight;

  const NoDataWidget({
    super.key,
    this.message,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Use Lottie animation for no data state
    final imagePath = Assets.lottie.noData;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              imagePath,
              width: imageWidth ?? 500.w,
              height: imageHeight ?? 500.h,
              fit: BoxFit.contain,
            ),
            if (message != null) ...[
              SizedBox(height: 24.h),
              AppText(
                message!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// SVG Image with Skeleton Support
class SkeletonSvgImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  const SkeletonSvgImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = Skeletonizer.maybeOf(context)?.enabled ?? false;
    
    if (isLoading) {
      return Skeleton.replace(
        width: width ?? 24,
        height: height ?? 24,
        child: SvgPicture.asset(
          path,
          width: width,
          height: height,
          colorFilter: color != null 
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
          fit: fit,
        ),
      );
    }
    
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: color != null 
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      fit: fit,
    );
  }
}
