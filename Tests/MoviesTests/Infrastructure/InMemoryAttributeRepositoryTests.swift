import XCTest
import SnapshotTesting
@testable import Movies

final class InMemoryAttributeRepositoryTests: XCTestCase {

  var sut: InMemoryAttributeRepository!

  override func setUp() {
    sut = InMemoryAttributeRepository()
  }

  override func tearDown() {
    sut = nil
  }

  // MARK: -

  func test_saveAttribute_withNoAttributes_createsNewAttribute() {
    let attribute = Attribute(id: "attribute:1", code: "2d")
    sut.save(attribute: attribute)

    XCAssertSnapshot(matching: sut.all(), as: .dump)
  }

  func test_saveAttribute_withAnAttribute_overridesAttribute() {
    sut.save(attribute: Attribute(id: "attribute:1", code: "2d"))

    let attribute = Attribute(id: "attribute:1", code: "4dx")
    sut.save(attribute: attribute)


    XCAssertSnapshot(matching: sut.all(), as: .dump)
  }

}
