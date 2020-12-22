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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let rp = Bundle.main.resourceURL {
            let fp = rp.appendingPathComponent("running.fit")
            let file = FitFile(file: fp)
            if let msg = file?.messages(forMessageType: FitMessageType.record) {
                self.label.stringValue = "Loaded \(msg.count) records"
            }else{
                self.label.stringValue = "Failed to load"
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

