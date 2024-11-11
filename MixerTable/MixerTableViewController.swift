//
//  MixerTableViewController.swift
//  MixerTable
//
//  Created by Daria Cheremina on 10/11/2024.
//

import UIKit

class MixerTableViewController: UIViewController {

    private lazy var mixerTableView = MixerTableView(frame: view.frame, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "Task 4"

        mixerTableView.backgroundColor = .systemGray5

        view.addSubview(mixerTableView)
        let barButtonItem = UIBarButtonItem(title: "Shuffle", style: .done, target: self, action: #selector(shuffle))
        navigationItem.rightBarButtonItem = barButtonItem
    }

    @objc func shuffle() {
        mixerTableView.shuffleCells()
    }
}

