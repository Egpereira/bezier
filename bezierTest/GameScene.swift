//
//  GameScene.swift
//  bezierTest
//
//  Created by Eduardo Pereira on 8/17/15.
//  Copyright (c) 2015 Eduardo Pereira. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let gameLayer = SKNode()
    
    let soldier = SKSpriteNode(imageNamed: "blueSoldier1")
    let startPoint = SKSpriteNode(imageNamed: "pieceArea")
    let endPoint = SKSpriteNode(imageNamed: "pieceArea")
    let bg = SKSpriteNode(imageNamed: "homeScreenBG")
    let path = SKSpriteNode(imageNamed: "curve")
    let path2 = SKSpriteNode(imageNamed: "curve")
    //let curve = UIBezierPath()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        //addChild(gameLayer)
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
//        var curve = UIBezierPath()
//        curve.moveToPoint(CGPointMake(0, -0))
//        curve.addCurveToPoint(CGPointMake(0, endPoint.position.y + soldier.size.height/2), controlPoint1: CGPointMake(-534, -0), controlPoint2: CGPointMake(-534, endPoint.position.y + soldier.size.height/2))
//        
//        var followLine = SKAction.followPath(curve.CGPath, asOffset: true, orientToPath: false, duration: 2.0)
        
        var curve = UIBezierPath()
        curve.moveToPoint(CGPointMake(startPoint.position.x, startPoint.position.y))
        curve.addCurveToPoint(CGPointMake(endPoint.position.x, endPoint.position.y),
            controlPoint1: CGPointMake(0, startPoint.position.y),
            controlPoint2: CGPointMake(0, endPoint.position.y))
        
       var followLine = SKAction.followPath(curve.CGPath, asOffset: false, orientToPath: false, duration: 2.0)
        
//        var followLine = SKAction.followPath(curve.CGPath, asOffset: false, orientToPath: false, speed: 400.0)
        
        
        var curve2 = UIBezierPath()
        curve2.moveToPoint(CGPointMake(endPoint.position.x, endPoint.position.y))
        curve2.addCurveToPoint(CGPointMake(startPoint.position.x, startPoint.position.y),
            controlPoint1: CGPointMake(1022, endPoint.position.y),
            controlPoint2: CGPointMake(1022, startPoint.position.y))
        
        
        var followLine2 = SKAction.followPath(curve2.CGPath, asOffset: false, orientToPath: false, duration: 1.6)
        
        var sequence = SKAction.sequence([followLine, SKAction.waitForDuration(1), followLine2])
        
        soldier.runAction(sequence)
        
        
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override init(size: CGSize){
        super.init(size: size)
        
        addChild(gameLayer)
        
        
        anchorPoint = CGPoint(x: 0.0, y: 1.0)
        
        bg.position = CGPointMake(0, 1)
        bg.anchorPoint = CGPointMake(0, 1)
        bg.zPosition = 0
        addChild(bg)
        
        soldier.position = CGPointMake(452 + soldier.size.width/2, 0 - soldier.size.height/2)
        soldier.zPosition = 3
        gameLayer.addChild(soldier)
        
        startPoint.position = CGPointMake(452 + startPoint.size.width/2, 0 - startPoint.size.height/2)
        startPoint.zPosition = 2
        gameLayer.addChild(startPoint)
        
        endPoint.position = CGPointMake(452 + endPoint.size.width/2, -647 - endPoint.size.height/2)
        endPoint.zPosition = 2
        gameLayer.addChild(endPoint)
        
        path.position = CGPointMake(111 + path.size.width/2, -61 - path.size.height/2)
        path.zPosition = 1
        gameLayer.addChild(path)
        
        path2.position = CGPointMake(513 + path2.size.width/2, -61 - path2.size.height/2)
        path2.zPosition = 1
        path2.xScale = -1
        gameLayer.addChild(path2)
    
    }
}
