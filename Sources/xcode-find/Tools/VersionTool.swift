import Foundation

struct VersionTool: Tool {
    func run() {
        let version = "0.1.0"
        print("xcode-find version \(version)")
    }
}
