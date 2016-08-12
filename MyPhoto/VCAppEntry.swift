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
        
        // UIImagePickerControllerSourceType.PhotoLibrary
        // UIImagePickerControllerSourceType.Camera
        // UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func onUpload(sender:UIButton){
        print("onUpload")
        
        let uImg:UIImage = uiImgSelected.image!
        let imgData = UIImageJPEGRepresentation(uImg, 1.0)
        
        print(uImg)
        
        print("ByteArray : =======================")
        print(imgData)
        print("Done ByteArray Data : =============")
        
        // the call below is just an example to calculate again in another way
        //getArrayOfBytesFromImage(imgData!)
    }
}

extension VCAppEntry {
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            uiImgSelected.contentMode = .ScaleAspectFit
            uiImgSelected.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // ref : https://stackoverflow.com/questions/29734059/convert-uiimage-to-byte-array-in-swift#29734526
    // MARK: - Utility Method
    func getArrayOfBytesFromImage(imageData:NSData) -> NSMutableArray
    {
        // the number of elements:
        let count = imageData.length / sizeof(UInt8)
        // create array of appropriate length:
        var bytes = [UInt8](count: count, repeatedValue: 0)
        // copy bytes into array
        imageData.getBytes(&bytes, length:count * sizeof(UInt8))
        var byteArray:NSMutableArray = NSMutableArray()
        for (var i = 0; i < count; i++) {
            byteArray.addObject(NSNumber(unsignedChar: bytes[i]))
        }
        
        print("getArrayOfBytesFromImage:   ============= ")
        print(byteArray)
        print("getArrayOfBytesFromImage: / ============= ")
        
        return byteArray
    }
}
//