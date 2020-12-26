//
//  ViewController.swift
//  fitmacos
//
//  Created by Brice Rosenzweig on 16/02/2019.
//

import Cocoa
import FitFileParser

class SampleMacOSViewController: NSViewController {

    @IBOutlet weak var label: NSTextFieldCell!
    @IBOutlet weak var secondLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let rp = Bundle.main.resourceURL {
            let fp = rp.appendingPathComponent("running.fit")
            
            let start : Date = Date()
            let file = FitFile(file: fp, parsingType: .generic)
            if let msg = file?.countByMessageType(),
               let recs = msg[FitMessageType.record]{
                let elapsed = Date().timeIntervalSince(start)
                self.label.stringValue = "Loaded \(recs) records"
                self.secondLabel.stringValue = String(format: "in %.3f secs", elapsed)
            }else{
                self.label.stringValue = "Failed to load"
                self.secondLabel.stringValue = ""
            }
        }
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

