//
//  ViewController.swift
//  Xylophone
//
//  Created by Kittisak Panluea on 21/6/2565 BE.
//

import UIKit

//Audio Visual Foundational Module
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
//        Optional = ตัวแปรที่เอาไว้เก็บตัวแปรที่เป็นค่า nil หรือค่าอื่นก็ได้
//        Swift จะเกิด Error ทันทีถ้ามีการใช้ค่า nil เกิดขึ้นโดยที่เราไม่ห่อมันด้วย Optional ดังนั้น
//        พอเราห่อมันด้วย Optional เราจะยังไม่สามารถเอาค่าไปใช้ได้ เลยต้องทำการแกะห่อออกมาก่อน ปกติจะมี 4 วิธี
        
//        วิธีที่ 1 ใช้ ! บังคับแกะเลย โค้ดจะสั้นมากแต่ก็เสี่ยงมากเหมือนกัน จะใช้อันนี้ต้องมั่นใจแบบล้าน % ว่าค่าในตัวแปรไม่เป็น nil แน่ ๆ
       /*
         let title = sender.currentTitle!
        */
        
//        วิธีที่ 2 เช็คค่า nil ก่อน
        /*
        var title:String = ""
        if sender.currentTitle != nil {
            title = sender.currentTitle
        } else {
            print("Error title is nil")
        }*/
        
//        วิธีที่ 3 ใช้ if let
        /*
            if let title = sender.currentTitlte {
                playSound(title)
            } else {
                print("Error title is nil")
            }
         */
//        วิธีที่ 4 ใช้ guard let
        guard let title = sender.currentTitle else { return print("Error title is nil")}
        playSound(title)
    }
    
    func playSound(_ soundName:String){
        let path = Bundle.main.path(forResource: soundName , ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

