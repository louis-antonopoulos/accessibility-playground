//
//  DetailViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class DetailViewController: UIViewController {
  private let label1 = UILabel()
  private let mainColor: UIColor = .white
  private let tableView1 = UITableView.init(frame: CGRect.zero, style: .grouped)

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Detail VC"
    view.backgroundColor = mainColor

    setupLabel()
    setupTableView()
    setupAccessibility()
  }

  private func setupAccessibility() {
    label1.accessibilityTraits = .header
  }

  private func setupLabel() {
    label1.text = "Some Label"

    label1.textColor = .black

    view.addSubview(label1)

    label1.translatesAutoresizingMaskIntoConstraints = false
    label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    label1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    label1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
  }

  private func setupTableView() {
    tableView1.backgroundColor = mainColor
    tableView1.dataSource = self
    tableView1.delegate = self

    view.addSubview(tableView1)

    tableView1.translatesAutoresizingMaskIntoConstraints = false
    tableView1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20).isActive = true
    tableView1.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }
}

extension DetailViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    3
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    "S \(section)"
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1,
                               reuseIdentifier: "DetailViewControllerCell")

    cell.backgroundColor = mainColor
    cell.textLabel!.text = "\(indexPath.section), \(indexPath.row)"

    return cell
  }
}

extension DetailViewController: UITableViewDelegate {}
