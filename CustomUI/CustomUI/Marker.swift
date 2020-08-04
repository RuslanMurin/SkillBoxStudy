//
//  Marker.swift
//  CustomUI
//
//  Created by Ruslan Murin on 15.07.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit

class Marker: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor

    }
    
}
