//
//  ManaType.swift
//  GameOfRunes
//
//  Created by Jermy on 20/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

enum ManaType: String, CaseIterable {
    case common
    case rare
    case ultraRare

    static func getManaType(manaPoints: Int) -> ManaType {
        let max = GameConfig.Mana.manaMaxValue
        let min = GameConfig.Mana.manaMinValue

        let percentile = Double((manaPoints - min)) / Double((max - min)) * 100

        switch percentile {
        case GameConfig.Mana.manaUltraRareThreshold...:
            return .ultraRare
        case GameConfig.Mana.manaRareThreshold...:
            return .rare
        default:
            return .common
        }
    }
}
