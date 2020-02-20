//
//  ViewController.swift
//  Cameraapp
//
//  Created by 中條航紀 on 2020/02/19.
//  Copyright © 2020 中條航紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func cameraLaunchAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("カメラが使えます")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true, completion: nil)
        } else {
            print("カメラが使えません")
        }
    }
    
    @IBAction func shareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

