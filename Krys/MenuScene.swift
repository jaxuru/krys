//
//  MenuScene.swift
//  Krys
//
//  Created by Jax Reiff on 5/22/16.
//  Copyright © 2016 Jax Reiff. All rights reserved.
//

import SpriteKit
import AVFoundation

class MenuScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.init(red: 0.2, green: 0.8, blue: 0.8, alpha: 1.0)
        
        let button = SKShapeNode()
        
        let triangle = CGPathCreateMutable()
        CGPathMoveToPoint(triangle, nil, -view.frame.size.width/4, -view.frame.size.height/8)
        CGPathAddLineToPoint(triangle, nil, view.frame.size.width/4, -view.frame.size.height/8)
        CGPathAddLineToPoint(triangle, nil, 0, view.frame.size.height/4)
        CGPathAddLineToPoint(triangle, nil, -view.frame.size.width/4, -view.frame.size.height/8)
        
        button.name = "start"
        button.path = triangle
        button.fillColor = SKColor.blackColor()
        button.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        button.physicsBody = SKPhysicsBody(polygonFromPath: triangle)
        button.physicsBody?.dynamic = false
        
        self.addChild(button)
        
//        SKTAudio.sharedInstance().playBackgroundMusic("test2.mp3")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let location = touches.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        // If next button is touched, start transition to second scene
        if (node.name == "start") {
            let nextscene = GameScene(size: self.size)
            let transition = SKTransition.pushWithDirection(SKTransitionDirection.Up, duration: 2.0)
            nextscene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(nextscene, transition: transition)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
