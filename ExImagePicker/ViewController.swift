//
//  ViewController.swift
//  ExImagePicker
//
//  Created by RLogixxTraining on 09/08/23.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageViewEmp: UIImageView!
    @IBOutlet weak var txtfldName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtfldName.delegate = self
    }

    @IBAction func showGallery(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
               alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                   self.openCamera()
               }))

               alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                   self.openGallery()
               }))

               alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

               self.present(alert, animated: true, completion: nil)
    }
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            //imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageViewEmp.image = pickedImage
            print(convertImageToBase64String(img: pickedImage))
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        var strImage = img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
        return strImage
    }
//    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
//        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
//       // let image = UIImage(data: imageData!) ?? <#default value#>
//        return image
//    }
//
    func textFieldDidBeginEditing(_ textField: UITextField){
        
        print(textField.text)
    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
//        print(textField.text)
//        return true
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("in Range method")
        print(textField.text)
        return true
    }
    
    
}

