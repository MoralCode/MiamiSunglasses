//
//  ViewController.swift
//  MiamiSunglasses
//
//  Created by Adrian Edwards on 9/25/15.
//  Copyright © 2015 Adrian Edwards. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   var bgMusic:AVAudioPlayer = AVAudioPlayer()
    var counter = 0;
    var timer = NSTimer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("CSI Miami", withExtension: "mp3")!
        
        do {
            bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil) } catch _ { return }
        bgMusic.numberOfLoops = 1
        bgMusic.prepareToPlay()
        
        

    }
    
    @IBAction func playSound(sender: AnyObject) {
        if !timer.valid {
        
        //print("HIIIIII", appendNewline: true);
        startTimer();
        bgMusic.play()
        }
        else
        {
           stopMusic()
        }
    }
    
    func update() {
        
        if (counter == 10) {
            
            stopMusic()
            
        }
        
        counter++;
      //  print(counter, appendNewline: true);
        
        
    }

    func stopMusic() {
        
        bgMusic.stop()
        bgMusic.currentTime = 0;
        counter = 0;
        timer.invalidate()
    }
    
    func startTimer() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

