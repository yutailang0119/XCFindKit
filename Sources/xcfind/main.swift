import Foundation
import XCFindKit

do {
    let finder: XcodeFinder = SpotlightXcodeFinder()

    let xcodes = finder.findXcodes()
    print(xcodes)

    let xcode11_2 = finder.find("11")
    print(xcode11_2)
}
