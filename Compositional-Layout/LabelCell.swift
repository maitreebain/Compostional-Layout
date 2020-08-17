//
//  LabelCell.swift
//  Compositional-Layout
//
//  Created by Maitree Bain on 8/17/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    
    public lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    //coming from programmatic UI setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //help initialzer method
    private func commonInit() {
        textLabelContstraints()
    }
    
    private func textLabelContstraints() {
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)])
    }
    
}