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
    var soundIsPlaying:Bool = false
    var audioURL:URL = Bundle.main.url(forResource: "CSI Miami", withExtension: "mp3")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if !FileManager.default.fileExists(atPath: audioURL.path) {
            print("CSI Miami.mp3 file not found")
        }

        
        do {
            yeah = try AVAudioPlayer(contentsOf: audioURL, fileTypeHint: nil)
            yeah.delegate = self; //allows audioPlayerDidFinishPlaying to be called
        } catch _ { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch _ { return }
        
        yeah.numberOfLoops = 0
        //yeah.volume = 1.0 //interesting... maybe i could add a volume slider later...
        yeah.prepareToPlay()

        
        
    }
    
    @IBAction func playSound(_ sender: AnyObject) {
        
        if !soundIsPlaying {
            soundIsPlaying = true
            
            yeah.play()
            
        }
        else
        {
            yeah.stop()
            yeah.currentTime = 0;
            
            soundIsPlaying = false
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        soundIsPlaying = false
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
