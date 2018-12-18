//
//  ViewController.swift
//  ColorFinder
//
//  Created by Derick Peterson on 12/5/18.
//  Copyright © 2018 Derick Peterson. All rights reserved.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hexValue: UITextField!
    @IBOutlet weak var rgbValue: UITextField!
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loadImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let tapPoint = touch.location(in: self.view)
            let loc = tapPoint
            let color = imageView.colorOfTouch(point: loc)

            rgbValue.text = color.rgb()
            hexValue.text = color.hex()
            colorView.backgroundColor = color
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("No image, \(info)")
        }

        imageView.image = selectedImage
        image = selectedImage

        dismiss(animated: true, completion: nil)
    }
}

