// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/cloud/tasks/v2beta3/queue.proto
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

/// A queue is a container of related tasks. Queues are configured to manage
/// how those tasks are dispatched. Configurable properties include rate limits,
/// retry options, queue types, and others.
public struct Google_Cloud_Tasks_V2beta3_Queue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Caller-specified and required in [CreateQueue][google.cloud.tasks.v2beta3.CloudTasks.CreateQueue],
  /// after which it becomes output only.
  ///
  /// The queue name.
  ///
  /// The queue name must have the following format:
  /// `projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID`
  ///
  /// * `PROJECT_ID` can contain letters ([A-Za-z]), numbers ([0-9]),
  ///    hyphens (-), colons (:), or periods (.).
  ///    For more information, see
  ///    [Identifying
  ///    projects](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects)
  /// * `LOCATION_ID` is the canonical ID for the queue's location.
  ///    The list of available locations can be obtained by calling
  ///    [ListLocations][google.cloud.location.Locations.ListLocations].
  ///    For more information, see https://cloud.google.com/about/locations/.
  /// * `QUEUE_ID` can contain letters ([A-Za-z]), numbers ([0-9]), or
  ///   hyphens (-). The maximum length is 100 characters.
  public var name: String = String()

  public var queueType: Google_Cloud_Tasks_V2beta3_Queue.OneOf_QueueType? = nil

  /// [AppEngineHttpQueue][google.cloud.tasks.v2beta3.AppEngineHttpQueue] settings apply only to
  /// [App Engine tasks][google.cloud.tasks.v2beta3.AppEngineHttpRequest] in this queue.
  /// [Http tasks][google.cloud.tasks.v2beta3.HttpRequest] are not affected by this proto.
  public var appEngineHTTPQueue: Google_Cloud_Tasks_V2beta3_AppEngineHttpQueue {
    get {
      if case .appEngineHTTPQueue(let v)? = queueType {return v}
      return Google_Cloud_Tasks_V2beta3_AppEngineHttpQueue()
    }
    set {queueType = .appEngineHTTPQueue(newValue)}
  }

  /// Rate limits for task dispatches.
  ///
  /// [rate_limits][google.cloud.tasks.v2beta3.Queue.rate_limits] and [retry_config][google.cloud.tasks.v2beta3.Queue.retry_config] are
  /// related because they both control task attempts. However they control task
  /// attempts in different ways:
  ///
  /// * [rate_limits][google.cloud.tasks.v2beta3.Queue.rate_limits] controls the total rate of
  ///   dispatches from a queue (i.e. all traffic dispatched from the
  ///   queue, regardless of whether the dispatch is from a first
  ///   attempt or a retry).
  /// * [retry_config][google.cloud.tasks.v2beta3.Queue.retry_config] controls what happens to
  ///   particular a task after its first attempt fails. That is,
  ///   [retry_config][google.cloud.tasks.v2beta3.Queue.retry_config] controls task retries (the
  ///   second attempt, third attempt, etc).
  ///
  /// The queue's actual dispatch rate is the result of:
  ///
  /// * Number of tasks in the queue
  /// * User-specified throttling: [rate_limits][google.cloud.tasks.v2beta3.Queue.rate_limits],
  ///   [retry_config][google.cloud.tasks.v2beta3.Queue.retry_config], and the
  ///   [queue's state][google.cloud.tasks.v2beta3.Queue.state].
  /// * System throttling due to `429` (Too Many Requests) or `503` (Service
  ///   Unavailable) responses from the worker, high error rates, or to smooth
  ///   sudden large traffic spikes.
  public var rateLimits: Google_Cloud_Tasks_V2beta3_RateLimits {
    get {return _rateLimits ?? Google_Cloud_Tasks_V2beta3_RateLimits()}
    set {_rateLimits = newValue}
  }
  /// Returns true if `rateLimits` has been explicitly set.
  public var hasRateLimits: Bool {return self._rateLimits != nil}
  /// Clears the value of `rateLimits`. Subsequent reads from it will return its default value.
  public mutating func clearRateLimits() {self._rateLimits = nil}

  /// Settings that determine the retry behavior.
  ///
  /// * For tasks created using Cloud Tasks: the queue-level retry settings
  ///   apply to all tasks in the queue that were created using Cloud Tasks.
  ///   Retry settings cannot be set on individual tasks.
  /// * For tasks created using the App Engine SDK: the queue-level retry
  ///   settings apply to all tasks in the queue which do not have retry settings
  ///   explicitly set on the task and were created by the App Engine SDK. See
  ///   [App Engine
  ///   documentation](https://cloud.google.com/appengine/docs/standard/python/taskqueue/push/retrying-tasks).
  public var retryConfig: Google_Cloud_Tasks_V2beta3_RetryConfig {
    get {return _retryConfig ?? Google_Cloud_Tasks_V2beta3_RetryConfig()}
    set {_retryConfig = newValue}
  }
  /// Returns true if `retryConfig` has been explicitly set.
  public var hasRetryConfig: Bool {return self._retryConfig != nil}
  /// Clears the value of `retryConfig`. Subsequent reads from it will return its default value.
  public mutating func clearRetryConfig() {self._retryConfig = nil}

  /// Output only. The state of the queue.
  ///
  /// `state` can only be changed by called
  /// [PauseQueue][google.cloud.tasks.v2beta3.CloudTasks.PauseQueue],
  /// [ResumeQueue][google.cloud.tasks.v2beta3.CloudTasks.ResumeQueue], or uploading
  /// [queue.yaml/xml](https://cloud.google.com/appengine/docs/python/config/queueref).
  /// [UpdateQueue][google.cloud.tasks.v2beta3.CloudTasks.UpdateQueue] cannot be used to change `state`.
  public var state: Google_Cloud_Tasks_V2beta3_Queue.State = .unspecified

  /// Output only. The last time this queue was purged.
  ///
  /// All tasks that were [created][google.cloud.tasks.v2beta3.Task.create_time] before this time
  /// were purged.
  ///
  /// A queue can be purged using [PurgeQueue][google.cloud.tasks.v2beta3.CloudTasks.PurgeQueue], the
  /// [App Engine Task Queue SDK, or the Cloud
  /// Console](https://cloud.google.com/appengine/docs/standard/python/taskqueue/push/deleting-tasks-and-queues#purging_all_tasks_from_a_queue).
  ///
  /// Purge time will be truncated to the nearest microsecond. Purge
  /// time will be unset if the queue has never been purged.
  public var purgeTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _purgeTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_purgeTime = newValue}
  }
  /// Returns true if `purgeTime` has been explicitly set.
  public var hasPurgeTime: Bool {return self._purgeTime != nil}
  /// Clears the value of `purgeTime`. Subsequent reads from it will return its default value.
  public mutating func clearPurgeTime() {self._purgeTime = nil}

  /// Configuration options for writing logs to
  /// [Stackdriver Logging](https://cloud.google.com/logging/docs/). If this
  /// field is unset, then no logs are written.
  public var stackdriverLoggingConfig: Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig {
    get {return _stackdriverLoggingConfig ?? Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig()}
    set {_stackdriverLoggingConfig = newValue}
  }
  /// Returns true if `stackdriverLoggingConfig` has been explicitly set.
  public var hasStackdriverLoggingConfig: Bool {return self._stackdriverLoggingConfig != nil}
  /// Clears the value of `stackdriverLoggingConfig`. Subsequent reads from it will return its default value.
  public mutating func clearStackdriverLoggingConfig() {self._stackdriverLoggingConfig = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_QueueType: Equatable {
    /// [AppEngineHttpQueue][google.cloud.tasks.v2beta3.AppEngineHttpQueue] settings apply only to
    /// [App Engine tasks][google.cloud.tasks.v2beta3.AppEngineHttpRequest] in this queue.
    /// [Http tasks][google.cloud.tasks.v2beta3.HttpRequest] are not affected by this proto.
    case appEngineHTTPQueue(Google_Cloud_Tasks_V2beta3_AppEngineHttpQueue)

  #if !swift(>=4.1)
    public static func ==(lhs: Google_Cloud_Tasks_V2beta3_Queue.OneOf_QueueType, rhs: Google_Cloud_Tasks_V2beta3_Queue.OneOf_QueueType) -> Bool {
      switch (lhs, rhs) {
      case (.appEngineHTTPQueue(let l), .appEngineHTTPQueue(let r)): return l == r
      }
    }
  #endif
  }

  /// State of the queue.
  public enum State: SwiftProtobuf.Enum {
    public typealias RawValue = Int

    /// Unspecified state.
    case unspecified // = 0

    /// The queue is running. Tasks can be dispatched.
    ///
    /// If the queue was created using Cloud Tasks and the queue has
    /// had no activity (method calls or task dispatches) for 30 days,
    /// the queue may take a few minutes to re-activate. Some method
    /// calls may return [NOT_FOUND][google.rpc.Code.NOT_FOUND] and
    /// tasks may not be dispatched for a few minutes until the queue
    /// has been re-activated.
    case running // = 1

    /// Tasks are paused by the user. If the queue is paused then Cloud
    /// Tasks will stop delivering tasks from it, but more tasks can
    /// still be added to it by the user.
    case paused // = 2

    /// The queue is disabled.
    ///
    /// A queue becomes `DISABLED` when
    /// [queue.yaml](https://cloud.google.com/appengine/docs/python/config/queueref)
    /// or
    /// [queue.xml](https://cloud.google.com/appengine/docs/standard/java/config/queueref)
    /// is uploaded which does not contain the queue. You cannot directly disable
    /// a queue.
    ///
    /// When a queue is disabled, tasks can still be added to a queue
    /// but the tasks are not dispatched.
    ///
    /// To permanently delete this queue and all of its tasks, call
    /// [DeleteQueue][google.cloud.tasks.v2beta3.CloudTasks.DeleteQueue].
    case disabled // = 3
    case UNRECOGNIZED(Int)

    public init() {
      self = .unspecified
    }

    public init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unspecified
      case 1: self = .running
      case 2: self = .paused
      case 3: self = .disabled
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    public var rawValue: Int {
      switch self {
      case .unspecified: return 0
      case .running: return 1
      case .paused: return 2
      case .disabled: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  public init() {}

  fileprivate var _rateLimits: Google_Cloud_Tasks_V2beta3_RateLimits? = nil
  fileprivate var _retryConfig: Google_Cloud_Tasks_V2beta3_RetryConfig? = nil
  fileprivate var _purgeTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _stackdriverLoggingConfig: Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig? = nil
}

#if swift(>=4.2)

extension Google_Cloud_Tasks_V2beta3_Queue.State: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  public static var allCases: [Google_Cloud_Tasks_V2beta3_Queue.State] = [
    .unspecified,
    .running,
    .paused,
    .disabled,
  ]
}

#endif  // swift(>=4.2)

/// Rate limits.
///
/// This message determines the maximum rate that tasks can be dispatched by a
/// queue, regardless of whether the dispatch is a first task attempt or a retry.
///
/// Note: The debugging command, [RunTask][google.cloud.tasks.v2beta3.CloudTasks.RunTask], will run a task
/// even if the queue has reached its [RateLimits][google.cloud.tasks.v2beta3.RateLimits].
public struct Google_Cloud_Tasks_V2beta3_RateLimits {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The maximum rate at which tasks are dispatched from this queue.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  /// * For [App Engine queues][google.cloud.tasks.v2beta3.AppEngineHttpQueue], the maximum allowed value
  ///   is 500.
  ///
  ///
  /// This field has the same meaning as
  /// [rate in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#rate).
  public var maxDispatchesPerSecond: Double = 0

  /// Output only. The max burst size.
  ///
  /// Max burst size limits how fast tasks in queue are processed when
  /// many tasks are in the queue and the rate is high. This field
  /// allows the queue to have a high rate so processing starts shortly
  /// after a task is enqueued, but still limits resource usage when
  /// many tasks are enqueued in a short period of time.
  ///
  /// The [token bucket](https://wikipedia.org/wiki/Token_Bucket)
  /// algorithm is used to control the rate of task dispatches. Each
  /// queue has a token bucket that holds tokens, up to the maximum
  /// specified by `max_burst_size`. Each time a task is dispatched, a
  /// token is removed from the bucket. Tasks will be dispatched until
  /// the queue's bucket runs out of tokens. The bucket will be
  /// continuously refilled with new tokens based on
  /// [max_dispatches_per_second][google.cloud.tasks.v2beta3.RateLimits.max_dispatches_per_second].
  ///
  /// Cloud Tasks will pick the value of `max_burst_size` based on the
  /// value of
  /// [max_dispatches_per_second][google.cloud.tasks.v2beta3.RateLimits.max_dispatches_per_second].
  ///
  /// For App Engine queues that were created or updated using
  /// `queue.yaml/xml`, `max_burst_size` is equal to
  /// [bucket_size](https://cloud.google.com/appengine/docs/standard/python/config/queueref#bucket_size).
  /// Since `max_burst_size` is output only, if
  /// [UpdateQueue][google.cloud.tasks.v2beta3.CloudTasks.UpdateQueue] is called on a queue
  /// created by `queue.yaml/xml`, `max_burst_size` will be reset based
  /// on the value of
  /// [max_dispatches_per_second][google.cloud.tasks.v2beta3.RateLimits.max_dispatches_per_second],
  /// regardless of whether
  /// [max_dispatches_per_second][google.cloud.tasks.v2beta3.RateLimits.max_dispatches_per_second]
  /// is updated.
  public var maxBurstSize: Int32 = 0

  /// The maximum number of concurrent tasks that Cloud Tasks allows
  /// to be dispatched for this queue. After this threshold has been
  /// reached, Cloud Tasks stops dispatching tasks until the number of
  /// concurrent requests decreases.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  ///
  /// The maximum allowed value is 5,000.
  ///
  ///
  /// This field has the same meaning as
  /// [max_concurrent_requests in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#max_concurrent_requests).
  public var maxConcurrentDispatches: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Retry config.
///
/// These settings determine when a failed task attempt is retried.
public struct Google_Cloud_Tasks_V2beta3_RetryConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Number of attempts per task.
  ///
  /// Cloud Tasks will attempt the task `max_attempts` times (that is, if the
  /// first attempt fails, then there will be `max_attempts - 1` retries). Must
  /// be >= -1.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  /// -1 indicates unlimited attempts.
  ///
  /// This field has the same meaning as
  /// [task_retry_limit in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#retry_parameters).
  public var maxAttempts: Int32 = 0

  /// If positive, `max_retry_duration` specifies the time limit for
  /// retrying a failed task, measured from when the task was first
  /// attempted. Once `max_retry_duration` time has passed *and* the
  /// task has been attempted [max_attempts][google.cloud.tasks.v2beta3.RetryConfig.max_attempts]
  /// times, no further attempts will be made and the task will be
  /// deleted.
  ///
  /// If zero, then the task age is unlimited.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  ///
  /// `max_retry_duration` will be truncated to the nearest second.
  ///
  /// This field has the same meaning as
  /// [task_age_limit in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#retry_parameters).
  public var maxRetryDuration: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _maxRetryDuration ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_maxRetryDuration = newValue}
  }
  /// Returns true if `maxRetryDuration` has been explicitly set.
  public var hasMaxRetryDuration: Bool {return self._maxRetryDuration != nil}
  /// Clears the value of `maxRetryDuration`. Subsequent reads from it will return its default value.
  public mutating func clearMaxRetryDuration() {self._maxRetryDuration = nil}

  /// A task will be [scheduled][google.cloud.tasks.v2beta3.Task.schedule_time] for retry between
  /// [min_backoff][google.cloud.tasks.v2beta3.RetryConfig.min_backoff] and
  /// [max_backoff][google.cloud.tasks.v2beta3.RetryConfig.max_backoff] duration after it fails,
  /// if the queue's [RetryConfig][google.cloud.tasks.v2beta3.RetryConfig] specifies that the task should be
  /// retried.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  ///
  /// `min_backoff` will be truncated to the nearest second.
  ///
  /// This field has the same meaning as
  /// [min_backoff_seconds in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#retry_parameters).
  public var minBackoff: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _minBackoff ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_minBackoff = newValue}
  }
  /// Returns true if `minBackoff` has been explicitly set.
  public var hasMinBackoff: Bool {return self._minBackoff != nil}
  /// Clears the value of `minBackoff`. Subsequent reads from it will return its default value.
  public mutating func clearMinBackoff() {self._minBackoff = nil}

  /// A task will be [scheduled][google.cloud.tasks.v2beta3.Task.schedule_time] for retry between
  /// [min_backoff][google.cloud.tasks.v2beta3.RetryConfig.min_backoff] and
  /// [max_backoff][google.cloud.tasks.v2beta3.RetryConfig.max_backoff] duration after it fails,
  /// if the queue's [RetryConfig][google.cloud.tasks.v2beta3.RetryConfig] specifies that the task should be
  /// retried.
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  ///
  /// `max_backoff` will be truncated to the nearest second.
  ///
  /// This field has the same meaning as
  /// [max_backoff_seconds in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#retry_parameters).
  public var maxBackoff: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _maxBackoff ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_maxBackoff = newValue}
  }
  /// Returns true if `maxBackoff` has been explicitly set.
  public var hasMaxBackoff: Bool {return self._maxBackoff != nil}
  /// Clears the value of `maxBackoff`. Subsequent reads from it will return its default value.
  public mutating func clearMaxBackoff() {self._maxBackoff = nil}

  /// The time between retries will double `max_doublings` times.
  ///
  /// A task's retry interval starts at
  /// [min_backoff][google.cloud.tasks.v2beta3.RetryConfig.min_backoff], then doubles
  /// `max_doublings` times, then increases linearly, and finally
  /// retries retries at intervals of
  /// [max_backoff][google.cloud.tasks.v2beta3.RetryConfig.max_backoff] up to
  /// [max_attempts][google.cloud.tasks.v2beta3.RetryConfig.max_attempts] times.
  ///
  /// For example, if [min_backoff][google.cloud.tasks.v2beta3.RetryConfig.min_backoff] is 10s,
  /// [max_backoff][google.cloud.tasks.v2beta3.RetryConfig.max_backoff] is 300s, and
  /// `max_doublings` is 3, then the a task will first be retried in
  /// 10s. The retry interval will double three times, and then
  /// increase linearly by 2^3 * 10s.  Finally, the task will retry at
  /// intervals of [max_backoff][google.cloud.tasks.v2beta3.RetryConfig.max_backoff] until the
  /// task has been attempted [max_attempts][google.cloud.tasks.v2beta3.RetryConfig.max_attempts]
  /// times. Thus, the requests will retry at 10s, 20s, 40s, 80s, 160s,
  /// 240s, 300s, 300s, ....
  ///
  /// If unspecified when the queue is created, Cloud Tasks will pick the
  /// default.
  ///
  ///
  /// This field has the same meaning as
  /// [max_doublings in
  /// queue.yaml/xml](https://cloud.google.com/appengine/docs/standard/python/config/queueref#retry_parameters).
  public var maxDoublings: Int32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _maxRetryDuration: SwiftProtobuf.Google_Protobuf_Duration? = nil
  fileprivate var _minBackoff: SwiftProtobuf.Google_Protobuf_Duration? = nil
  fileprivate var _maxBackoff: SwiftProtobuf.Google_Protobuf_Duration? = nil
}

