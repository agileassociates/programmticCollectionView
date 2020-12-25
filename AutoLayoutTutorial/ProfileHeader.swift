//
//  ProfileHeader.swift
//  AutoLayoutTutorial
//
//  Created by Johny Babylon on 12/18/20.
//  Copyright © 2020 Agile Associates. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "larry_ellison_sailing")                          // type in "image literal, then double-click on box"
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Screen Shot 2020-12-18 at 4.53.57 AM").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "add_follow_guy").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .mainBlue
        
        addSubview(profileImageView)  // must declare view as lazy var - see above
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.anchor(top: topAnchor, paddingTop: 88,  width: 120, height: 120)
        profileImageView.layer.cornerRadius = 120 / 2    // makes it circle
        
        addSubview(messageButton)
        messageButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 32, width: 32, height: 32)
        addSubview(followButton)
        followButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 44, paddingRight: 32, width: 32, height: 32)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
