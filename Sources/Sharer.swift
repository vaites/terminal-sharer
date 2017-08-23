//
//  Sharer.swift
//  Terminal Sharer
//
//  Created by David Martínez on 23/8/17.
//  Copyright © 2017 David Martínez. All rights reserved.
//

import AppKit
import Foundation

class Sharer
{
    let console = Console()

    /// Start sharer on specified mode
    init()
    {
        let arguments = console.getArguments()

        switch(arguments["mode"]!)
        {
            case "daemon":
               daemonMode(arguments: arguments)
           
            case "interactive":
               interactiveMode()
           
            default:
                staticMode(arguments: arguments)
        }
    }
    
    /// Starts the daemon mode listening for connections
    public func daemonMode(arguments: [String:String])
    {
        console.output("Daemonize!")
    }
    
    /// Starts the interactive mode asking for parameters
    public func interactiveMode()
    {
        var loop = true
        
        repeat
        {
            let input = console.getInput()
            
            console.printServices()
            
            switch input
            {
                case "service":
                    console.printServices()
                    loop = false
                
                default:
                    console.output("Unknown option \(input)", to: .error)
            }
        }
        while(loop)
    }
    
    /// Static (and default) mode
    public func staticMode(arguments: [String:String])
    {
        switch(arguments["command"]!)
        {
        case "help":
            console.printUsage()
            
        case "services":
            console.printServices()
            
        case "version":
            console.printVersion()
            
        default:
            share(arguments: arguments)
        }
    }
    
    /// Share using specified arguments
    public func share(arguments: [String:String])
    {
        
    }
}
