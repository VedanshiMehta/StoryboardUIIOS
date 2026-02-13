//
//  CardUIView.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 21/01/26.
//

import UIKit

@IBDesignable
class CardUIView: UIView {

    @IBOutlet private weak var cardView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    @IBInspectable var cornerRadius: CGFloat = 12 {
        didSet {
            setNeedsLayout()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cardView.layer.cornerRadius = cornerRadius
        cardView.clipsToBounds = true
    }

    private func loadNib() {
        let nib = UINib(nibName: "CardView", bundle: Bundle(for: Self.self))
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
