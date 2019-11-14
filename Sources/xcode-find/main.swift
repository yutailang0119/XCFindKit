import Foundation

let arguments = Array(CommandLine.arguments.dropFirst())
guard let option: String = arguments.first else {
    let tool = CatchFailureTool(reason: "no command option given")
    tool.run()
    exit(1)
}

let tool: Tool

switch option {
case "-h", "--help":
    if let argument = arguments.dropFirst().first {
        tool = CatchFailureTool(reason: "invalid argument '\(argument)'")
    } else {
        tool = HelpTool()
    }
case "-a", "--all":
    if let argument = arguments.dropFirst().first {
        tool = CatchFailureTool(reason: "invalid argument '\(argument)'")
    } else {
        tool = FindAllTool()
    }
case "-p", "--print-version":
    if let version = arguments.dropFirst().first {
        tool = FindTool(version: version)
    } else {
        tool = CatchFailureTool(reason: "missing argument to '\(option)'")
    }
case "-v", "--version":
    if let argument = arguments.dropFirst().first {
        tool = CatchFailureTool(reason: "invalid argument '\(argument)'")
    } else {
        tool = VersionTool()
    }
default:
    tool = CatchFailureTool(reason: "no command option given")
}

tool.run()