/// Configuration options for writing logs to
/// [Stackdriver Logging](https://cloud.google.com/logging/docs/).
public struct Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Specifies the fraction of operations to write to
  /// [Stackdriver Logging](https://cloud.google.com/logging/docs/).
  /// This field may contain any value between 0.0 and 1.0, inclusive.
  /// 0.0 is the default and means that no operations are logged.
  public var samplingRatio: Double = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "google.cloud.tasks.v2beta3"

extension Google_Cloud_Tasks_V2beta3_Queue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Queue"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    3: .standard(proto: "app_engine_http_queue"),
    4: .standard(proto: "rate_limits"),
    5: .standard(proto: "retry_config"),
    6: .same(proto: "state"),
    7: .standard(proto: "purge_time"),
    10: .standard(proto: "stackdriver_logging_config"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.name)
      case 3:
        var v: Google_Cloud_Tasks_V2beta3_AppEngineHttpQueue?
        if let current = self.queueType {
          try decoder.handleConflictingOneOf()
          if case .appEngineHTTPQueue(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.queueType = .appEngineHTTPQueue(v)}
      case 4: try decoder.decodeSingularMessageField(value: &self._rateLimits)
      case 5: try decoder.decodeSingularMessageField(value: &self._retryConfig)
      case 6: try decoder.decodeSingularEnumField(value: &self.state)
      case 7: try decoder.decodeSingularMessageField(value: &self._purgeTime)
      case 10: try decoder.decodeSingularMessageField(value: &self._stackdriverLoggingConfig)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if case .appEngineHTTPQueue(let v)? = self.queueType {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._rateLimits {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if let v = self._retryConfig {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if self.state != .unspecified {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 6)
    }
    if let v = self._purgeTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    if let v = self._stackdriverLoggingConfig {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloud_Tasks_V2beta3_Queue, rhs: Google_Cloud_Tasks_V2beta3_Queue) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.queueType != rhs.queueType {return false}
    if lhs._rateLimits != rhs._rateLimits {return false}
    if lhs._retryConfig != rhs._retryConfig {return false}
    if lhs.state != rhs.state {return false}
    if lhs._purgeTime != rhs._purgeTime {return false}
    if lhs._stackdriverLoggingConfig != rhs._stackdriverLoggingConfig {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloud_Tasks_V2beta3_Queue.State: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "STATE_UNSPECIFIED"),
    1: .same(proto: "RUNNING"),
    2: .same(proto: "PAUSED"),
    3: .same(proto: "DISABLED"),
  ]
}

extension Google_Cloud_Tasks_V2beta3_RateLimits: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RateLimits"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_dispatches_per_second"),
    2: .standard(proto: "max_burst_size"),
    3: .standard(proto: "max_concurrent_dispatches"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularDoubleField(value: &self.maxDispatchesPerSecond)
      case 2: try decoder.decodeSingularInt32Field(value: &self.maxBurstSize)
      case 3: try decoder.decodeSingularInt32Field(value: &self.maxConcurrentDispatches)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxDispatchesPerSecond != 0 {
      try visitor.visitSingularDoubleField(value: self.maxDispatchesPerSecond, fieldNumber: 1)
    }
    if self.maxBurstSize != 0 {
      try visitor.visitSingularInt32Field(value: self.maxBurstSize, fieldNumber: 2)
    }
    if self.maxConcurrentDispatches != 0 {
      try visitor.visitSingularInt32Field(value: self.maxConcurrentDispatches, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloud_Tasks_V2beta3_RateLimits, rhs: Google_Cloud_Tasks_V2beta3_RateLimits) -> Bool {
    if lhs.maxDispatchesPerSecond != rhs.maxDispatchesPerSecond {return false}
    if lhs.maxBurstSize != rhs.maxBurstSize {return false}
    if lhs.maxConcurrentDispatches != rhs.maxConcurrentDispatches {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloud_Tasks_V2beta3_RetryConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".RetryConfig"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_attempts"),
    2: .standard(proto: "max_retry_duration"),
    3: .standard(proto: "min_backoff"),
    4: .standard(proto: "max_backoff"),
    5: .standard(proto: "max_doublings"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.maxAttempts)
      case 2: try decoder.decodeSingularMessageField(value: &self._maxRetryDuration)
      case 3: try decoder.decodeSingularMessageField(value: &self._minBackoff)
      case 4: try decoder.decodeSingularMessageField(value: &self._maxBackoff)
      case 5: try decoder.decodeSingularInt32Field(value: &self.maxDoublings)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxAttempts != 0 {
      try visitor.visitSingularInt32Field(value: self.maxAttempts, fieldNumber: 1)
    }
    if let v = self._maxRetryDuration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._minBackoff {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if let v = self._maxBackoff {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if self.maxDoublings != 0 {
      try visitor.visitSingularInt32Field(value: self.maxDoublings, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloud_Tasks_V2beta3_RetryConfig, rhs: Google_Cloud_Tasks_V2beta3_RetryConfig) -> Bool {
    if lhs.maxAttempts != rhs.maxAttempts {return false}
    if lhs._maxRetryDuration != rhs._maxRetryDuration {return false}
    if lhs._minBackoff != rhs._minBackoff {return false}
    if lhs._maxBackoff != rhs._maxBackoff {return false}
    if lhs.maxDoublings != rhs.maxDoublings {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".StackdriverLoggingConfig"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sampling_ratio"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularDoubleField(value: &self.samplingRatio)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.samplingRatio != 0 {
      try visitor.visitSingularDoubleField(value: self.samplingRatio, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig, rhs: Google_Cloud_Tasks_V2beta3_StackdriverLoggingConfig) -> Bool {
    if lhs.samplingRatio != rhs.samplingRatio {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
