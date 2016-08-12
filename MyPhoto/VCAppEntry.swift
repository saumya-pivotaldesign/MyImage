//
//  VCAppEntry.swift
//  MyPhoto
//
//  Created by Pivotal on 8/12/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import Foundation
import UIKit

class VCAppEntry: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imgSelected:UIImage!
    @IBOutlet var uiImgSelected:UIImageView!
    
    let imagePicker:UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension VCAppEntry {
    @IBAction func onSelectPhoto(sender:UIButton){
        print("onSelectPhoto")
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func onUpload(sender:UIButton){
        print("onUpload")
    }
}

extension VCAppEntry {
}
//