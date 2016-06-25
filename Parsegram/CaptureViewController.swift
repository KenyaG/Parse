//
//  CaptureViewController.swift
//  Parsegram
//
//  Created by Kenya Gordon on 6/22/16.
//  Copyright © 2016 Kenya Gordon. All rights reserved.
//

import UIKit
import Parse
//import MBProgressHUD

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var captionField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            self.dismissViewControllerAnimated(true, completion: nil)

        }
        
    }

    
    @IBAction func postButton(sender: UIButton) {
        if let image = imageView.image {
            let resizedImage = Post.resize(image, newSize: CGSize(width: 240, height: 128))
            Post.postUserImage(resizedImage, withCaption: captionField.text) { (success: Bool, error: NSError?) in
                if success {
                    print("posted post")
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
       
    //UIImagePickerControllerDelegate Methods
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
