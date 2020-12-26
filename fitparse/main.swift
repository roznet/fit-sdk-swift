//
//  main.swift
//  fittestswift
//
//  Created by Brice Rosenzweig on 16/12/2018.
//  Copyright © 2018 Brice Rosenzweig. All rights reserved.
//

import Foundation
import FitFileParser

let file = URL(fileURLWithPath: CommandLine.arguments[1])

print( "Parsing \(file.path)" )

let startTime = CFAbsoluteTimeGetCurrent()
if let fitfile = FitFile(file: file) {
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    let timeFormatted = String(format: "%.3f", timeElapsed)
    print( "Read \(fitfile.messages.count) messages in \(timeFormatted) seconds" )
}else{
    print( "failed" )
}

