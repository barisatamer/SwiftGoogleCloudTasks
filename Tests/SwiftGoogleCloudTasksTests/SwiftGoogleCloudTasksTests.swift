import XCTest
@testable import SwiftGoogleCloudTasks

final class SwiftGoogleCloudTasksTests: XCTestCase {
    var client: SwiftGoogleCloudTasksClient = .init()
    
    func testListQueues() {
        let request = Google_Cloud_Tasks_V2beta3_ListQueuesRequest.with {
            $0.parent = "projects/phrase-book-vapor/locations/europe-west1"
        }
        
        do {
            let response = try client.listQueues(request: request).wait()
            response.queues.forEach {
                print($0)
            }
            XCTAssert(response.queues.count > 0, "response.queues.count must be greater than zero")
        } catch {
            print("\n\n❌ Error: \(error)\n\n")
            XCTFail()
        }
    }
    
    func testCreateTask() {
        let request = Google_Cloud_Tasks_V2beta3_CreateTaskRequest.with {
            $0.parent = "projects/phrase-book-vapor/locations/europe-west1/queues/tts-queue"
            $0.task = Google_Cloud_Tasks_V2beta3_Task.with {
                $0.name = "projects/phrase-book-vapor/locations/europe-west1/queues/tts-queue/tasks/my_task_id"
                $0.httpRequest = Google_Cloud_Tasks_V2beta3_HttpRequest.with {
                    $0.url = "https://audiblecards-googletts-engine-iurffxovha-ew.a.run.app/health"
                    $0.httpMethod = .get
                }
            }
        }
        
        do {
            let response = try client.createTask(request: request).wait()
            print(response.name)
            // It should not succeed, as I've already created a task named: "projects/phrase-book-vapor/locations/europe-west1/queues/tts-queue/tasks/my_task_id"
            XCTFail()
        } catch {
            print("\n\n❌ Error: \(error)\n\n")
        }
    }
    
    static var allTests = [
        ("testListQueues", testListQueues),
        ("testCreateTask", testCreateTask),
    ]
}
