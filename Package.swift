//
//  Package.swift
//  Terminal Sharer
//
//  Created by David Martínez on 23/8/17.
//  Copyright © 2017 David Martínez. All rights reserved.
//

import PackageDescription

/**
    Package definition
 */
let package = Package(
    name: "terminal-sharer",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7)
    ]
)
