//
//  MealDetailViewController.swift
//  MVC lab
//
//  Created by Bertran on 09.10.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameTextFiels: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var raitingControl: UISlider!
    
    var meal: Meal?
    

    @IBAction func gesterHelper(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            nameTextFiels.resignFirstResponder()
        }
    }
    
    
    @IBAction func getPicture(_ sender: UIButton) {
        let pic = UIImagePickerController()
        pic.delegate = self
        pic.sourceType = .camera
        pic.allowsEditing = false
        self.present(pic, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            photoImageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let meal = meal {
            updateMeal(meal)
        }
        
    }
    
    func updateMeal(_ meal:Meal) {
        nameTextFiels.text = meal.name
        photoImageView.image = meal.photo
        raitingControl.value = Float(meal.rating)
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
