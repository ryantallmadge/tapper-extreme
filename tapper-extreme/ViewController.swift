//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Ryan Tallmadge on 12/4/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var maxTaps     : Int = 0;
    var currentTaps : Int = 0;
    
    
    //Outlets
    @IBOutlet weak var logoImgVIew      : UIImageView!
    @IBOutlet weak var howManyTapsTxt   : UITextField!
    @IBOutlet weak var playBtn          : UIButton!
    @IBOutlet weak var tapBtn           : UIButton!
    @IBOutlet weak var tapsLabel        : UILabel!
    
    
    func toggleViews(showHide: Bool){
        logoImgVIew.hidden      = showHide ? true   : false;
        playBtn.hidden          = showHide ? true   : false;
        howManyTapsTxt.hidden   = showHide ? true   : false;
        tapBtn.hidden           = showHide ? false  : true;
        tapsLabel.hidden        = showHide ? false  : true;
        
    }
    
    func updateTapsLabel(taps : Int){
        tapsLabel.text = "\(taps) Taps";
    }
    
    func isGameOver(taps : Int) -> Bool{
        if(taps >= maxTaps){
            return true;
        }else{
            return false;
        }
    }
    
    func restartGame(){
        maxTaps     = 0;
        currentTaps = 0;
        toggleViews(false);
    }
    
    @IBAction func onCoinTap(sender: AnyObject){
        currentTaps++;
        if(isGameOver(currentTaps)){
            restartGame();
        }else{
            updateTapsLabel(currentTaps);
        }
    }
    
    
    @IBAction func onPlayButtonPressed(sender: UIButton!){
        
        if(howManyTapsTxt.text != nil && howManyTapsTxt.text != ""){
            maxTaps     = Int(howManyTapsTxt.text!)!;
            currentTaps = 0;
            toggleViews(true);
            updateTapsLabel(currentTaps);
        }
        
    }
    
    
}

