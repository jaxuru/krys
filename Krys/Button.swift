//
//  Button.swift
//  Krys
//
//  Created by Jax Reiff on 5/22/16.
//  Copyright © 2016 Jax Reiff. All rights reserved.
//

import SpriteKit

class Button: SKNode {
    var defaultButton: SKSpriteNode
    var activeButton: SKSpriteNode
    var action: () -> Void
    
    init(defaultButtonImage: String, activeButtonImage: String, buttonAction: () -> Void) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        activeButton = SKSpriteNode(imageNamed: activeButtonImage)
        activeButton.hidden = true
        action = buttonAction
        
        super.init()
        
        userInteractionEnabled = true
        addChild(defaultButton)
        addChild(activeButton)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

