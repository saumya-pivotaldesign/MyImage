//
//  VCAppEntry.swift
//  MyPhoto
//
//  Created by Pivotal on 8/12/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import Foundation
import UIKit

class VCAppEntry: UIViewController {
    
    @IBOutlet var imgSelected:UIImage!
    @IBOutlet var uiImgSelected:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension VCAppEntry {
    @IBAction func onSelectPhoto(){
        print("onSelectPhoto")
    }
    @IBAction func onUpload(){
        print("onUpload")
    }
}