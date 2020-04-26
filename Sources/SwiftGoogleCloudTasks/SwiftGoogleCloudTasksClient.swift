import Foundation
import NIO
import OAuth2
import NIOHPACK
import GRPC
import SwiftProtobuf

public class SwiftGoogleCloudTasksClient {
    
    enum AuthError: Error {
        case noTokenProvider
        case tokenProviderFailed
    }
    
    struct Constants {
        static let host: String = "cloudtasks.googleapis.com"
        static let port: Int = 443
        static let scopes: [String] = ["https://www.googleapis.com/auth/cloud-platform"]
    }
    
    public var eventLoopGroup: EventLoopGroup
    
    // MARK: Public Initializer
    
    public init(eventLoopGroup: EventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)) {
        self.eventLoopGroup = eventLoopGroup
    }
    
    // MARK: Public Methods
    
    /// Returns a list of queues
    public func listQueues(
        request: Google_Cloud_Tasks_V2beta3_ListQueuesRequest
    ) throws -> EventLoopFuture<Google_Cloud_Tasks_V2beta3_ListQueuesResponse> {
        let client = makeServiceClient(
            host: Constants.host,
            port: Constants.port,
            eventLoopGroup: eventLoopGroup
        )
        return try prepareCallOptions(eventLoopGroup: eventLoopGroup, parent: request.parent)
            .flatMap { callOptions -> EventLoopFuture<Google_Cloud_Tasks_V2beta3_ListQueuesResponse> in
                return client.listQueues(request, callOptions: callOptions).response
        }
    }
    
    public func createTask(
        request: Google_Cloud_Tasks_V2beta3_CreateTaskRequest
    ) throws -> EventLoopFuture<Google_Cloud_Tasks_V2beta3_Task> {
        let client = makeServiceClient(
            host: Constants.host,
            port: Constants.port,
            eventLoopGroup: eventLoopGroup
        )
        return try prepareCallOptions(eventLoopGroup: eventLoopGroup, parent: request.parent)
            .flatMap { callOptions -> EventLoopFuture<Google_Cloud_Tasks_V2beta3_Task> in
                return client.createTask(request, callOptions: callOptions).response
        }
    }
    
    public func shutDown() {
        try? eventLoopGroup.syncShutdownGracefully()
    }

    // MARK: Private Methods

    /// https://github.com/googleapis/google-cloud-go/issues/1027 (for parent x-goog-request-params issue)
    private func prepareCallOptions(eventLoopGroup: EventLoopGroup, parent: String? = nil) throws -> EventLoopFuture<CallOptions> {
        return getAuthToken(
            scopes: Constants.scopes,
            eventLoop: eventLoopGroup.next()
        ).map { authToken -> (CallOptions) in
            // Use CallOptions to send the auth token (necessary) and set a custom timeout (optional).
            var headers: HPACKHeaders = ["authorization": "Bearer \(authToken)"]
            if let parent = parent {
                headers.add(name:"x-goog-request-params", value: "parent=" + parent)
            }
            
            let callOptions = CallOptions(customMetadata: headers, timeout: .seconds(rounding: 30))
            debugPrint("CALL OPTIONS\n\(callOptions)\n")
            return callOptions
        }
    }
    
    /// Get an auth token and return a future to provide its value.
    private var token: Token?
    private func getAuthToken(
        scopes: [String],
        eventLoop: EventLoop
    ) -> EventLoopFuture<String> {
        let promise = eventLoop.makePromise(of: String.self)
        guard let provider = DefaultTokenProvider(scopes: scopes) else {
            promise.fail(AuthError.noTokenProvider)
            return promise.futureResult
        }
        
        if let token = self.token,
            let accessToken = token.AccessToken,
            let expiresIn = token.ExpiresIn,
            let creationTime = token.CreationTime,
            creationTime.addingTimeInterval(TimeInterval(expiresIn)) > Date() {
            // TODO: Use refresh token
            promise.succeed(accessToken)
        } else {
            do {
                try provider.withToken { (token, error) in
                    if var token = token, let accessToken = token.AccessToken {
                        if token.CreationTime == nil {
                            token.CreationTime = Date()
                        }
                        self.token = token
                        promise.succeed(accessToken)
                    } else if let error = error {
                        promise.fail(error)
                    } else {
                        promise.fail(AuthError.tokenProviderFailed)
                    }
                }
            } catch {
                promise.fail(error)
            }
        }
        return promise.futureResult
    }

    /// Create a client and return a future to provide its value.
    private func makeServiceClient(
        host: String,
        port: Int,
        eventLoopGroup: EventLoopGroup
    ) -> Google_Cloud_Tasks_V2beta3_CloudTasksClient {
        let configuration = ClientConnection.Configuration(
            target: .hostAndPort(host, port),
            eventLoopGroup: eventLoopGroup,
            tls: .init()
        )
        let connection = ClientConnection(configuration: configuration)
        return .init(channel: connection)
    }
}
