//
//  ViewController.swift
//  claseCameraAndVideos
//
//  Created by Alex Diaz on 21/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "zorro")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
       
        view.backgroundColor = UIColor.black
    }

    @IBAction func tapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
}

// MARK: - UIImagePickerContoller && UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let photo = info[.originalImage] as? UIImage {
            imageView.image = photo
        }
        
        dismiss(animated: true)
    }
}
