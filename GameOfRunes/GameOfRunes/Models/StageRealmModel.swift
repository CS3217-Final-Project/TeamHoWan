//
//  StageRealmModel.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class StageRealmModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var chapter: String = ""
    @objc dynamic var category: Stage.Category = .normal
    @objc dynamic var xRatio: Double = .zero
    @objc dynamic var yRatio: Double = .zero
    @objc dynamic var arena: ArenaType = .arena1
    @objc dynamic var difficulty: Int = .zero
    @objc dynamic var numWaves: Int = .zero
    @objc dynamic var achievement: Stage.AchievementLevel = .empty
    @objc dynamic var highScore: Int = .zero
    var enemyWaves: List<EnemyWaveRealmModel> = .init()
    
    override static func primaryKey() -> String? {
        "name"
    }
    
    init(stage: Stage) {
        super.init()
        name = stage.name
        chapter = stage.chapter
        category = stage.category
        xRatio = .init(stage.relativePositionRatioInMap.x)
        yRatio = .init(stage.relativePositionRatioInMap.y)
        arena = stage.arena
        difficulty = stage.difficulty
        numWaves = stage.numWaves
        achievement = stage.achievement
        highScore = stage.highScore
        stage.enemyWaves.forEach { enemyWave in enemyWaves.append(EnemyWaveRealmModel(enemyWave: enemyWave)) }
    }
    
    required init() {
        super.init()
    }
}
