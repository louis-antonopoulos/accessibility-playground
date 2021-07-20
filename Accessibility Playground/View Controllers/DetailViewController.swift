//
//  DetailViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class DetailViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Detail VC"

    view.backgroundColor = .systemPink
  }
}

extension DetailViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1,
                               reuseIdentifier: "DetailViewControllerCell")

    cell.backgroundColor = .systemPink
    cell.textLabel!.text = "Row \(indexPath.row)"

    return cell
  }
}
