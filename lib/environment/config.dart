enum BuildFlavor { dev, release }

class BuildEnvironment {
  final BuildFlavor flavor;
  final String apiBaseURL;

  BuildEnvironment.dev({required this.apiBaseURL}) : flavor = BuildFlavor.dev;

  BuildEnvironment.release({required this.apiBaseURL}) : flavor = BuildFlavor.release;
}
