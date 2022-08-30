//
//  Character.swift
//  TechMon
//
//  Created by 藤井陽介 on 2017/09/14.
//  Copyright © 2017年 nagata. All rights reserved.
//

import UIKit

class Character {
    
    // キャラクターの固有値
    var name: String = ""
    var image: UIImage!
    var attackPoint: Int = 30
    
    // 現在のステータス
    var currentHP: Int = 100
    var currentTP: Int = 0
    var currentMP: Int = 0
    
    // 最大値
    var maxHP: Int = 100
    var maxTP: Int = 20
    var maxMP: Int = 20
    
    // initで全て使えるように設定する
    init(name: String, imageName: String, attackPoint: Int, maxHP: Int, maxTP: Int, maxMP: Int) {
        
        self.name = name
        self.image = UIImage(named: imageName)
        self.attackPoint = attackPoint
        self.maxHP = maxHP
        self.currentHP = maxHP
        self.maxTP = maxTP
        self.maxMP = maxMP
    }
    
    // ステータスを元に戻す
    func resetStatus() {
        
        currentHP = maxHP
        currentTP = 0
        currentMP = 0
    }
}
