//
//  ViewController.swift
//  ScrollView
//
//  Created by Brian Veitch on 7/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = BVSV()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.fillParent()
        
        // add a bunch of views to the scrollView
        for _ in 0..<50 {
            let label = UILabel()
            label.text = "ng and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishin"
            let button = UIButton(type: .close)
            button.setTitle("This is a button", for: .normal)
            
            scrollView.addView(label)
            scrollView.addView(button)
        }
    }
}

