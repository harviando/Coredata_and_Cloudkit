//
//  ViewController.swift
//  NC3CoredataAndCloudkit
//
//  Created by Muhammad Harviando on 02/09/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var fetchButton: UIButton!
    @IBOutlet weak var uploadedImageView: UIImageView!
    @IBOutlet weak var fetchedImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uploadedImageView.layer.cornerRadius = 5
        uploadedImageView.layer.shadowOpacity = 0.2
        uploadedImageView.layer.shadowRadius = 5
        
        uploadButton.layer.cornerRadius = 5
        uploadButton.layer.shadowOpacity = 0.2
        uploadButton.layer.shadowRadius = 3
        
        fetchButton.layer.cornerRadius = 5
        fetchButton.layer.shadowOpacity = 0.2
        fetchButton.layer.shadowRadius = 3
        
        fetchedImageView.layer.cornerRadius = 5
        fetchedImageView.layer.shadowOpacity = 0.2
        fetchedImageView.layer.shadowRadius = 5
        
    }


    @IBAction func uploadButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let userPickedImage = info[.editedImage] as? UIImage else { return }
        
        uploadedImageView.image = userPickedImage
        picker.dismiss(animated: true)
        
        uploadedImageView.contentMode = .scaleAspectFill
        uploadedImageView.layer.cornerRadius = 5
        uploadedImageView.layer.shadowOpacity = 0.2
        uploadedImageView.layer.shadowRadius = 10
        
        if let imageData = uploadedImageView.image?.pngData() {
            DatabaseHelper.shareInstance.saveImage(data: imageData)
        }
    }
    
    @IBAction func fetchButtonPressed(_ sender: Any) {
        let arr = DatabaseHelper.shareInstance.fetchImage()
        let amount = arr.count-1
        print (amount)
        fetchedImageView.image = UIImage(data: arr[amount].img!)
        
        fetchedImageView.contentMode = .scaleAspectFill
        fetchedImageView.layer.cornerRadius = 5
        fetchedImageView.layer.shadowOpacity = 0.2
        fetchedImageView.layer.shadowRadius = 10
    }
}

