//
//  ProfileViewController.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 12/01/26.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImagePickerDelegate, UITableViewDelegate, UITableViewDataSource {
 

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTableView.delegate = self
        customTableView.dataSource = self
        
        customTableView.cellLayoutMarginsFollowReadableWidth = false
        customTableView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
         let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
         customTableView.register(nib, forCellReuseIdentifier: "MenuCell")
         customTableView.tableFooterView = UIView()
    }
   

    @IBAction func onTappedImage(_ sender: Any) {
        performSegue(withIdentifier: "ImageProfile", sender: nil)

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

          if segue.identifier == "ImageProfile" {

              let sheet = segue.destination as! BottomSheetViewController
              // 🔵 Connect delegate
              sheet.delegate = self
              // 🔥 iOS Bottom Sheet Style
              if let presentation = sheet.sheetPresentationController {
                  presentation.detents = [.custom { context in
                         return 200   // 👈 height you want
                     }]
                  presentation.prefersScrollingExpandsWhenScrolledToEdge = false
                  presentation.prefersGrabberVisible = true
              }
          }
    }
    
    // MARK: - Delegate Methods
    func didSelectCamera() {
        openCamera()
    }

    func didSelectGallery() {
        openGallery()
    }

    // MARK: - Camera
    func openCamera() {

        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera not available")
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    // MARK: - Gallery
    func openGallery() {

        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    // MARK: - Image Result
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {

        picker.dismiss(animated: true)

        if let image = info[.editedImage] as? UIImage {
            userImageView.image = image
        } else if let image = info[.originalImage] as? UIImage {
            userImageView.image = image
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
          return 2 // Account + Support
      }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // Using the data from your MenuItem.swift file
           return section == 0 ? accountSection.count : supportSection.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? CustomTableViewCell else {
               return UITableViewCell()
           }

           // 2. Get the correct item from your external file
           let item = (indexPath.section == 0) ? accountSection[indexPath.row] : supportSection[indexPath.row]

           // 3. Use your custom configure function
           cell.configure(with: item)

           return cell
       }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // 0.1 is the smallest value to remove the gap at the top
        return section == 0 ? 0.1 : 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10 // The gap between the two cards
        }
        return 0.1
    }
       // Set a nice height for each row
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 55
       }
    
}

