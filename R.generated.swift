//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 2 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: Hi %@
      ///
      /// Key: homeScreen.welcomeHeader.helloUser
      ///
      /// Locales: en
      var homeScreenWelcomeHeaderHelloUser: RswiftResources.StringResource1<String> { .init(key: "homeScreen.welcomeHeader.helloUser", tableName: "Localizable", source: source, developmentValue: "Hi %@", comment: nil) }

      /// en translation: Welcome to TradeWise
      ///
      /// Key: homeScreen.welcomeHeader.welcome
      ///
      /// Locales: en
      var homeScreenWelcomeHeaderWelcome: RswiftResources.StringResource { .init(key: "homeScreen.welcomeHeader.welcome", tableName: "Localizable", source: source, developmentValue: "Welcome to TradeWise", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 2 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `Color`.
    var color: RswiftResources.ColorResource { .init(name: "Color", path: [], bundle: bundle) }
  }

  /// This `_R.font` struct is generated, and contains static references to 18 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle

    /// Font `Roboto-Black`.
    var robotoBlack: RswiftResources.FontResource { .init(name: "Roboto-Black", bundle: bundle, filename: "Roboto-Black.ttf") }

    /// Font `Roboto-BlackItalic`.
    var robotoBlackItalic: RswiftResources.FontResource { .init(name: "Roboto-BlackItalic", bundle: bundle, filename: "Roboto-BlackItalic.ttf") }

    /// Font `Roboto-Bold`.
    var robotoBold: RswiftResources.FontResource { .init(name: "Roboto-Bold", bundle: bundle, filename: "Roboto-Bold.ttf") }

    /// Font `Roboto-BoldItalic`.
    var robotoBoldItalic: RswiftResources.FontResource { .init(name: "Roboto-BoldItalic", bundle: bundle, filename: "Roboto-BoldItalic.ttf") }

    /// Font `Roboto-Italic`.
    var robotoItalic: RswiftResources.FontResource { .init(name: "Roboto-Italic", bundle: bundle, filename: "Roboto-Italic.ttf") }

    /// Font `Roboto-Light`.
    var robotoLight: RswiftResources.FontResource { .init(name: "Roboto-Light", bundle: bundle, filename: "Roboto-Light.ttf") }

    /// Font `Roboto-LightItalic`.
    var robotoLightItalic: RswiftResources.FontResource { .init(name: "Roboto-LightItalic", bundle: bundle, filename: "Roboto-LightItalic.ttf") }

    /// Font `Roboto-Medium`.
    var robotoMedium: RswiftResources.FontResource { .init(name: "Roboto-Medium", bundle: bundle, filename: "Roboto-Medium.ttf") }

    /// Font `Roboto-MediumItalic`.
    var robotoMediumItalic: RswiftResources.FontResource { .init(name: "Roboto-MediumItalic", bundle: bundle, filename: "Roboto-MediumItalic.ttf") }

    /// Font `Roboto-Regular`.
    var robotoRegular: RswiftResources.FontResource { .init(name: "Roboto-Regular", bundle: bundle, filename: "Roboto-Regular.ttf") }

    /// Font `Roboto-Thin`.
    var robotoThin: RswiftResources.FontResource { .init(name: "Roboto-Thin", bundle: bundle, filename: "Roboto-Thin.ttf") }

    /// Font `Roboto-ThinItalic`.
    var robotoThinItalic: RswiftResources.FontResource { .init(name: "Roboto-ThinItalic", bundle: bundle, filename: "Roboto-ThinItalic.ttf") }

    /// Font `RobotoCondensed-Bold`.
    var robotoCondensedBold: RswiftResources.FontResource { .init(name: "RobotoCondensed-Bold", bundle: bundle, filename: "RobotoCondensed-Bold.ttf") }

    /// Font `RobotoCondensed-BoldItalic`.
    var robotoCondensedBoldItalic: RswiftResources.FontResource { .init(name: "RobotoCondensed-BoldItalic", bundle: bundle, filename: "RobotoCondensed-BoldItalic.ttf") }

    /// Font `RobotoCondensed-Italic`.
    var robotoCondensedItalic: RswiftResources.FontResource { .init(name: "RobotoCondensed-Italic", bundle: bundle, filename: "RobotoCondensed-Italic.ttf") }

    /// Font `RobotoCondensed-Light`.
    var robotoCondensedLight: RswiftResources.FontResource { .init(name: "RobotoCondensed-Light", bundle: bundle, filename: "RobotoCondensed-Light.ttf") }

    /// Font `RobotoCondensed-LightItalic`.
    var robotoCondensedLightItalic: RswiftResources.FontResource { .init(name: "RobotoCondensed-LightItalic", bundle: bundle, filename: "RobotoCondensed-LightItalic.ttf") }

    /// Font `RobotoCondensed-Regular`.
    var robotoCondensedRegular: RswiftResources.FontResource { .init(name: "RobotoCondensed-Regular", bundle: bundle, filename: "RobotoCondensed-Regular.ttf") }

    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [robotoBlack, robotoBlackItalic, robotoBold, robotoBoldItalic, robotoItalic, robotoLight, robotoLightItalic, robotoMedium, robotoMediumItalic, robotoRegular, robotoThin, robotoThinItalic, robotoCondensedBold, robotoCondensedBoldItalic, robotoCondensedItalic, robotoCondensedLight, robotoCondensedLightItalic, robotoCondensedRegular].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 18 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `Roboto-Black.ttf`.
    var robotoBlackTtf: RswiftResources.FileResource { .init(name: "Roboto-Black", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-BlackItalic.ttf`.
    var robotoBlackItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-BlackItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Bold.ttf`.
    var robotoBoldTtf: RswiftResources.FileResource { .init(name: "Roboto-Bold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-BoldItalic.ttf`.
    var robotoBoldItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-BoldItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Italic.ttf`.
    var robotoItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-Italic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Light.ttf`.
    var robotoLightTtf: RswiftResources.FileResource { .init(name: "Roboto-Light", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-LightItalic.ttf`.
    var robotoLightItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-LightItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Medium.ttf`.
    var robotoMediumTtf: RswiftResources.FileResource { .init(name: "Roboto-Medium", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-MediumItalic.ttf`.
    var robotoMediumItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-MediumItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Regular.ttf`.
    var robotoRegularTtf: RswiftResources.FileResource { .init(name: "Roboto-Regular", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-Thin.ttf`.
    var robotoThinTtf: RswiftResources.FileResource { .init(name: "Roboto-Thin", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Roboto-ThinItalic.ttf`.
    var robotoThinItalicTtf: RswiftResources.FileResource { .init(name: "Roboto-ThinItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-Bold.ttf`.
    var robotoCondensedBoldTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-Bold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-BoldItalic.ttf`.
    var robotoCondensedBoldItalicTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-BoldItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-Italic.ttf`.
    var robotoCondensedItalicTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-Italic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-Light.ttf`.
    var robotoCondensedLightTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-Light", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-LightItalic.ttf`.
    var robotoCondensedLightItalicTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-LightItalic", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `RobotoCondensed-Regular.ttf`.
    var robotoCondensedRegularTtf: RswiftResources.FileResource { .init(name: "RobotoCondensed-Regular", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }
  }
}