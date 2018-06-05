//
//  ViewController.swift
//  SamInstagramScrollViewDemo
//
//  Created by MACBOOK on 2018/6/5.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userInfoView: UserInfoView!

    private let navBarHeightPlusStatusHeight: CGFloat = 64.0

    override func viewDidLoad() {
        super.viewDidLoad()

        childViewConfiguration()

    }

    func childViewConfiguration() {
        guard let photoTableVC = self.childViewControllers[0] as? PhotoTableViewController else { return }

        photoTableVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UserProfileViewController: PhotoTableViewControllerDelegate {
    func tableViewDidScroll(_ tableView: PhotoTableViewController, translation: CGFloat) {

        self.userInfoView.frame = CGRect(x:0, y: navBarHeightPlusStatusHeight - translation, width: self.userInfoView.frame.width, height: 200)
    }
}


