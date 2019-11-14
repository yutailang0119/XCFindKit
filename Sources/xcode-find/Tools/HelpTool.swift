import Foundation

struct HelpTool: Tool {
    func run() {
        let description = """
Usage: xcode-find [options]

Print the path to the installed Xcode.

Options:
  -h, --help                                print this help message and exit
  -a, --all                                 print the paths of all installed Xcode
  -p <version>, --print-version <version>   print the path of the selected version Xcode
  -v, --version                             print the xcode-find version
"""
        print(description)
    }
}
