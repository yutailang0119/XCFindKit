import Foundation
import XCFindKit

struct FindTool: Tool {
    private let version: String

    init(version: String) {
        self.version = version
    }

    func run() {
        let finder = XCFindKit.SpotlightXcodeFinder()
        guard let xcode = finder.find(version) else {
            print("Not Found selected version Xcode")
            return
        }
        print(xcode.path.path)
    }
}
