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
        bg.position = CGPoint(x: 400, y: 300)
        self.addChild(bg) 
        
        //Add a hat for WALL-E
        let hat = SKSpriteNode(imageNamed: "hat")
        hat.position = CGPoint(x: 570, y: 390)
        self.addChild(hat)
        
        //Add a falling gift box
        
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
