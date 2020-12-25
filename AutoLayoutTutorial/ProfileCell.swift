//
//  ProfileCell.swift
//  AutoLayoutTutorial
//
//  Created by Johny Babylon on 12/25/20.
//  Copyright © 2020 Agile Associates. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var image: UIImage? {
        didSet{
            guard let image = image else {return}
            imageView.image = image 
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "larry_ellison_sailing")                          // type in "image literal, then double-click on box"
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
