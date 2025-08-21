import 'package:meta/meta.dart';

/// {@template namespace}
/// Marks a class as a Dscript namespace library.
///
/// **What gets exposed:**
/// - All **public** methods **declared directly on the annotated class**
///   (not inherited, not from mixins, not private) are emitted as Dscript
///   `RuntimeBinding`s by the generator.
/// - Methods can be instance or static; visibility is what matters.
///
/// **Binding naming & docs:**
/// - The binding name is exactly the Dart method name (no underscore stripping
///   happens because private methods are skipped entirely).
/// - The class and method `///` doc comments are captured and embedded into the
///   generated bindings.
///
/// **Library name:**
/// - The generator uses the `name` provided here; if omitted, it falls back to
///   the file name.
///
/// See [RequirePerm] for how to require permissions on methods.
/// {@endtemplate}
@immutable
class Namespace {
  /// Name of the library exposed to the scripting runtime.
  final String name;

  /// Creates a new [Namespace] annotation.
  const Namespace([this.name = '']);
}

/// {@macro namespace}
const namespace = Namespace();

/// Marks a method as requiring a specific permission to execute.
///
/// Attach one or more `@RequirePerm(...)` annotations **directly** to a method
/// inside a `@Namespace` class. The generator collects these and embeds them in
/// the binding.
@immutable
class RequirePerm {
  /// The permission required to execute the method.
  final dynamic permission;

  /// Creates a new [RequirePerm] annotation.
  const RequirePerm(this.permission);
}
