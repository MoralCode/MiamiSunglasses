//
//  ViewController.swift
//  MiamiSunglasses
//
//  Created by Adrian Edwards on 9/25/15.
//  Copyright © 2015 Adrian Edwards. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    var yeah:AVAudioPlayer = AVAudioPlayer()
    var soundIsPlaying:Bool = false;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load resource
        let audioURL:
            NSURL = NSBundle.mainBundle().URLForResource("CSI Miami", withExtension: "mp3")!
        
        do {
            yeah = try AVAudioPlayer(contentsOfURL: audioURL, fileTypeHint: nil)
            yeah.delegate = self; //allows audioPlayerDidFinishPlaying to be called
        } catch _ { return }
        
        yeah.numberOfLoops = 1
        //yeah.volume = 1.0 //interesting... maybe i could add a volume slider later...
        yeah.prepareToPlay()
        
        
        
    }
    
    @IBAction func playSound(sender: AnyObject) {
        print(soundIsPlaying)
        
        if !soundIsPlaying {
            
            
            yeah.play()
            soundIsPlaying = true
        }
        else
        {
            yeah.stop()
            yeah.currentTime = 0;
            
            soundIsPlaying = false
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
        soundIsPlaying = false
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

