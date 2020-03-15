//
//  TextureContainer.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

/**
 Container for all the different `SKTexture`s used in the Game.
 This is to facilitate more efficient memory usage (the textures are only
 loaded once, and leverage the `SKTextureAtlas` for further memory
 optimisations).
 */
class TextureContainer {
    private static var enemiesTextures = [EnemyType: [SKTexture]]()
    private static var manaTextures = [SKTexture]()

    static func loadTextures() {
        // Load `enemiesTextures`
        EnemyType.allCases.forEach { enemyType in
            let enemyAtlas = SKTextureAtlas(named: enemyType.rawValue)
            let enemyTextures = (0...6).map { enemyAtlas.textureNamed("WALK_00\($0)") }
            enemiesTextures[enemyType] = enemyTextures
        }

        // Load `manaTextures`
        let manaAtlas = SKTextureAtlas(named: "manaEssence")
        manaTextures = (0...29).map { manaAtlas.textureNamed("tile\($0)") }

//        manaTextures = (0...29).map { fileNum in
//            let texture = manaAtlas.textureNamed("tile\(fileNum)")
//            let image = UIImage(cgImage: texture.cgImage())
//            if let croppedImage = TextureContainer.cropImage(image: image) {
//                let texture = SKTexture(image: croppedImage)
//                print("here")
//                return texture
//            }
//            return SKTexture()
//        }
    }

    /** Get the Animation Textures for the `enemyType` */
    static func getEnemyAnimationTextures(_ enemyType: EnemyType) -> [SKTexture] {
        Self.enemiesTextures[enemyType] ?? []
    }

    /** Get the Static Texture for the `enemyType` */
    static func getEnemyTexture(_ enemyType: EnemyType) -> SKTexture {
        Self.getEnemyAnimationTextures(enemyType).first ?? .init()
    }

    /** Get Animation Textures for Mana. */
    static func getManaAnimationTextures() -> [SKTexture] {
        manaTextures
    }

    /** Get Static Texture for Mana. */
    static func getManaTexture() -> SKTexture {
        manaTextures.first ?? .init()
    }

    static func cropImage(image: UIImage) -> UIImage? {
        guard let cgImage = image.cgImage else {
            print("1")
            return nil
        }

        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let rect = CGRect(x: imageWidth/4, y: imageHeight/4, width: imageWidth/2, height: imageHeight/2)
        if let imageRef = cgImage.cropping(to: rect) {
            print("2")
            return UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        } else {
            print("3")
            return nil
        }
    }
}
