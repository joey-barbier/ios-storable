import XCTest
@testable import OrkaStorable

final class Todo: Stockable {
    var id: Int
    var title: String
    var completed: Bool
    
    init(id: Int, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
extension Todo: Equatable {
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
    }
}


class OrkaStorableTests: XCTestCase {

    private var tag = "test"
    private static var todoExample = Todo(id: 10, title: "hello", completed: true)
    
    override class func setUp() {
        OrkaStorable.setup()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() throws {
        let item: Todo = Self.todoExample
        try item.storage.add(withTag: tag)
        let listBdd = Todo.restore.find(byTag: tag)
        if !listBdd.contains(item) {
            XCTFail("item not found in flag")
        }
    }

    func testRestoreItem() throws {
        let item: Todo = Self.todoExample
        if Todo.restore.find(byId: "\(item.id)", tag: tag) == nil {
            XCTFail("item not found (find by id + flag)")
        }
    }
    
    func testRestoreItems() throws {
        let item: Todo = Self.todoExample
        let listBdd = Todo.restore.find(byTag: tag)
        if !listBdd.contains(item) {
            XCTFail("item not found (find by tag)")
        }
    }
    
    func testRestoreFakeItem() throws {
        let item: Todo = Self.todoExample
        let listBdd = Todo.restore.find(byTag: "\(tag)_fake")
        if listBdd.contains(item) {
            XCTFail("item found in fake flag")
        }
    }
}
