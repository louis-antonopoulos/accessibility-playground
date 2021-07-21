//
//  DetailViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class DetailViewController: UITableViewController {
  private let mainColor: UIColor = .systemPink

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Detail VC"

    view.backgroundColor = mainColor

    tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    tableView.backgroundColor = mainColor
  }
}

extension DetailViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "S \(section)"
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1,
                               reuseIdentifier: "DetailViewControllerCell")

    cell.backgroundColor = mainColor
    cell.textLabel!.text = "\(indexPath.section), \(indexPath.row)"

    return cell
  }
}
