//
//  DetailViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class DetailViewController: UIViewController {
  private let label1 = UILabel()
  private let label2 = UILabel()
  private let mainColor: UIColor = .white
  private let tableView1 = UITableView.init(frame: CGRect.zero, style: .grouped)
  private let tableView2 = UITableView.init(frame: CGRect.zero, style: .grouped)

  private var allControls: [UIView] = []
  private var labels: [UILabel] = []
  private var tableViews: [UITableView] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Detail VC"
    view.backgroundColor = mainColor

    setupCollections()
    addSubviews()
    setupLabels()
    setupTableViews()
    setupYConstraints()
    setupAccessibility()
  }
}

extension DetailViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    2
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

private extension DetailViewController {
  func addSubviews() {
    allControls.forEach { control in
      view.addSubview(control)
    }
  }

  func setupAccessibility() {
    labels.forEach { label in
      label.accessibilityTraits.insert(.header)
    }
  }

  func setupCollections() {
    labels = [label1, label2]
    tableViews = [tableView1, tableView2]
    allControls = labels + tableViews
  }

  func setupLabels() {
    label1.text = "Header Label 1"
    label2.text = "Header Label 2"

    labels.forEach { label in
      label.textColor = .purple
      view.addSubview(label)
      label.translatesAutoresizingMaskIntoConstraints = false

      NSLayoutConstraint.activate([
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
      ])
    }
  }

  func setupTableViews() {
    tableViews.forEach { tableView in
      tableView.backgroundColor = mainColor
      tableView.dataSource = self
      tableView.delegate = self

      view.addSubview(tableView)
      tableView.translatesAutoresizingMaskIntoConstraints = false

      NSLayoutConstraint.activate([
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
      ])
    }
  }

  func setupYConstraints() {
    NSLayoutConstraint.activate([
      tableView2.heightAnchor.constraint(equalTo: tableView1.heightAnchor),

      label1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      tableView1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
      tableView2.topAnchor.constraint(equalTo: tableView1.bottomAnchor, constant: 20),
      // tableView2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      label2.topAnchor.constraint(equalTo: tableView2.bottomAnchor, constant: 20),
      label2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
    ])
  }
}
