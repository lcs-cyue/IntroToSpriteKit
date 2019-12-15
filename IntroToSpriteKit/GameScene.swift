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
        
        //Make an edge loop at the boundaries of the scene
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        //wait
        let actionShortWait = SKAction.wait(forDuration: 0.5)
        let actionOneSecondWait = SKAction.wait(forDuration: 1)
        let actionThreeSecondWait = SKAction.wait(forDuration: 3)
        
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
        let sequenceMoveRightShortDelay = SKAction.sequence([actionShortWait,
                                                  actionRightwardMovement])

        // Define a sequence that makes a node wait for 10 seconds, then move up
        let sequenceMoveUpShortDelay = SKAction.sequence([actionOneSecondWait,
                                                          actionUpwardsMovement])
   
        
        //Add the 1st gift box
        let gift1 = SKSpriteNode(imageNamed: "gift1")
        gift1.position = CGPoint(x: 70, y: self.size.height)
        
        
        //Add the 2nd gift box
        let gift2 = SKSpriteNode(imageNamed: "gift2")
        gift2.position = CGPoint(x: 400, y: self.size.height)
       
        
        //Add the 3rd gift box
        let gift3 = SKSpriteNode(imageNamed: "gift3")
        gift3.position = CGPoint(x: 500, y: self.size.height)
       
        
        //Add the 4th gift box
        let gift4 = SKSpriteNode(imageNamed: "gift4")
        gift4.position = CGPoint(x: 350, y: self.size.height)
       
        
        //Add the 5th gift box
        let gift5 = SKSpriteNode(imageNamed: "gift5")
        gift5.position = CGPoint(x: 200, y: self.size.height)
        
        
        //Add the 6th gift box
        let gift6 = SKSpriteNode(imageNamed: "gift6")
        gift6.position = CGPoint(x: 500, y: self.size.height)
        
        
        //Add the 7th gift box
        let gift7 = SKSpriteNode(imageNamed: "gift7")
        gift7.position = CGPoint(x: 20, y: self.size.height)
        
        
        //Add the 8th gift box
        let gift8 = SKSpriteNode(imageNamed: "gift8")
        gift8.position = CGPoint(x: 550, y: self.size.height)
        
        
        //Add gravity
        gift1.physicsBody = SKPhysicsBody(circleOfRadius: gift1.size.width * 0.4)
        gift2.physicsBody = SKPhysicsBody(circleOfRadius: gift2.size.width * 0.9)
        gift3.physicsBody = SKPhysicsBody(circleOfRadius: gift3.size.width * 0.3)
        gift4.physicsBody = SKPhysicsBody(circleOfRadius: gift4.size.width * 0.2)
        gift5.physicsBody = SKPhysicsBody(circleOfRadius: gift5.size.width * 0.4)
        gift6.physicsBody = SKPhysicsBody(circleOfRadius: gift6.size.width * 0.3)
        gift7.physicsBody = SKPhysicsBody(circleOfRadius: gift7.size.width * 0.4)
        gift8.physicsBody = SKPhysicsBody(circleOfRadius: gift8.size.width * 0.5)
        
        
        // Run the sequence on the gifts
        func addGifts () {
            
        self.addChild(gift1)
        self.addChild(gift2)
        self.addChild(gift3)
        self.addChild(gift4)
        self.addChild(gift5)
        self.addChild(gift6)
        self.addChild(gift7)
        self.addChild(gift8)
            
        }
        
        let actionAddGifts = SKAction.run(addGifts)
        
        let actionWait = SKAction.wait(forDuration: 2)
        let sequenceAddGiftsThenWait = SKAction.sequence([actionAddGifts, actionWait])
        let actionRepeatlyAddGifts = SKAction.repeat(sequenceAddGiftsThenWait, count: 100)
        self.run(actionRepeatlyAddGifts)
        
        //Move the gifts
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
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
