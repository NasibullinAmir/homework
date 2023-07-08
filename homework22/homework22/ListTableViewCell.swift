//
//  ListTableViewCell.swift
//  homework22
//
//  Created by karim on 07.07.2023.
//

import UIKit
struct ContactsListTableViewData {
    var name : String
    var number : String
}
final class ListTableViewCell:UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        logoImageView.image = nil
    }
    func setUp(title:String,image:UIImage){
        titleLabel.text = title
        logoImageView.image = image
    }
    func setPersonalInfo (_ data: ContactsListTableViewData) {
        titleLabel.text = data.name
        
        }
}
