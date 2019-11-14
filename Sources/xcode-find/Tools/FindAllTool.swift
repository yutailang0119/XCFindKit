import Foundation
import XCFindKit

struct FindAllTool: Tool {
    func run() {
        let finder = XCFindKit.SpotlightXcodeFinder()
        let xcodes = finder.findXcodes()
        if xcodes.isEmpty {
            print("Not Found installed Xcodes")
        } else {
            xcodes
                .lazy
                .map { $0.path.path }
                .forEach { print($0) }
        }
    }
}
