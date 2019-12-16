//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    
    // Background music player
    var backgroundMusic: AVAudioPlayer?
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        
        //Add the background
        let bg = SKSpriteNode(imageNamed: "background2")
        bg.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(bg) 
        
        //Add a hat for WALL-E
        let hat = SKSpriteNode(imageNamed: "hat")
        hat.position = CGPoint(x: 570, y: 390)
        self.addChild(hat)
        
        
        // Create a sentence
        let title = SKLabelNode(fontNamed: "Helvetica Neue bold")
        title.fontSize = 30
        title.fontColor = .white
        title.zPosition = 10        // Make sure text appears in front of other nodes
        title.text = "I wish someone brought Christmas presents for me..."
        title.position = CGPoint(x: self.size.width / 2, y: self.size.height - 70)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.addChild(title)
        }
        
        
        
        
        let question = SKLabelNode(fontNamed: "Helvetica Neue bold")
        question.fontSize = 20
        question.fontColor = .white
        question.zPosition = 0        // Make sure text appears behind the gift
        question.text = "Huh??"
        question.position = CGPoint(x: 450, y: self.size.height / 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.addChild(question)
        }
        
        
        //Make an edge loop at the boundaries of the scene
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        //wait
        let actionShortWait = SKAction.wait(forDuration: 0.5)
        let actionOneSecondWait = SKAction.wait(forDuration: 1)
        let actionTwoSecondWait = SKAction.wait(forDuration: 3)
        
        // Define a vector that describes a leftward movement
        let leftThisMuch = CGVector(dx: -300, dy: 50)
        
        // Define a vector that describes a rightward movement
        let rightThisMuch = CGVector(dx: 300, dy: 50)
        
        // Define a vector that describes an upward movement
        let upThisMuch = CGVector(dx: 0, dy: 1000)
        
        // Define a movements
        let actionLeftwardMovement = SKAction.move(by: leftThisMuch, duration: 2)
        let actionRightwardMovement = SKAction.move(by: rightThisMuch, duration: 3)
        let actionUpwardsMovement = SKAction.move(by: upThisMuch, duration: 3)
        
        // Define a sequence that makes a node wait five seconds, then move left
        let sequenceMoveLeftShortDelay = SKAction.sequence([actionShortWait,
                                                            actionLeftwardMovement])
        
        // Define a sequence that makes a node wait 15 seconds, then move right
        let sequenceMoveRightShortDelay = SKAction.sequence([actionTwoSecondWait,
                                                             actionRightwardMovement])
        
        // Define a sequence that makes a node wait for 10 seconds, then move up
        let sequenceMoveUpShortDelay = SKAction.sequence([actionOneSecondWait,
                                                          actionUpwardsMovement])
        
        
        //Add the 1st gift box
        let gift1 = SKSpriteNode(imageNamed: "gift1")
        gift1.position = CGPoint(x: 100, y: self.size.height)
        
        //Add the 2nd gift box
        let gift2 = SKSpriteNode(imageNamed: "gift2")
        gift2.position = CGPoint(x: 450, y: self.size.height)
        
        
        //Add the 3rd gift box
        let gift3 = SKSpriteNode(imageNamed: "gift3")
        gift3.position = CGPoint(x: 800, y: self.size.height)
        
        
        //Add the 4th gift box
        let gift4 = SKSpriteNode(imageNamed: "gift4")
        gift4.position = CGPoint(x: 550, y: self.size.height)
        
        
        //Add the 5th gift box
        let gift5 = SKSpriteNode(imageNamed: "gift5")
        gift5.position = CGPoint(x: 700, y: self.size.height)
        
        
        //Add the 6th gift box
        let gift6 = SKSpriteNode(imageNamed: "gift6")
        gift6.position = CGPoint(x: 500, y: self.size.height)
        
        
        //Add the 7th gift box
        let gift7 = SKSpriteNode(imageNamed: "gift7")
        gift7.position = CGPoint(x: 20, y: self.size.height)
        
        
        //Add the 8th gift box
        let gift8 = SKSpriteNode(imageNamed: "gift8")
        gift8.position = CGPoint(x: 550, y: self.size.height)
        
        
        
        
        // Run the sequence on the gifts with delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.addChild(gift1)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
            self.addChild(gift2)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.9) {
            self.addChild(gift3)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            self.addChild(gift4)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.addChild(gift5)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.7) {
            self.addChild(gift6)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            self.addChild(gift7)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.2) {
            self.addChild(gift8)
        }
        
        //Add gravity
        gift1.physicsBody = SKPhysicsBody(circleOfRadius: gift1.size.width * 0.4)
        gift2.physicsBody = SKPhysicsBody(circleOfRadius: gift2.size.width * 0.2)
        gift3.physicsBody = SKPhysicsBody(circleOfRadius: gift3.size.width * 0.3)
        gift4.physicsBody = SKPhysicsBody(circleOfRadius: gift4.size.width * 0.2)
        gift5.physicsBody = SKPhysicsBody(circleOfRadius: gift5.size.width * 0.4)
        gift6.physicsBody = SKPhysicsBody(circleOfRadius: gift6.size.width * 0.3)
        gift7.physicsBody = SKPhysicsBody(circleOfRadius: gift7.size.width * 0.4)
        gift8.physicsBody = SKPhysicsBody(circleOfRadius: gift8.size.width * 0.5)
        
        //movement
        gift1.run(sequenceMoveLeftShortDelay)
        gift2.run(sequenceMoveUpShortDelay)
        gift3.run(sequenceMoveRightShortDelay)
        gift4.run(sequenceMoveUpShortDelay)
        gift5.run(sequenceMoveRightShortDelay)
        gift6.run(sequenceMoveLeftShortDelay)
        gift7.run(sequenceMoveUpShortDelay)
        gift8.run(sequenceMoveRightShortDelay)
        
        
        
        //Add snow
        if let snow = SKEmitterNode(fileNamed: "snow.sks") {
            snow.position = CGPoint(x: 400, y: 600)
            self.addChild(snow)
        }
        
        //Add fireflies
        if let fireflies = SKEmitterNode(fileNamed: "fireflies.sks") {
            fireflies.position = CGPoint(x: 400, y: -250)
            self.addChild(fireflies)
        }
        
        //Add fire
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.0) {
        if let fire = SKEmitterNode(fileNamed: "Fire.sks") {
            fire.position = CGPoint(x: self.size.width / 2 + 170, y: self.size.height / 2)
            fire.zPosition = 12
        self.addChild(fire)
        }
        }
        
        //Add exit words
        let exw = SKLabelNode(fontNamed: "SignPainter")
        exw.fontSize = 60
        exw.fontColor = .black
        exw.zPosition = 13
        exw.text = "Brought to you by - Chelsea"
        exw.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.3) {
            self.addChild(exw)
        }
        
        //Add exit words2
        let exw2 = SKLabelNode(fontNamed: "SignPainter")
        exw2.fontSize = 50
        exw2.fontColor = .black
        exw2.zPosition = 13
        exw2.text = "A member of the AP computer science class"
        exw2.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 - 100)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 11.3) {
            self.addChild(exw2)
        }
        
        //Add penguin
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            let penguin = SKSpriteNode(imageNamed: "penguin")
            penguin.position = CGPoint(x: penguin.size.width / 2, y: 500)
            penguin.physicsBody = SKPhysicsBody(texture: penguin.texture!,alphaThreshold: 0.5,size: penguin.size)
            self.addChild(penguin)
            
            
            // Animation using the penguin sprites array
            var walkingTextures: [SKTexture] = []
            walkingTextures.append(SKTexture(imageNamed: "PR"))
            walkingTextures.append(SKTexture(imageNamed: "PL"))
            
            // Create an action to animate a walking motion  (walkingTextures)
            let actionWalkingAnimation = SKAction.animate(with: walkingTextures, timePerFrame: 0.2, resize: true, restore: true)
            
            // Create an action that moves the penguin forward a "step" where a step is 10 pixels
            // NOTE: The time interval for moving forward matches the time per frame of the animation
            let actionMoveForward = SKAction.moveBy(x: 10, y: 0, duration: 0.2)
            
            // Repeat the move forward action twice
            let actionMoveForwardTwice = SKAction.repeat(actionMoveForward, count: 2)
            
            // Now, combine the walking animation with the sprite moving forward
            let actionWalkAndMove = SKAction.group([actionWalkingAnimation, actionMoveForwardTwice])
            
            // Repeat the "walk and move" action five times
            let actionWalkAndMoveFortyTimes = SKAction.repeat(actionWalkAndMove, count: 40)
            
            // Make the penguin walk and move forward five times
            penguin.run(actionWalkAndMoveFortyTimes)
            
        }
        
        //Add penguin's response
        
        let response = SKLabelNode(fontNamed: "Helvetica Neue bold")
        response.fontSize = 20
        response.fontColor = .yellow
        response.zPosition = 10
        response.text = "I brought you some!  (´･◡･`)"
        response.position = CGPoint(x: self.size.width / 2 - 100, y: 150)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
            self.addChild(response)
        }
        
        //Add penguin's response2
        
        let response2 = SKLabelNode(fontNamed: "SignPainter")
        response2.fontSize = 80
        response2.fontColor = .black
        response2.zPosition = 11        // Make sure text appears in front of other nodes
        response2.text = "MERRY CHRISTMAS!!"
        response2.position = CGPoint(x: self.size.width / 2 - 100, y: self.size.height / 2 - 100)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.addChild(response2)
        }
        
        //Add penguin's response3
        
        let response3 = SKLabelNode(fontNamed: "SignPainter")
        response3.fontSize = 80
        response3.fontColor = .green
        response3.zPosition = 11
        response3.text = "MERRY CHRISTMAS!!"
        response3.position = CGPoint(x: self.size.width / 2 - 105, y: self.size.height / 2 - 95)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            self.addChild(response3)
        }
        
        
        
        // Get a reference to the mp3 file in the app bundle
        let backgroundMusicFilePath = Bundle.main.path(forResource: "sleigh-bells-excerpt.mp3", ofType: nil)!
        
        // Convert the file path string to a URL (Uniform Resource Locator)
        let backgroundMusicFileURL = URL(fileURLWithPath: backgroundMusicFilePath)
        
        // Attempt to open and play the file at the given URL
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: backgroundMusicFileURL)
            backgroundMusic?.play()
        } catch {
            // Do nothing if the sound file could not be played
        }
        
    }
    
    
    
}


