//
//  UserInfoView.swift
//  SamInstagramScrollViewDemo
//
//  Created by MACBOOK on 2018/6/5.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

class UserInfoView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    private func setupView() {

        //        imageView.layer.borderWidth = 1

        imageView.layer.cornerRadius = 40

        imageView.clipsToBounds = true

        imageView.contentMode = .scaleAspectFill

    }

    func updateProfileWith(name: String, image imageString: String) {

        nameLabel.text = "userName"

    }


}
