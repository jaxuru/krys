//
//  GameScene.swift
//  Krys
//
//  Created by Jax Reiff on 4/26/16.
//  Copyright (c) 2016 Jax Reiff. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = SKColor.init(red: 0.2, green: 0.8, blue: 0.8, alpha: 1.0)
        
        let cir1 = SKShapeNode(circleOfRadius: 10)
        cir1.fillColor = SKColor.init(red: 0.8, green: 0.6, blue: 0.8, alpha: 1.0)
        cir1.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        cir1.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.scaleBy(2.0, duration: 2.0),
            SKAction.scaleTo(10.0, duration: 2.0)])))
        
        let cir2 = SKShapeNode(circleOfRadius: 10)
        cir2.fillColor = SKColor.init(red: 0.4, green: 0.8, blue: 0.2, alpha: 0.8)
        cir2.position = CGPoint(x:self.frame.midX, y:self.frame.maxY)
        cir2.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.scaleBy(2.0, duration: 2.0),
            SKAction.scaleTo(5.0, duration: 2.0)])))
        
        let cir3 = SKShapeNode(circleOfRadius: 10)
        cir3.fillColor = SKColor.init(red: 0.8, green: 0.0, blue: 0.3, alpha: 0.7)
        cir3.position = CGPoint(x:self.frame.midX, y:self.frame.minY)
        cir3.runAction(SKAction.repeatActionForever(SKAction.sequence([
            SKAction.scaleBy(2.0, duration: 2.0),
            SKAction.scaleTo(5.0, duration: 2.0)])))
        
        self.addChild(cir1)
        self.addChild(cir2)
        self.addChild(cir3)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"whorl")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
