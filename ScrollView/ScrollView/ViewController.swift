//
//  ViewController.swift
//  ScrollView
//
//  Created by Brian Veitch on 7/20/23.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var sv: SuperCoolScrollView!
    let scrollView = SuperCoolScrollView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Backgrounds"
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Click on a picture button or press \"Change to Color\" button"
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let colorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change to Color", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.fillParent()
        
        scrollView.addView(titleLabel)
        scrollView.addView(subTitle)
        scrollView.addView(stackView)
        
        
        // add a bunch of rows to the scrollView
        var counter = 0
        for _ in 0..<20 {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 20
            rowStackView.distribution = .fill
            stackView.addArrangedSubview(rowStackView)
            rowStackView.layer.borderWidth = 1
            
            for _ in 0..<4 {
                let button = UIButton()
                button.setTitle("Button\(counter)", for: .normal)
                counter += 1
                button.setTitleColor(.blue, for: .normal)
                button.layer.borderWidth = 1
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addAction(UIAction(handler: { [weak self] _ in
                    self?.showAlert(title: button.titleLabel?.text ?? "")
                        }), for: .primaryActionTriggered)
                button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true

                rowStackView.addArrangedSubview(button)
            }
        }
        scrollView.addView(colorButton)
        colorButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.60).isActive = true
    }
    
    func showAlert(title: String) {
        let alertController = UIAlertController(title: "Button tapped", message: "You pressed \(title)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK tapped!")
        })
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel tapped!")
        })
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

