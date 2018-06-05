//
//  PhotoTableView.swift
//  SamInstagramScrollViewDemo
//
//  Created by MACBOOK on 2018/6/5.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//


import UIKit

protocol PhotoTableViewControllerDelegate: class {
    func tableViewDidScroll(_ tableView: PhotoTableViewController, translation: CGFloat)
}

class PhotoTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let userInfoViewHeight: CGFloat = 200.0

    weak var delegate: PhotoTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    func setupTableView() {

        self.tableView.backgroundColor = UIColor.orange

        self.tableView.delegate = self
        self.tableView.dataSource = self

        let nib = UINib(nibName: String(describing: PhotoTableViewCell.self), bundle: nil)

        self.tableView.register(nib, forCellReuseIdentifier: String(describing: PhotoTableViewCell.self))

        self.tableView.contentInset = UIEdgeInsetsMake(userInfoViewHeight, 0, 49, 0)
    }
}

extension PhotoTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PhotoTableViewCell.self),
            for: indexPath
            ) as! PhotoTableViewCell

        return tableViewCell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let translation = scrollView.contentOffset.y + userInfoViewHeight

        self.delegate?.tableViewDidScroll(self, translation: translation)
    }
}
