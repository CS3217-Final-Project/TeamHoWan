//
//  StageRealmModel.swift
//  GameOfRunes
//
//  Created by Jermy on 31/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import RealmSwift

class StageRealmModel: Object {
    @objc private(set) dynamic var name: String = ""
    @objc private(set) dynamic var chapter: String = ""
    @objc private(set) dynamic var category: Stage.Category = .normal
    @objc private dynamic var xRatio: Double = .zero
    @objc private dynamic var yRatio: Double = .zero
    @objc private(set) dynamic var arena: ArenaType = .arena1
    @objc private(set) dynamic var difficulty: Int = .zero
    @objc private(set) dynamic var numWaves: Int = .zero
    @objc private(set) dynamic var achievementBMinScore: Int = .zero
    @objc private(set) dynamic var achievementAMinScore: Int = .zero
    @objc private(set) dynamic var achievementSMinScore: Int = .zero
    @objc private(set) dynamic var achievement: Stage.AchievementLevel = .empty
    @objc private(set) dynamic var highScore: Int = .zero
    @objc private(set) dynamic var enemyWaveSpawnInterval: TimeInterval = 1.0
    private let _enemyWaves: List<EnemyWaveRealmModel> = .init()
    
    override static func primaryKey() -> String? {
        "name"
    }
    
    var stage: Stage {
        .init(
            name: name,
            chapter: chapter,
            category: category,
            relativePositionRatioInMap: relativePositionRatioInMap,
            arena: arena,
            difficulty: difficulty,
            numWaves: numWaves,
            enemyWaves: enemyWaves,
            enemyWaveSpawnInterval: enemyWaveSpawnInterval,
            achievementBMinScore: achievementBMinScore,
            achievementAMinScore: achievementAMinScore,
            achievementSMinScore: achievementSMinScore,
            achievement: achievement,
            highScore: highScore
        )
    }
    
    var relativePositionRatioInMap: (x: CGFloat, y: CGFloat) {
        (x: .init(xRatio), y: .init(yRatio))
    }
    
    var enemyWaves: EnemySpawnUnit {
        .init(_enemyWaves.map { enemyWaveRealmModel in enemyWaveRealmModel.enemyWave })
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
        achievementBMinScore = stage.achievementBMinScore
        achievementAMinScore = stage.achievementAMinScore
        achievementSMinScore = stage.achievementSMinScore
        highScore = stage.highScore
        enemyWaveSpawnInterval = stage.enemyWaveSpawnInterval
        stage.enemyWaves.unit.forEach { enemyWave in _enemyWaves.append(EnemyWaveRealmModel(enemyWave: enemyWave)) }
    }
    
    required init() {
        super.init()
    }
    
    func cascadeDelete(realm: Realm) {
        _enemyWaves.forEach { enemyWaveRealmModel in enemyWaveRealmModel.cascadeDelete(realm: realm) }
        realm.delete(_enemyWaves)
    }
}
