// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/type/month.proto
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

/// Represents a month in the Gregorian calendar.
public enum Google_Type_Month: SwiftProtobuf.Enum {
  public typealias RawValue = Int

  /// The unspecifed month.
  case unspecified // = 0

  /// The month of January.
  case january // = 1

  /// The month of February.
  case february // = 2

  /// The month of March.
  case march // = 3

  /// The month of April.
  case april // = 4

  /// The month of May.
  case may // = 5

  /// The month of June.
  case june // = 6

  /// The month of July.
  case july // = 7

  /// The month of August.
  case august // = 8

  /// The month of September.
  case september // = 9

  /// The month of October.
  case october // = 10

  /// The month of November.
  case november // = 11

  /// The month of December.
  case december // = 12
  case UNRECOGNIZED(Int)

  public init() {
    self = .unspecified
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .january
    case 2: self = .february
    case 3: self = .march
    case 4: self = .april
    case 5: self = .may
    case 6: self = .june
    case 7: self = .july
    case 8: self = .august
    case 9: self = .september
    case 10: self = .october
    case 11: self = .november
    case 12: self = .december
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  public var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .january: return 1
    case .february: return 2
    case .march: return 3
    case .april: return 4
    case .may: return 5
    case .june: return 6
    case .july: return 7
    case .august: return 8
    case .september: return 9
    case .october: return 10
    case .november: return 11
    case .december: return 12
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Google_Type_Month: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Google_Type_Month] = [
    .unspecified,
    .january,
    .february,
    .march,
    .april,
    .may,
    .june,
    .july,
    .august,
    .september,
    .october,
    .november,
    .december,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Google_Type_Month: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "MONTH_UNSPECIFIED"),
    1: .same(proto: "JANUARY"),
    2: .same(proto: "FEBRUARY"),
    3: .same(proto: "MARCH"),
    4: .same(proto: "APRIL"),
    5: .same(proto: "MAY"),
    6: .same(proto: "JUNE"),
    7: .same(proto: "JULY"),
    8: .same(proto: "AUGUST"),
    9: .same(proto: "SEPTEMBER"),
    10: .same(proto: "OCTOBER"),
    11: .same(proto: "NOVEMBER"),
    12: .same(proto: "DECEMBER"),
  ]
}
