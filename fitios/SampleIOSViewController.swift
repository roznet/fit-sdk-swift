//
//  ViewController.swift
//  fitios
//
//  Created by Brice Rosenzweig on 11/02/2019.
//

import UIKit
import FitFileParser

class SampleIOSViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let rp = Bundle.main.resourceURL {
            let fp = rp.appendingPathComponent("running.fit")
            let file = FitFile(file: fp)
            if let msg = file?.messages(forMessageType: FitMessageType.record) {
                self.label.text = "Loaded \(msg.count) records"
            }else{
                self.label.text = "Failed to load"
            }
            
        }
        

        
    }


}

