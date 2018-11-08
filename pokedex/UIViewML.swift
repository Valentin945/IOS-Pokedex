//
//  UIViewML.swift
//  pokedex
//
//  Created by Valentin LAMBERT on 11/7/18.
//  Copyright © 2018 Valentin LAMBERT. All rights reserved.
//

import UIKit
import CoreML
import Vision

class UIViewML: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func touch(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var UILabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var UIButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            ImageView.image = image
            self.analyzeImage(image)
        }
        dismiss(animated: true, completion: nil)
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: PokemonClassifier().model)
            return VNCoreMLRequest(model: model, completionHandler: self.handleClassification)
        } catch {
            fatalError("Can't load Vision ML model: \(error)")
        }
    }()
    
    func analyzeImage(_ uiImage: UIImage) {
        guard let ciImage = CIImage(image: uiImage) else {
            fatalError("Can't create CIImage from UIImage")
        }
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
            let handler = VNImageRequestHandler(ciImage: ciImage)
            try? handler.perform([self.classificationRequest])
        }
    }
    
    func handleClassification(request: VNRequest, error: Error?) {
        guard let observations = request.results as? [VNClassificationObservation]
            else { fatalError("Unexpected result type from VNCoreMLRequest") }
        
        guard let best = observations.first
            else { fatalError("Can't get best result") }
        
        DispatchQueue.main.async {
            self.UILabel.text = "Classification: \"\(best.identifier)\"\nConfidence: \(best.confidence)"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
