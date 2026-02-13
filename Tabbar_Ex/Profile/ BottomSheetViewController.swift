//
//  ImagePickerDelegate.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 16/01/26.
//

import UIKit

protocol ImagePickerDelegate: AnyObject {
    func didSelectCamera()
    func didSelectGallery()
}

class BottomSheetViewController: UIViewController {

    // 🔵 STEP B – Delegate reference
    weak var delegate: ImagePickerDelegate?
    
    @IBAction func onCameraTapped(_ sender: Any) {
        delegate?.didSelectCamera()
        dismiss(animated: true)
    }
    

    @IBAction func onGalleryTapped(_ sender: Any) {
        delegate?.didSelectGallery()
        dismiss(animated: true)
    }

}
