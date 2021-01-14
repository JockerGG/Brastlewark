//
//  GnomeCell.swift
//  Brastlewark
//
//  Created by Eduardo García González on 10/01/21.
//

import UIKit

class GnomeCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profession: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var profileImage: LoaderImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.text = ""
        profession.text = ""
        age.text = ""
        weight.text = ""
        height.text = ""
        profileImage.image = nil
        profileImage.layer.borderWidth = 0.5
        profileImage.layer.mask?.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
        
        containerView.layer.borderWidth = 0.5
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        containerView.layer.cornerRadius = 3
        containerView.clipsToBounds = true
        containerView.layer.mask?.masksToBounds = false
        
    }
    
    func configure(model: Gnome) {
        name.text = model.name ?? ""
        profession.text = model.professions.first ?? "Without profession"
        age.text = String(format: "A: %d years", model.age ?? 0)
        weight.text = String(format: "W: %.2f lb", model.weight ?? 0.0)
        height.text = String(format: "H: %.2f ft", model.height ?? 0.0)
        
        if let url = model.thumbnail?.replacingOccurrences(of: "http:", with: "https:") {
            profileImage.load(url: url)
        }
    }

}
