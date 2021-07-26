//
//  ViewController.swift
//  Accessibility Playground
//
//  Created by louis on 7/19/21.
//

import UIKit

class LaunchViewController: UIViewController {
  @IBOutlet weak var heading1: UILabel!
  @IBOutlet weak var heading2: UILabel!
  @IBOutlet weak var heading3: UILabel!
  @IBOutlet var headings: [UILabel]!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Launch VC"

    headings.forEach { heading in
      heading.accessibilityTraits = .header
    }
  }

  @IBAction func buttonTapped(_ sender: Any) {
    let detailVC = DetailViewController()

    navigationController?.pushViewController(detailVC, animated: true)
  }
}
