//
//  GnomeDetailViewController.swift
//  Brastlewark
//
//  Created by Eduardo García on 14/01/21.
//

import UIKit

class GnomeDetailViewController: UIViewController {
    @IBOutlet weak var profileImage: LoaderImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var professionsStackView: UIStackView!
    @IBOutlet weak var friendsStackView: UIStackView!
    @IBOutlet weak var professionsHeightAnchor: NSLayoutConstraint!
    @IBOutlet weak var friendsHeightAnchor: NSLayoutConstraint!
    
    var details: Gnome?
    
    static func instantiate(details: Gnome) -> GnomeDetailViewController {
        let controller: GnomeDetailViewController = GnomeDetailViewController()
        controller.details = details
        controller.modalPresentationStyle = .formSheet
        
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        professionsHeightAnchor.isActive = false
        friendsHeightAnchor.isActive = false
        self.configureUI()
    }
    
    private func configureUI() {
        guard let gnome = details else { return }
        profileImage.toCircle()
        nameLabel.text = gnome.name ?? ""
        ageLabel.text = String(format: "%d years old", gnome.age ?? 0)
        weightLabel.text = String(format: "%.2f lb", gnome.weight ?? "0.0")
        heightLabel.text = String(format: "%.2f ft", gnome.height ?? "0.0")
        
        professionsStackView.subviews.forEach { $0.removeFromSuperview() }
        friendsStackView.subviews.forEach { $0.removeFromSuperview() }
        
        if gnome.professions.count > 0 {
            gnome.professions.forEach {
                professionsStackView.addArrangedSubview(createLabel(for: $0))
            }
        } else {
            professionsStackView.addArrangedSubview(createLabel(for: "No professions added"))
        }
        
        if gnome.friends.count > 0 {
            gnome.friends.forEach {
                friendsStackView.addArrangedSubview(createLabel(for: $0))
            }
        } else {
            friendsStackView.addArrangedSubview(createLabel(for: "No friends added"))
        }
        
        guard let url = gnome.thumbnail?.replacingOccurrences(of: "http:", with: "https:") else { return }
        
        profileImage.load(url: url)
    }
    
    func createLabel(for value: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = "- \(value)"
        label.font = UIFont(name: "AvenirNext-Regular", size: 20.0)
        label.textColor = .lightGray
        label.roundCorners(radius: 5)
        
        return label
    }

}
