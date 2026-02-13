//
//  StatView.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 20/01/26.
//

import UIKit

@IBDesignable
class StatUIView: UIView {

    @IBInspectable var countText : String? {
            get { return countLabel.text }
            set { countLabel.text = newValue }
        }
        
    @IBInspectable var titleText: String? {
            get { return titleLabel.text }
            set { titleLabel.text = newValue }
        }
  

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: StatUIView.self)
        let nib = UINib(nibName: "StatView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
