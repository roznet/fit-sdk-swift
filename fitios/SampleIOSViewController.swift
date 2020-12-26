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
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
    
        // Do any additional setup after loading the view, typically from a nib.
        if let rp = Bundle.main.resourceURL {
            let fp = rp.appendingPathComponent("running.fit")
            
            let start : Date = Date()
            let file = FitFile(file: fp, parsingType: .generic)
            if let msg = file?.countByMessageType(),
               let recs = msg[FitMessageType.record]{
                let elapsed = Date().timeIntervalSince(start)
                self.label.text = "Loaded \(recs) records"
                self.secondLabel.text = String(format: "in %.3f secs", elapsed)
                
            }else{
                self.label.text = "Failed to load"
                self.secondLabel.text = nil
            }
            
        }
        

        
    }


}

