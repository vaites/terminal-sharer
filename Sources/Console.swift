//
//  ConsoleIO.swift
//  Terminal Share
//
//  Created by David Martínez on 22/8/17.
//  Copyright © 2017 David Martínez. All rights reserved.
//

import Foundation

enum OutputType
{
    case error
    case standard
}

class Console
{
    /// Current program version
    private var version = "0.1.1"

    /// Get the command line arguments as a filtered array
    public func getArguments() -> [String:String]
    {
        var arguments =
        [
            "command": "help",
            "mode": "static",

            "text": "",
            "link": "",
            "image": "",
            "video": ""
        ]

        if(CommandLine.argc > 1)
        {
            for index in 1...CommandLine.argc
            {
                output("\(index)")
                
                let argument = "" //CommandLine.arguments[1]
                
                switch(argument)
                {
                    /// mode switch
                    case "-D", "--daemon":
                        arguments["mode"] = "daemon"
                    
                    case "-I", "--interactive":
                        arguments["mode"] = "interactive"

                    /// unique command
                    case "-h", "--help":
                        arguments["command"] = "help"
                    
                    case "-V", "--services":
                        arguments["command"] = "services"
                    
                    case "-V", "--version":
                        arguments["command"] = "version"
                    
                    default:
                        output("Invalid argument \(argument)", to: .error)
                }
            }
        }
        
        return arguments
    }

    /// Get the user input
    public func getInput() -> String
    {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!

        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }

    /// Write output
    ///
    /// - parameters:
    ///     - message: text to write
    ///     - to: where to write (stdout or stderr)
    public func output(_ message: String, to: OutputType = .standard)
    {
        switch to
        {
            case .standard:
                print("\(message)")
            case .error:
                fputs("\(message)\n", stderr)
        }
    }
    
    /// Print the list of available services
    public func printServices()
    {
        output("Print service list")
    }
    
    /// Print program usage
    public func printUsage()
    {
        output("Terminal Sharer (\(version)) is a command-line tool to share texts, links, images and videos through macOS native sharing features")
        output("")
        output("Usage: terminal-sharer --service VALUE --[text|image|video] VALUE")
        output("")
        output("  -I, --interactive   Enters interactive mode")
        output("  -D, --daemon        Start as a daemon listening for connections")
        output("  -h, --help          Shows this screen and quit")
        output("  -i, --image         Path to an image to be shared (optional)")
        output("  -l, --link          Link to be shared (optional)")
        output("  -p, --port          Daemon port, greater than 1024 (only for daemon mode)")
        output("  -s, --service       Service name")
        output("  -S, --services      List of available services (only enabled)")
        output("  -t, --text          Text to be shared (optional)")
        output("  -V, --version       Shows the version number and quit")
        output("  -v, --video         Path to a video to be shared (optional)")
        output("")
    }
    
    /// Print program version
    public func printVersion()
    {
        output("Terminal Sharer (\(version))")
    }
}
