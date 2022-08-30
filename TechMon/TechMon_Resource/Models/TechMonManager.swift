//
//  TechMonManager.swift
//  TechMon
//
//  Created by 藤井陽介 on 2017/09/14.
//  Copyright © 2017年 nagata. All rights reserved.
//

import UIKit
import AVFoundation

class TechMonManager {
    
    static let shared = TechMonManager()
    
    var bgmAudioPlayer: AVAudioPlayer?
    var seAudioPlayer: AVAudioPlayer?
    var player: Character!
    var enemy: Character!
    
    init() {
        
        // キャラクターの設定
        player = Character(name: "勇者", imageName: "yusya.png", attackPoint: 30, maxHP: 100, maxTP: 100, maxMP: 20)
        enemy = Character(name: "ドラゴン", imageName: "monster.png", attackPoint: 20, maxHP: 400, maxTP: 0, maxMP: 35)
    }
    
    // キャラクターたちのステータスをリセットする
    func resetStatus() {
        
        player.resetStatus()
        enemy.resetStatus()
    }
    
    // アニメーション
    func damageAnimation(imageView: UIImageView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        // 一回移動するのにかかる時間
        animation.duration = 0.02
        // 何回移動するか
        animation.repeatCount = 4
        // 一回移動したら自動で戻るようにする（これで揺れたように見える）
        animation.autoreverses = true
        // どこからどこまで移動するか
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.center.x - 5, y: imageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageView.center.x + 5, y: imageView.center.y))
        // アニメーションを適用する
        imageView.layer.add(animation, forKey: "position")
    }
    
    func vanishAnimation(imageView: UIImageView) {
        
        UIView.animate(
            withDuration: 1,        // アニメーションの時間
            delay: 0,               // アニメーションがはじまるまでの時間
            options: .curveEaseIn,  // 徐々に加速するようなアニメーションにする
            animations: {           // 最終的にどうなって欲しいか？
                imageView.alpha = 0
        })
    }
    
    // サウンドエフェクト
    func playSE(fileName: String) {
        
        // サウンドの初期化
        guard let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            
            assert(false, "ファイル名が間違っているので、読み込めません")
        }
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            
            seAudioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            seAudioPlayer?.prepareToPlay()
            seAudioPlayer?.play()
        } catch let error {
            
            assert(false, "サウンドの設定中にエラーが発生しました (\(error.localizedDescription))")
        }
    }
    
    func playBGM(fileName: String) {
        
        // サウンドの初期化
        guard let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            
            assert(false, "ファイル名が間違っているので、読み込めません")
        }
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        do {
            
            bgmAudioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            bgmAudioPlayer?.numberOfLoops = -1
            bgmAudioPlayer?.prepareToPlay()
            bgmAudioPlayer?.play()
        } catch let error {
            
            assert(false, "サウンドの設定中にエラーが発生しました (\(error.localizedDescription))")
        }
    }
    
    func stopBGM() {
        
        // BGMが流れたままなら止められるように
        bgmAudioPlayer?.stop()
    }
}
