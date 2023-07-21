//
//  ScrollView.swift
//  ScrollView
//
//  Created by Brian Veitch on 7/20/23.
//

import Foundation
import UIKit

public class BVSV: UIScrollView {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public required init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.showsVerticalScrollIndicator = true
        self.isDirectionalLockEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor),
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func addView(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
}

extension UIView {
    func fillParent() {
        guard let parent = superview else {
            fatalError("The view has no superview.")
        }
        self.translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
    }
}
