//
//  PowerUpType.swift
//  GameOfRunes
//
//  Created by Jermy on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//
//
//import SpriteKit
//
//enum PowerUpType: String, CaseIterable {
//    enum ActivationType {
//        case immediate
//        case onGesture
//        case onTap
//    }
//
//    case darkVortex
//    case hellfire
//    case icePrison
//    case divineBlessing
//    case divineShield
//    case heroicCall
//
//    var description: String {
//        GameConfig.PowerUp.descriptions[self] ?? ""
//    }
//
//    var manaUnitCost: Int {
//        GameConfig.PowerUp.manaUnitCosts[self] ?? 0
//    }
//
//    // The duration in which the power up is in the arena / can affect enemies.
//    // This excludes the duration in which the effects of the power up will last. E.g. the duration of freeze
//    var duration: TimeInterval {
//        GameConfig.PowerUp.durations[self] ?? 0
//    }
//
//    var activationType: ActivationType {
//        switch self {
//        case .divineShield, .heroicCall:
//            return .immediate
//        case .hellfire, .divineBlessing, .icePrison:
//            return .onGesture
//        case .darkVortex:
//            return .onTap
//        }
//    }
//
//    func createEntity(at position: CGPoint, with size: CGSize) -> Entity? {
//        switch self {
//        case .hellfire:
//            return HellfirePowerUpEntity(at: position, with: size)
//        case .icePrison:
//            return IcePrisonPowerUpEntity(at: position, with: size)
//        case .darkVortex:
//            return DarkVortexPowerUpEntity(at: position, with: size)
//        case .divineShield:
//            return DivineShieldPowerUpEntity(at: position, with: size)
//        case .divineBlessing:
//            return DivineBlessingPowerUpEntity(at: position, with: size)
//        case .heroicCall:
//            return nil
//        }
//    }
//
//    func preparePowerUp(gameEngine: GameEngine) {
//        switch self.activationType {
//        case .immediate:
//            // although these power ups do not need position, position is set to center of screen
//            // so that that messages will appear at the center if any
//            gameEngine.activatePowerUp(at: gameEngine.gameScene?.center
//                ?? .init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY))
//        case .onTap:
//            gameEngine.gameScene?.deactivateGestureDetection()
//        case .onGesture:
//            // ensure gesture detection is activated
//            gameEngine.gameScene?.activateGestureDetection()
//        }
//    }
//
//    func activate(at position: CGPoint, with size: CGSize?, gameEngine: GameEngine) {
//        var powerUpSize = size
//
//        switch self {
//        case .darkVortex:
//            // abitrary width for dark vortex
//            let radius = (gameEngine.gameScene?.size.width ?? UIScreen.main.bounds.width) / 3
//            powerUpSize = .init(width: radius, height: radius)
//        case .divineShield:
//            let radius = (gameEngine.gameScene?.size.width ?? UIScreen.main.bounds.width) / 2
//            powerUpSize = .init(width: radius, height: radius)
//        case .heroicCall:
//            gameEngine.spawnPlayerUnitWave()
//        default:
//            break
//        }
//
//        guard let size = powerUpSize,
//            let entity = createEntity(at: position, with: size) else {
//                return
//        }
//
//        gameEngine.add(entity)
//    }
//
//    func didActivate(on enemy: Entity, gameEngine: GameEngine) {
//        guard enemy.type == .enemyEntity,
//            let enemyType = enemy.component(ofType: EnemyTypeComponent.self)?.enemyType,
//            !enemyType.isPowerUpImmune else {
//                return
//        }
//
//        switch self {
//        case .hellfire:
//            gameEngine.unitForceRemoved(enemy)
//        case .icePrison:
//                                                         // freeze duration
//            gameEngine.changeMovementSpeed(for: enemy, to: enemyType.icePrisonSpeed, duration: 5)
//        case .divineBlessing:
//            gameEngine.setGesture(for: enemy, using: .lightning)
//        default:
//            return
//        }
//    }
//
//    func getCastingAnimationNode(
//        at position: CGPoint,
//        with size: CGSize
//    ) -> SKSpriteNode {
//                                                                            // scale up the animation
//        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
//        animationNode.position = position
//
//        // Create Animations (Casting of Power-Up)
//        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: powerUpType)
//        let powerUpCastAnimation: SKAction = .animate(
//            with: powerUpCastTextures,
//            timePerFrame: 0.05,
//            resize: false,
//            restore: false
//        )
//
//        let animationAction = SKAction.sequence([powerUpCastAnimation, .fadeOut(withDuration: 0.25)])
//        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
//        animationNode.run(SKAction.group([animationAction, soundAction]))
//
//        return animationNode
//    }
//
//    /**
//     Returns the Animation Node with animation
//     for "casting" phase and "in-effect" phase.
//     */
//    func getAnimationNode(
//        at position: CGPoint,
//        with size: CGSize
//    ) -> SKSpriteNode {
//                                                                            // scale up the animation
//        let animationNode = SKSpriteNode(texture: nil, color: .clear, size: size.applying(.init(scaleX: 1.7, y: 1.7)))
//        animationNode.position = position
//
//        // Create Animations (Casting of Power-Up)
//        let powerUpCastTextures = TextureContainer.getPowerUpCastTextures(powerUpType: self)
//        let powerUpCastAnimation: SKAction = .animate(
//            with: powerUpCastTextures,
//            timePerFrame: 0.05,
//            resize: false,
//            restore: false
//        )
//
//        // Create Animation (When Power-Up is In Effect)
//        let powerUpTextures = TextureContainer.getPowerUpTextures(powerUpType: self)
//        let powerUpAnimation = SKAction.repeatForever(
//            .animate(
//                with: powerUpTextures,
//                timePerFrame: 0.05,
//                resize: false,
//                restore: false
//            )
//        )
//
//        let animationAction = SKAction.sequence([powerUpCastAnimation, powerUpAnimation])
//        let soundAction = SKAction.playSoundFileNamed("cast power up", waitForCompletion: false)
//        animationNode.run(SKAction.group([animationAction, soundAction]))
//
//        return animationNode
//    }
//}
