// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/type/quaternion.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2019 Google LLC.
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

/// A quaternion is defined as the quotient of two directed lines in a
/// three-dimensional space or equivalently as the quotient of two Euclidean
/// vectors (https://en.wikipedia.org/wiki/Quaternion).
///
/// Quaternions are often used in calculations involving three-dimensional
/// rotations (https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation),
/// as they provide greater mathematical robustness by avoiding the gimbal lock
/// problems that can be encountered when using Euler angles
/// (https://en.wikipedia.org/wiki/Gimbal_lock).
///
/// Quaternions are generally represented in this form:
///
///     w + xi + yj + zk
///
/// where x, y, z, and w are real numbers, and i, j, and k are three imaginary
/// numbers.
///
/// Our naming choice `(x, y, z, w)` comes from the desire to avoid confusion for
/// those interested in the geometric properties of the quaternion in the 3D
/// Cartesian space. Other texts often use alternative names or subscripts, such
/// as `(a, b, c, d)`, `(1, i, j, k)`, or `(0, 1, 2, 3)`, which are perhaps
/// better suited for mathematical interpretations.
///
/// To avoid any confusion, as well as to maintain compatibility with a large
/// number of software libraries, the quaternions represented using the protocol
/// buffer below *must* follow the Hamilton convention, which defines `ij = k`
/// (i.e. a right-handed algebra), and therefore:
///
///     i^2 = j^2 = k^2 = ijk = −1
///     ij = −ji = k
///     jk = −kj = i
///     ki = −ik = j
///
/// Please DO NOT use this to represent quaternions that follow the JPL
/// convention, or any of the other quaternion flavors out there.
///
/// Definitions:
///
///   - Quaternion norm (or magnitude): `sqrt(x^2 + y^2 + z^2 + w^2)`.
///   - Unit (or normalized) quaternion: a quaternion whose norm is 1.
///   - Pure quaternion: a quaternion whose scalar component (`w`) is 0.
///   - Rotation quaternion: a unit quaternion used to represent rotation.
///   - Orientation quaternion: a unit quaternion used to represent orientation.
///
/// A quaternion can be normalized by dividing it by its norm. The resulting
/// quaternion maintains the same direction, but has a norm of 1, i.e. it moves
/// on the unit sphere. This is generally necessary for rotation and orientation
/// quaternions, to avoid rounding errors:
/// https://en.wikipedia.org/wiki/Rotation_formalisms_in_three_dimensions
///
/// Note that `(x, y, z, w)` and `(-x, -y, -z, -w)` represent the same rotation,
/// but normalization would be even more useful, e.g. for comparison purposes, if
/// it would produce a unique representation. It is thus recommended that `w` be
/// kept positive, which can be achieved by changing all the signs when `w` is
/// negative.
public struct Google_Type_Quaternion {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The x component.
  public var x: Double = 0

  /// The y component.
  public var y: Double = 0

  /// The z component.
  public var z: Double = 0

  /// The scalar component.
  public var w: Double = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.type"

extension Google_Type_Quaternion: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Quaternion"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "x"),
    2: .same(proto: "y"),
    3: .same(proto: "z"),
    4: .same(proto: "w"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularDoubleField(value: &self.x)
      case 2: try decoder.decodeSingularDoubleField(value: &self.y)
      case 3: try decoder.decodeSingularDoubleField(value: &self.z)
      case 4: try decoder.decodeSingularDoubleField(value: &self.w)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.x != 0 {
      try visitor.visitSingularDoubleField(value: self.x, fieldNumber: 1)
    }
    if self.y != 0 {
      try visitor.visitSingularDoubleField(value: self.y, fieldNumber: 2)
    }
    if self.z != 0 {
      try visitor.visitSingularDoubleField(value: self.z, fieldNumber: 3)
    }
    if self.w != 0 {
      try visitor.visitSingularDoubleField(value: self.w, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Type_Quaternion, rhs: Google_Type_Quaternion) -> Bool {
    if lhs.x != rhs.x {return false}
    if lhs.y != rhs.y {return false}
    if lhs.z != rhs.z {return false}
    if lhs.w != rhs.w {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
