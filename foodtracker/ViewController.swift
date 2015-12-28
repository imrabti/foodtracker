//
//  ViewController.swift
//  foodtracker
//
//  Created by imrabti on 12/18/15.
//  Copyright © 2015 Nuvola. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPhoto: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        mealName.delegate = self
    }
    
    // MARK: Actions    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        mealName.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        mealPhoto.image = selectedImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

