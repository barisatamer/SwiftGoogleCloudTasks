// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/type/phone_number.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// An object representing a phone number, suitable as an API wire format.
///
/// This representation:
///
///  - should not be used for locale-specific formatting of a phone number, such
///    as "+1 (650) 253-0000 ext. 123"
///
///  - is not designed for efficient storage
///  - may not be suitable for dialing - specialized libraries (see references)
///    should be used to parse the number for that purpose
///
/// To do something meaningful with this number, such as format it for various
/// use-cases, convert it to an `i18n.phonenumbers.PhoneNumber` object first.
///
/// For instance, in Java this would be:
///
///    com.google.type.PhoneNumber wireProto =
///        com.google.type.PhoneNumber.newBuilder().build();
///    com.google.i18n.phonenumbers.Phonenumber.PhoneNumber phoneNumber =
///        PhoneNumberUtil.getInstance().parse(wireProto.getE164Number(), "ZZ");
///    if (!wireProto.getExtension().isEmpty()) {
///      phoneNumber.setExtension(wireProto.getExtension());
///    }
///
///  Reference(s):
///   - https://github.com/google/libphonenumber
public struct Google_Type_PhoneNumber {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Required.  Either a regular number, or a short code.  New fields may be
  /// added to the oneof below in the future, so clients should ignore phone
  /// numbers for which none of the fields they coded against are set.
  public var kind: Google_Type_PhoneNumber.OneOf_Kind? = nil

  /// The phone number, represented as a leading plus sign ('+'), followed by a
  /// phone number that uses a relaxed ITU E.164 format consisting of the
  /// country calling code (1 to 3 digits) and the subscriber number, with no
  /// additional spaces or formatting, e.g.:
  ///  - correct: "+15552220123"
  ///  - incorrect: "+1 (555) 222-01234 x123".
  ///
  /// The ITU E.164 format limits the latter to 12 digits, but in practice not
  /// all countries respect that, so we relax that restriction here.
  /// National-only numbers are not allowed.
  ///
  /// References:
  ///  - https://www.itu.int/rec/T-REC-E.164-201011-I
  ///  - https://en.wikipedia.org/wiki/E.164.
  ///  - https://en.wikipedia.org/wiki/List_of_country_calling_codes
  public var e164Number: String {
    get {
      if case .e164Number(let v)? = kind {return v}
      return String()
    }
    set {kind = .e164Number(newValue)}
  }

  /// A short code.
  ///
  /// Reference(s):
  ///  - https://en.wikipedia.org/wiki/Short_code
  public var shortCode: Google_Type_PhoneNumber.ShortCode {
    get {
      if case .shortCode(let v)? = kind {return v}
      return Google_Type_PhoneNumber.ShortCode()
    }
    set {kind = .shortCode(newValue)}
  }

  /// The phone number's extension. The extension is not standardized in ITU
  /// recommendations, except for being defined as a series of numbers with a
  /// maximum length of 40 digits. Other than digits, some other dialing
  /// characters such as ',' (indicating a wait) or '#' may be stored here.
  ///
  /// Note that no regions currently use extensions with short codes, so this
  /// field is normally only set in conjunction with an E.164 number. It is held
  /// separately from the E.164 number to allow for short code extensions in the
  /// future.
  public var `extension`: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  /// Required.  Either a regular number, or a short code.  New fields may be
  /// added to the oneof below in the future, so clients should ignore phone
  /// numbers for which none of the fields they coded against are set.
  public enum OneOf_Kind: Equatable {
    /// The phone number, represented as a leading plus sign ('+'), followed by a
    /// phone number that uses a relaxed ITU E.164 format consisting of the
    /// country calling code (1 to 3 digits) and the subscriber number, with no
    /// additional spaces or formatting, e.g.:
    ///  - correct: "+15552220123"
    ///  - incorrect: "+1 (555) 222-01234 x123".
    ///
    /// The ITU E.164 format limits the latter to 12 digits, but in practice not
    /// all countries respect that, so we relax that restriction here.
    /// National-only numbers are not allowed.
    ///
    /// References:
    ///  - https://www.itu.int/rec/T-REC-E.164-201011-I
    ///  - https://en.wikipedia.org/wiki/E.164.
    ///  - https://en.wikipedia.org/wiki/List_of_country_calling_codes
    case e164Number(String)
    /// A short code.
    ///
    /// Reference(s):
    ///  - https://en.wikipedia.org/wiki/Short_code
    case shortCode(Google_Type_PhoneNumber.ShortCode)

  #if !swift(>=4.1)
    public static func ==(lhs: Google_Type_PhoneNumber.OneOf_Kind, rhs: Google_Type_PhoneNumber.OneOf_Kind) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.e164Number, .e164Number): return {
        guard case .e164Number(let l) = lhs, case .e164Number(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.shortCode, .shortCode): return {
        guard case .shortCode(let l) = lhs, case .shortCode(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  /// An object representing a short code, which is a phone number that is
  /// typically much shorter than regular phone numbers and can be used to
  /// address messages in MMS and SMS systems, as well as for abbreviated dialing
  /// (e.g. "Text 611 to see how many minutes you have remaining on your plan.").
  ///
  /// Short codes are restricted to a region and are not internationally
  /// dialable, which means the same short code can exist in different regions,
  /// with different usage and pricing, even if those regions share the same
  /// country calling code (e.g. US and CA).
  public struct ShortCode {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Required. The BCP-47 region code of the location where calls to this
    /// short code can be made, such as "US" and "BB".
    ///
    /// Reference(s):
    ///  - http://www.unicode.org/reports/tr35/#unicode_region_subtag
    public var regionCode: String = String()

    /// Required. The short code digits, without a leading plus ('+') or country
    /// calling code, e.g. "611".
    public var number: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.type"

extension Google_Type_PhoneNumber: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".PhoneNumber"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "e164_number"),
    2: .standard(proto: "short_code"),
    3: .same(proto: "extension"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        if self.kind != nil {try decoder.handleConflictingOneOf()}
        var v: String?
        try decoder.decodeSingularStringField(value: &v)
        if let v = v {self.kind = .e164Number(v)}
      }()
      case 2: try {
        var v: Google_Type_PhoneNumber.ShortCode?
        if let current = self.kind {
          try decoder.handleConflictingOneOf()
          if case .shortCode(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.kind = .shortCode(v)}
      }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.`extension`) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.kind {
    case .e164Number?: try {
      guard case .e164Number(let v)? = self.kind else { preconditionFailure() }
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }()
    case .shortCode?: try {
      guard case .shortCode(let v)? = self.kind else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    if !self.`extension`.isEmpty {
      try visitor.visitSingularStringField(value: self.`extension`, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Type_PhoneNumber, rhs: Google_Type_PhoneNumber) -> Bool {
    if lhs.kind != rhs.kind {return false}
    if lhs.`extension` != rhs.`extension` {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Type_PhoneNumber.ShortCode: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = Google_Type_PhoneNumber.protoMessageName + ".ShortCode"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "region_code"),
    2: .same(proto: "number"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.regionCode) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.number) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.regionCode.isEmpty {
      try visitor.visitSingularStringField(value: self.regionCode, fieldNumber: 1)
    }
    if !self.number.isEmpty {
      try visitor.visitSingularStringField(value: self.number, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Type_PhoneNumber.ShortCode, rhs: Google_Type_PhoneNumber.ShortCode) -> Bool {
    if lhs.regionCode != rhs.regionCode {return false}
    if lhs.number != rhs.number {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
