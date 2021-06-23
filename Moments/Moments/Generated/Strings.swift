// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Avatars
  internal static let internalMenuAvatars = L10n.tr("Localizable", "internalMenuAvatars")
  /// Colors
  internal static let internalMenuColors = L10n.tr("Localizable", "internalMenuColors")
  /// Typography
  internal static let internalMenuTypography = L10n.tr("Localizable", "internalMenuTypography")

  internal enum InternalMenu {
    /// Area 51
    internal static let area51 = L10n.tr("Localizable", "internalMenu.area51")
    /// General Info
    internal static let generalInfo = L10n.tr("Localizable", "internalMenu.generalInfo")
  }

  internal enum MomentsList {
    /// Something went wrong, please try again later
    internal static let errorMessage = L10n.tr("Localizable", "momentsList.errorMessage")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
