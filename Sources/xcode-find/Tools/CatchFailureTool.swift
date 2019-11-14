import Foundation

struct CatchFailureTool: Tool {
    private let reason: String

    init(reason: String) {
        self.reason = reason
    }

    func run() {
        let description = """
xcode-find: error: \(reason)
"""
        print(description)
        HelpTool().run()
        exit(1)
    }
}
