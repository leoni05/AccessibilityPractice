//
//  ExViewController.swift
//  AccessibilityPractice
//
//  Created by yongjun18 on 1/31/25.
//

import Foundation
import UIKit
import PinLayout

class ExViewController: UIViewController {
 
    // MARK: - Properties
    
    private var tableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = ExCustomCell.cellHeight
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExCustomCell.self, forCellReuseIdentifier: ExCustomCell.reuseIdentifier)
        tableView.backgroundColor = nil
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.pin.all()
    }
}

// MARK: - TableView DataSource

extension ExViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExCustomCell.reuseIdentifier, for: indexPath) as? ExCustomCell else {
            return UITableViewCell()
        }
        cell.label.text = "Cell \(indexPath.row)"
        return cell
    }
}

// MARK: - TableView Delegate

extension ExViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExCustomCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExDetailViewController()
        vc.label.text = "Cell \(indexPath.row) selected"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
