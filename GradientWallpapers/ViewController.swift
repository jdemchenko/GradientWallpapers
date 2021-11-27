//
//  ViewController.swift
//  GradientWallpapers
//
//  Created by macbook on 11/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wallpaperView: UIView!
    
    @IBOutlet weak var redSliderFirst: UISlider!
    @IBOutlet weak var greedSliderFirst: UISlider!
    @IBOutlet weak var blueSliderFirst: UISlider!
    
    @IBOutlet weak var redSliderSecond: UISlider!
    @IBOutlet weak var greenSliderSecond: UISlider!
    @IBOutlet weak var blueSliderSecond: UISlider!
    
    
    var redFirst: CGFloat!
    var greenFirst: CGFloat!
    var blueFirst: CGFloat!
    
    var redSecond: CGFloat!
    var greenSecond: CGFloat!
    var blueSecond: CGFloat!
    
    var gl:CAGradientLayer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSlider()
        changeColorOfView()
    }
    
    @IBAction func SlidersSlide() {
        changeColorOfView()
    }
    
    @IBAction func screenshotBtnPressed() {
        //Create the UIImage
        
        UIGraphicsBeginImageContextWithOptions(wallpaperView.frame.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        wallpaperView.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      
    }
    
   private func setSlider() {
        redSliderFirst.tintColor = .red
        greedSliderFirst.tintColor = .green
        blueSliderFirst.tintColor = .blue
        
        redSliderSecond.tintColor = .red
        greenSliderSecond.tintColor = .green
        blueSliderSecond.tintColor = .blue
    }

    private func changeColorOfView() {
        redFirst = CGFloat(redSliderFirst.value)
        greenFirst = CGFloat(greedSliderFirst.value)
        blueFirst = CGFloat(blueSliderFirst.value)
        
        redSecond = CGFloat(redSliderSecond.value)
        greenSecond = CGFloat(greenSliderSecond.value)
        blueSecond = CGFloat(blueSliderSecond.value)
        
        
        let colorTop = UIColor(red: redFirst, green: greenFirst, blue: blueFirst, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: redSecond, green: greenSecond, blue: blueSecond, alpha: 1.0).cgColor
        self.gl = CAGradientLayer()
        self.gl.frame.size = self.wallpaperView.frame.size
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
        
        wallpaperView.layer.addSublayer(gl)
    }
    

}


