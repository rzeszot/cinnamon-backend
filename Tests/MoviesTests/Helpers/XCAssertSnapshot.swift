import SnapshotTesting
import XCTest

public func XCAssertSnapshot<Value, Format>(
  matching value: @autoclosure () throws -> Value,
  as snapshotting: Snapshotting<Value, Format>,
  named name: String? = nil,
  file: StaticString = #file,
  testName: String = #function,
  line: UInt = #line
  ) {

  let fileUrl = URL(fileURLWithPath: "\(file)", isDirectory: false)
  let fileName = fileUrl.deletingPathExtension().lastPathComponent
  let layer = fileUrl.deletingLastPathComponent().lastPathComponent

  let snapshotDirectoryUrl = fileUrl
      .deletingLastPathComponent()
      .deletingLastPathComponent()
      .appendingPathComponent("__Snapshots__", isDirectory: true)
      .appendingPathComponent(layer, isDirectory: true)
      .appendingPathComponent(fileName, isDirectory: true)

  let failure = verifySnapshot(
    matching: try value(),
    as: snapshotting,
    named: name,
    snapshotDirectory: snapshotDirectoryUrl.absoluteString,
    file: file,
    testName: testName,
    line: line
  )

  guard let message = failure else { return }
  XCTFail(message, file: file, line: line)
}
