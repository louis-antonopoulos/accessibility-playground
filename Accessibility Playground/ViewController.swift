//
//  ViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var heading1: UILabel!
  @IBOutlet weak var heading2: UILabel!
  @IBOutlet weak var heading3: UILabel!
  @IBOutlet var headings: [UILabel]!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Wat"

    let someView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    someView.backgroundColor = .blue
    someView.accessibilityLabel = "Title View"

    headings.forEach { heading in
      heading.accessibilityTraits = .header
    }
  }

  @IBAction func buttonTapped(_ sender: Any) {
    let detailVC = DetailViewController()

    navigationController?.pushViewController(detailVC, animated: true)
  }
}
