// MARK: - Mocks generated from file: GameOfRunes/GameEngine/GameEngine.swift at 2020-03-21 17:51:19 +0000

//
//  GameEngine.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockGameEngine: GameEngine, Cuckoo.ClassMock {
    
     typealias MocksType = GameEngine
    
     typealias Stubbing = __StubbingProxy_GameEngine
     typealias Verification = __VerificationProxy_GameEngine

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameEngine?

     func enableDefaultImplementation(_ stub: GameEngine) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var gameScene: GameScene? {
        get {
            return cuckoo_manager.getter("gameScene",
                superclassCall:
                    
                    super.gameScene
                    ,
                defaultCall: __defaultImplStub!.gameScene)
        }
        
        set {
            cuckoo_manager.setter("gameScene",
                value: newValue,
                superclassCall:
                    
                    super.gameScene = newValue
                    ,
                defaultCall: __defaultImplStub!.gameScene = newValue)
        }
        
    }
    
    
    
     override var playerHealthEntity: PlayerHealthEntity? {
        get {
            return cuckoo_manager.getter("playerHealthEntity",
                superclassCall:
                    
                    super.playerHealthEntity
                    ,
                defaultCall: __defaultImplStub!.playerHealthEntity)
        }
        
    }
    
    
    
     override var playerManaEntity: PlayerManaEntity? {
        get {
            return cuckoo_manager.getter("playerManaEntity",
                superclassCall:
                    
                    super.playerManaEntity
                    ,
                defaultCall: __defaultImplStub!.playerManaEntity)
        }
        
    }
    

    

    
    
    
     override func add(_ entity: Entity)  {
        
    return cuckoo_manager.call("add(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.add(entity)
                ,
            defaultCall: __defaultImplStub!.add(entity))
        
    }
    
    
    
     override func remove(_ entity: Entity)  {
        
    return cuckoo_manager.call("remove(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.remove(entity)
                ,
            defaultCall: __defaultImplStub!.remove(entity))
        
    }
    
    
    
     override func removeComponent(_ component: Component)  {
        
    return cuckoo_manager.call("removeComponent(_: Component)",
            parameters: (component),
            escapingParameters: (component),
            superclassCall:
                
                super.removeComponent(component)
                ,
            defaultCall: __defaultImplStub!.removeComponent(component))
        
    }
    
    
    
     override func update(with deltaTime: TimeInterval)  {
        
    return cuckoo_manager.call("update(with: TimeInterval)",
            parameters: (deltaTime),
            escapingParameters: (deltaTime),
            superclassCall:
                
                super.update(with: deltaTime)
                ,
            defaultCall: __defaultImplStub!.update(with: deltaTime))
        
    }
    
    
    
     override func spawnEnemy()  {
        
    return cuckoo_manager.call("spawnEnemy()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.spawnEnemy()
                ,
            defaultCall: __defaultImplStub!.spawnEnemy())
        
    }
    
    
    
     override func entities(for team: Team) -> [Entity] {
        
    return cuckoo_manager.call("entities(for: Team) -> [Entity]",
            parameters: (team),
            escapingParameters: (team),
            superclassCall:
                
                super.entities(for: team)
                ,
            defaultCall: __defaultImplStub!.entities(for: team))
        
    }
    
    
    
     override func entities(for type: EntityType) -> Set<Entity> {
        
    return cuckoo_manager.call("entities(for: EntityType) -> Set<Entity>",
            parameters: (type),
            escapingParameters: (type),
            superclassCall:
                
                super.entities(for: type)
                ,
            defaultCall: __defaultImplStub!.entities(for: type))
        
    }
    
    
    
     override func moveComponents(for team: Team) -> [MoveComponent] {
        
    return cuckoo_manager.call("moveComponents(for: Team) -> [MoveComponent]",
            parameters: (team),
            escapingParameters: (team),
            superclassCall:
                
                super.moveComponents(for: team)
                ,
            defaultCall: __defaultImplStub!.moveComponents(for: team))
        
    }
    
    
    
     override func decreasePlayerHealth()  {
        
    return cuckoo_manager.call("decreasePlayerHealth()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.decreasePlayerHealth()
                ,
            defaultCall: __defaultImplStub!.decreasePlayerHealth())
        
    }
    
    
    
     override func gestureActivated(gesture: CustomGesture)  {
        
    return cuckoo_manager.call("gestureActivated(gesture: CustomGesture)",
            parameters: (gesture),
            escapingParameters: (gesture),
            superclassCall:
                
                super.gestureActivated(gesture: gesture)
                ,
            defaultCall: __defaultImplStub!.gestureActivated(gesture: gesture))
        
    }
    
    
    
     override func minusHealthPoints(for entity: GKEntity) -> Int? {
        
    return cuckoo_manager.call("minusHealthPoints(for: GKEntity) -> Int?",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.minusHealthPoints(for: entity)
                ,
            defaultCall: __defaultImplStub!.minusHealthPoints(for: entity))
        
    }
    
    
    
     override func enemyForceRemoved(_ entity: GKEntity)  {
        
    return cuckoo_manager.call("enemyForceRemoved(_: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.enemyForceRemoved(entity)
                ,
            defaultCall: __defaultImplStub!.enemyForceRemoved(entity))
        
    }
    
    
    
     override func enemyReachedLine(_ entity: GKEntity)  {
        
    return cuckoo_manager.call("enemyReachedLine(_: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.enemyReachedLine(entity)
                ,
            defaultCall: __defaultImplStub!.enemyReachedLine(entity))
        
    }
    
    
    
     override func dropMana(at entity: GKEntity)  {
        
    return cuckoo_manager.call("dropMana(at: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.dropMana(at: entity)
                ,
            defaultCall: __defaultImplStub!.dropMana(at: entity))
        
    }
    
    
    
     override func stopAnimationForDuration(for entity: Entity, duration: TimeInterval, animationNodeKey: String)  {
        
    return cuckoo_manager.call("stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)",
            parameters: (entity, duration, animationNodeKey),
            escapingParameters: (entity, duration, animationNodeKey),
            superclassCall:
                
                super.stopAnimationForDuration(for: entity, duration: duration, animationNodeKey: animationNodeKey)
                ,
            defaultCall: __defaultImplStub!.stopAnimationForDuration(for: entity, duration: duration, animationNodeKey: animationNodeKey))
        
    }
    
    
    
     override func increasePlayerMana(by manaPoints: Int)  {
        
    return cuckoo_manager.call("increasePlayerMana(by: Int)",
            parameters: (manaPoints),
            escapingParameters: (manaPoints),
            superclassCall:
                
                super.increasePlayerMana(by: manaPoints)
                ,
            defaultCall: __defaultImplStub!.increasePlayerMana(by: manaPoints))
        
    }
    
    
    
     override func decreasePlayerMana(by manaPoints: Int)  {
        
    return cuckoo_manager.call("decreasePlayerMana(by: Int)",
            parameters: (manaPoints),
            escapingParameters: (manaPoints),
            superclassCall:
                
                super.decreasePlayerMana(by: manaPoints)
                ,
            defaultCall: __defaultImplStub!.decreasePlayerMana(by: manaPoints))
        
    }
    

	 struct __StubbingProxy_GameEngine: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var gameScene: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameEngine, GameScene> {
	        return .init(manager: cuckoo_manager, name: "gameScene")
	    }
	    
	    
	    var playerHealthEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, PlayerHealthEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerHealthEntity")
	    }
	    
	    
	    var playerManaEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, PlayerManaEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerManaEntity")
	    }
	    
	    
	    func add<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "add(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func remove<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "remove(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable>(with deltaTime: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltaTime) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "update(with: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func spawnEnemy() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "spawnEnemy()", parameterMatchers: matchers))
	    }
	    
	    func entities<M1: Cuckoo.Matchable>(for team: M1) -> Cuckoo.ClassStubFunction<(Team), [Entity]> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "entities(for: Team) -> [Entity]", parameterMatchers: matchers))
	    }
	    
	    func entities<M1: Cuckoo.Matchable>(for type: M1) -> Cuckoo.ClassStubFunction<(EntityType), Set<Entity>> where M1.MatchedType == EntityType {
	        let matchers: [Cuckoo.ParameterMatcher<(EntityType)>] = [wrap(matchable: type) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "entities(for: EntityType) -> Set<Entity>", parameterMatchers: matchers))
	    }
	    
	    func moveComponents<M1: Cuckoo.Matchable>(for team: M1) -> Cuckoo.ClassStubFunction<(Team), [MoveComponent]> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "moveComponents(for: Team) -> [MoveComponent]", parameterMatchers: matchers))
	    }
	    
	    func decreasePlayerHealth() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "decreasePlayerHealth()", parameterMatchers: matchers))
	    }
	    
	    func gestureActivated<M1: Cuckoo.Matchable>(gesture: M1) -> Cuckoo.ClassStubNoReturnFunction<(CustomGesture)> where M1.MatchedType == CustomGesture {
	        let matchers: [Cuckoo.ParameterMatcher<(CustomGesture)>] = [wrap(matchable: gesture) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "gestureActivated(gesture: CustomGesture)", parameterMatchers: matchers))
	    }
	    
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "minusHealthPoints(for: GKEntity) -> Int?", parameterMatchers: matchers))
	    }
	    
	    func enemyForceRemoved<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "enemyForceRemoved(_: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func enemyReachedLine<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "enemyReachedLine(_: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func dropMana<M1: Cuckoo.Matchable>(at entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "dropMana(at: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func stopAnimationForDuration<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.ClassStubNoReturnFunction<(Entity, TimeInterval, String)> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)", parameterMatchers: matchers))
	    }
	    
	    func increasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "increasePlayerMana(by: Int)", parameterMatchers: matchers))
	    }
	    
	    func decreasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "decreasePlayerMana(by: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameEngine: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var gameScene: Cuckoo.VerifyOptionalProperty<GameScene> {
	        return .init(manager: cuckoo_manager, name: "gameScene", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerHealthEntity: Cuckoo.VerifyReadOnlyProperty<PlayerHealthEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerHealthEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerManaEntity: Cuckoo.VerifyReadOnlyProperty<PlayerManaEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerManaEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func add<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("add(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func remove<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("remove(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(with deltaTime: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltaTime) { $0 }]
	        return cuckoo_manager.verify("update(with: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func spawnEnemy() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("spawnEnemy()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func entities<M1: Cuckoo.Matchable>(for team: M1) -> Cuckoo.__DoNotUse<(Team), [Entity]> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return cuckoo_manager.verify("entities(for: Team) -> [Entity]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func entities<M1: Cuckoo.Matchable>(for type: M1) -> Cuckoo.__DoNotUse<(EntityType), Set<Entity>> where M1.MatchedType == EntityType {
	        let matchers: [Cuckoo.ParameterMatcher<(EntityType)>] = [wrap(matchable: type) { $0 }]
	        return cuckoo_manager.verify("entities(for: EntityType) -> Set<Entity>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func moveComponents<M1: Cuckoo.Matchable>(for team: M1) -> Cuckoo.__DoNotUse<(Team), [MoveComponent]> where M1.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(Team)>] = [wrap(matchable: team) { $0 }]
	        return cuckoo_manager.verify("moveComponents(for: Team) -> [MoveComponent]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func decreasePlayerHealth() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("decreasePlayerHealth()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func gestureActivated<M1: Cuckoo.Matchable>(gesture: M1) -> Cuckoo.__DoNotUse<(CustomGesture), Void> where M1.MatchedType == CustomGesture {
	        let matchers: [Cuckoo.ParameterMatcher<(CustomGesture)>] = [wrap(matchable: gesture) { $0 }]
	        return cuckoo_manager.verify("gestureActivated(gesture: CustomGesture)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("minusHealthPoints(for: GKEntity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func enemyForceRemoved<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("enemyForceRemoved(_: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func enemyReachedLine<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("enemyReachedLine(_: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func dropMana<M1: Cuckoo.Matchable>(at entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("dropMana(at: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func stopAnimationForDuration<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.__DoNotUse<(Entity, TimeInterval, String), Void> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return cuckoo_manager.verify("stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func increasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return cuckoo_manager.verify("increasePlayerMana(by: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func decreasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return cuckoo_manager.verify("decreasePlayerMana(by: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameEngineStub: GameEngine {
    
    
     override var gameScene: GameScene? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GameScene?).self)
        }
        
        set { }
        
    }
    
    
     override var playerHealthEntity: PlayerHealthEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerHealthEntity?).self)
        }
        
    }
    
    
     override var playerManaEntity: PlayerManaEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerManaEntity?).self)
        }
        
    }
    

    

    
     override func add(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func remove(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func update(with deltaTime: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func spawnEnemy()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func entities(for team: Team) -> [Entity]  {
        return DefaultValueRegistry.defaultValue(for: ([Entity]).self)
    }
    
     override func entities(for type: EntityType) -> Set<Entity>  {
        return DefaultValueRegistry.defaultValue(for: (Set<Entity>).self)
    }
    
     override func moveComponents(for team: Team) -> [MoveComponent]  {
        return DefaultValueRegistry.defaultValue(for: ([MoveComponent]).self)
    }
    
     override func decreasePlayerHealth()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func gestureActivated(gesture: CustomGesture)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func minusHealthPoints(for entity: GKEntity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
     override func enemyForceRemoved(_ entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func enemyReachedLine(_ entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func dropMana(at entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func stopAnimationForDuration(for entity: Entity, duration: TimeInterval, animationNodeKey: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func increasePlayerMana(by manaPoints: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func decreasePlayerMana(by manaPoints: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/RemoveDelegate.swift at 2020-03-21 17:51:19 +0000

//
//  RemoveDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockRemoveDelegate: RemoveDelegate, Cuckoo.ClassMock {
    
     typealias MocksType = RemoveDelegate
    
     typealias Stubbing = __StubbingProxy_RemoveDelegate
     typealias Verification = __VerificationProxy_RemoveDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: RemoveDelegate?

     func enableDefaultImplementation(_ stub: RemoveDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func removeGesture(for entity: GKEntity)  {
        
    return cuckoo_manager.call("removeGesture(for: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.removeGesture(for: entity)
                ,
            defaultCall: __defaultImplStub!.removeGesture(for: entity))
        
    }
    
    
    
     override func removeEnemy(_ entity: EnemyEntity, shouldDecreasePlayerHealth: Bool)  {
        
    return cuckoo_manager.call("removeEnemy(_: EnemyEntity, shouldDecreasePlayerHealth: Bool)",
            parameters: (entity, shouldDecreasePlayerHealth),
            escapingParameters: (entity, shouldDecreasePlayerHealth),
            superclassCall:
                
                super.removeEnemy(entity, shouldDecreasePlayerHealth: shouldDecreasePlayerHealth)
                ,
            defaultCall: __defaultImplStub!.removeEnemy(entity, shouldDecreasePlayerHealth: shouldDecreasePlayerHealth))
        
    }
    
    
    
     override func removeDroppedMana(_ entity: DroppedManaEntity)  {
        
    return cuckoo_manager.call("removeDroppedMana(_: DroppedManaEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.removeDroppedMana(entity)
                ,
            defaultCall: __defaultImplStub!.removeDroppedMana(entity))
        
    }
    

	 struct __StubbingProxy_RemoveDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func removeGesture<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeGesture(for: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func removeEnemy<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ entity: M1, shouldDecreasePlayerHealth: M2) -> Cuckoo.ClassStubNoReturnFunction<(EnemyEntity, Bool)> where M1.MatchedType == EnemyEntity, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(EnemyEntity, Bool)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: shouldDecreasePlayerHealth) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeEnemy(_: EnemyEntity, shouldDecreasePlayerHealth: Bool)", parameterMatchers: matchers))
	    }
	    
	    func removeDroppedMana<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(DroppedManaEntity)> where M1.MatchedType == DroppedManaEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(DroppedManaEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeDroppedMana(_: DroppedManaEntity)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RemoveDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func removeGesture<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeGesture(for: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeEnemy<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ entity: M1, shouldDecreasePlayerHealth: M2) -> Cuckoo.__DoNotUse<(EnemyEntity, Bool), Void> where M1.MatchedType == EnemyEntity, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(EnemyEntity, Bool)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: shouldDecreasePlayerHealth) { $0.1 }]
	        return cuckoo_manager.verify("removeEnemy(_: EnemyEntity, shouldDecreasePlayerHealth: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeDroppedMana<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(DroppedManaEntity), Void> where M1.MatchedType == DroppedManaEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(DroppedManaEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeDroppedMana(_: DroppedManaEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RemoveDelegateStub: RemoveDelegate {
    

    

    
     override func removeGesture(for entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeEnemy(_ entity: EnemyEntity, shouldDecreasePlayerHealth: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeDroppedMana(_ entity: DroppedManaEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/SystemDelegate.swift at 2020-03-21 17:51:19 +0000

//
//  SystemDelegate.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockSystemDelegate: SystemDelegate, Cuckoo.ClassMock {
    
     typealias MocksType = SystemDelegate
    
     typealias Stubbing = __StubbingProxy_SystemDelegate
     typealias Verification = __VerificationProxy_SystemDelegate

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SystemDelegate?

     func enableDefaultImplementation(_ stub: SystemDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var healthSystem: HealthSystem? {
        get {
            return cuckoo_manager.getter("healthSystem",
                superclassCall:
                    
                    super.healthSystem
                    ,
                defaultCall: __defaultImplStub!.healthSystem)
        }
        
    }
    
    
    
     override var manaSystem: ManaSystem? {
        get {
            return cuckoo_manager.getter("manaSystem",
                superclassCall:
                    
                    super.manaSystem
                    ,
                defaultCall: __defaultImplStub!.manaSystem)
        }
        
    }
    
    
    
     override var moveSystem: MoveSystem? {
        get {
            return cuckoo_manager.getter("moveSystem",
                superclassCall:
                    
                    super.moveSystem
                    ,
                defaultCall: __defaultImplStub!.moveSystem)
        }
        
    }
    
    
    
     override var spriteSystem: SpriteSystem? {
        get {
            return cuckoo_manager.getter("spriteSystem",
                superclassCall:
                    
                    super.spriteSystem
                    ,
                defaultCall: __defaultImplStub!.spriteSystem)
        }
        
    }
    

    

    
    
    
     override func update(with deltatime: TimeInterval)  {
        
    return cuckoo_manager.call("update(with: TimeInterval)",
            parameters: (deltatime),
            escapingParameters: (deltatime),
            superclassCall:
                
                super.update(with: deltatime)
                ,
            defaultCall: __defaultImplStub!.update(with: deltatime))
        
    }
    
    
    
     override func addComponents(foundIn entity: GKEntity)  {
        
    return cuckoo_manager.call("addComponents(foundIn: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.addComponents(foundIn: entity)
                ,
            defaultCall: __defaultImplStub!.addComponents(foundIn: entity))
        
    }
    
    
    
     override func removeComponents(foundIn entity: GKEntity)  {
        
    return cuckoo_manager.call("removeComponents(foundIn: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.removeComponents(foundIn: entity)
                ,
            defaultCall: __defaultImplStub!.removeComponents(foundIn: entity))
        
    }
    
    
    
     override func removeComponent(_ component: Component)  {
        
    return cuckoo_manager.call("removeComponent(_: Component)",
            parameters: (component),
            escapingParameters: (component),
            superclassCall:
                
                super.removeComponent(component)
                ,
            defaultCall: __defaultImplStub!.removeComponent(component))
        
    }
    
    
    
     override func minusHealthPoints(for entity: GKEntity) -> Int? {
        
    return cuckoo_manager.call("minusHealthPoints(for: GKEntity) -> Int?",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.minusHealthPoints(for: entity)
                ,
            defaultCall: __defaultImplStub!.minusHealthPoints(for: entity))
        
    }
    
    
    
     override func increaseMana(by manaPoint: Int, for entity: GKEntity)  {
        
    return cuckoo_manager.call("increaseMana(by: Int, for: GKEntity)",
            parameters: (manaPoint, entity),
            escapingParameters: (manaPoint, entity),
            superclassCall:
                
                super.increaseMana(by: manaPoint, for: entity)
                ,
            defaultCall: __defaultImplStub!.increaseMana(by: manaPoint, for: entity))
        
    }
    
    
    
     override func dropMana(at entity: GKEntity)  {
        
    return cuckoo_manager.call("dropMana(at: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.dropMana(at: entity)
                ,
            defaultCall: __defaultImplStub!.dropMana(at: entity))
        
    }
    
    
    
     override func getMana(for entity: GKEntity) -> Int? {
        
    return cuckoo_manager.call("getMana(for: GKEntity) -> Int?",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.getMana(for: entity)
                ,
            defaultCall: __defaultImplStub!.getMana(for: entity))
        
    }
    
    
    
     override func stopMovement(for entity: Entity, duration: TimeInterval)  {
        
    return cuckoo_manager.call("stopMovement(for: Entity, duration: TimeInterval)",
            parameters: (entity, duration),
            escapingParameters: (entity, duration),
            superclassCall:
                
                super.stopMovement(for: entity, duration: duration)
                ,
            defaultCall: __defaultImplStub!.stopMovement(for: entity, duration: duration))
        
    }
    
    
    
     override func stopAnimation(for entity: Entity, duration: TimeInterval, animationNodeKey: String)  {
        
    return cuckoo_manager.call("stopAnimation(for: Entity, duration: TimeInterval, animationNodeKey: String)",
            parameters: (entity, duration, animationNodeKey),
            escapingParameters: (entity, duration, animationNodeKey),
            superclassCall:
                
                super.stopAnimation(for: entity, duration: duration, animationNodeKey: animationNodeKey)
                ,
            defaultCall: __defaultImplStub!.stopAnimation(for: entity, duration: duration, animationNodeKey: animationNodeKey))
        
    }
    

	 struct __StubbingProxy_SystemDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var healthSystem: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockSystemDelegate, HealthSystem?> {
	        return .init(manager: cuckoo_manager, name: "healthSystem")
	    }
	    
	    
	    var manaSystem: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockSystemDelegate, ManaSystem?> {
	        return .init(manager: cuckoo_manager, name: "manaSystem")
	    }
	    
	    
	    var moveSystem: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockSystemDelegate, MoveSystem?> {
	        return .init(manager: cuckoo_manager, name: "moveSystem")
	    }
	    
	    
	    var spriteSystem: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockSystemDelegate, SpriteSystem?> {
	        return .init(manager: cuckoo_manager, name: "spriteSystem")
	    }
	    
	    
	    func update<M1: Cuckoo.Matchable>(with deltatime: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltatime) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "update(with: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func addComponents<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "addComponents(foundIn: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func removeComponents<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "removeComponents(foundIn: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "minusHealthPoints(for: GKEntity) -> Int?", parameterMatchers: matchers))
	    }
	    
	    func increaseMana<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(by manaPoint: M1, for entity: M2) -> Cuckoo.ClassStubNoReturnFunction<(Int, GKEntity)> where M1.MatchedType == Int, M2.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, GKEntity)>] = [wrap(matchable: manaPoint) { $0.0 }, wrap(matchable: entity) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "increaseMana(by: Int, for: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func dropMana<M1: Cuckoo.Matchable>(at entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "dropMana(at: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func getMana<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "getMana(for: GKEntity) -> Int?", parameterMatchers: matchers))
	    }
	    
	    func stopMovement<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(for entity: M1, duration: M2) -> Cuckoo.ClassStubNoReturnFunction<(Entity, TimeInterval)> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "stopMovement(for: Entity, duration: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func stopAnimation<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.ClassStubNoReturnFunction<(Entity, TimeInterval, String)> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSystemDelegate.self, method: "stopAnimation(for: Entity, duration: TimeInterval, animationNodeKey: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SystemDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var healthSystem: Cuckoo.VerifyReadOnlyProperty<HealthSystem?> {
	        return .init(manager: cuckoo_manager, name: "healthSystem", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var manaSystem: Cuckoo.VerifyReadOnlyProperty<ManaSystem?> {
	        return .init(manager: cuckoo_manager, name: "manaSystem", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var moveSystem: Cuckoo.VerifyReadOnlyProperty<MoveSystem?> {
	        return .init(manager: cuckoo_manager, name: "moveSystem", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var spriteSystem: Cuckoo.VerifyReadOnlyProperty<SpriteSystem?> {
	        return .init(manager: cuckoo_manager, name: "spriteSystem", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(with deltatime: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltatime) { $0 }]
	        return cuckoo_manager.verify("update(with: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addComponents<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("addComponents(foundIn: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponents<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeComponents(foundIn: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("minusHealthPoints(for: GKEntity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func increaseMana<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(by manaPoint: M1, for entity: M2) -> Cuckoo.__DoNotUse<(Int, GKEntity), Void> where M1.MatchedType == Int, M2.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, GKEntity)>] = [wrap(matchable: manaPoint) { $0.0 }, wrap(matchable: entity) { $0.1 }]
	        return cuckoo_manager.verify("increaseMana(by: Int, for: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func dropMana<M1: Cuckoo.Matchable>(at entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("dropMana(at: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getMana<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("getMana(for: GKEntity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func stopMovement<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(for entity: M1, duration: M2) -> Cuckoo.__DoNotUse<(Entity, TimeInterval), Void> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }]
	        return cuckoo_manager.verify("stopMovement(for: Entity, duration: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func stopAnimation<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.__DoNotUse<(Entity, TimeInterval, String), Void> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return cuckoo_manager.verify("stopAnimation(for: Entity, duration: TimeInterval, animationNodeKey: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SystemDelegateStub: SystemDelegate {
    
    
     override var healthSystem: HealthSystem? {
        get {
            return DefaultValueRegistry.defaultValue(for: (HealthSystem?).self)
        }
        
    }
    
    
     override var manaSystem: ManaSystem? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ManaSystem?).self)
        }
        
    }
    
    
     override var moveSystem: MoveSystem? {
        get {
            return DefaultValueRegistry.defaultValue(for: (MoveSystem?).self)
        }
        
    }
    
    
     override var spriteSystem: SpriteSystem? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SpriteSystem?).self)
        }
        
    }
    

    

    
     override func update(with deltatime: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func addComponents(foundIn entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponents(foundIn entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func minusHealthPoints(for entity: GKEntity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
     override func increaseMana(by manaPoint: Int, for entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func dropMana(at entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func getMana(for entity: GKEntity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
     override func stopMovement(for entity: Entity, duration: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func stopAnimation(for entity: Entity, duration: TimeInterval, animationNodeKey: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameStateMachine.swift at 2020-03-21 17:51:19 +0000

//
//  GameStateMachine.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGameStateMachine: GameStateMachine, Cuckoo.ClassMock {
    
     typealias MocksType = GameStateMachine
    
     typealias Stubbing = __StubbingProxy_GameStateMachine
     typealias Verification = __VerificationProxy_GameStateMachine

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameStateMachine?

     func enableDefaultImplementation(_ stub: GameStateMachine) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var sceneManager: SceneManager? {
        get {
            return cuckoo_manager.getter("sceneManager",
                superclassCall:
                    
                    super.sceneManager
                    ,
                defaultCall: __defaultImplStub!.sceneManager)
        }
        
        set {
            cuckoo_manager.setter("sceneManager",
                value: newValue,
                superclassCall:
                    
                    super.sceneManager = newValue
                    ,
                defaultCall: __defaultImplStub!.sceneManager = newValue)
        }
        
    }
    
    
    
     override var gameEngine: GameEngine? {
        get {
            return cuckoo_manager.getter("gameEngine",
                superclassCall:
                    
                    super.gameEngine
                    ,
                defaultCall: __defaultImplStub!.gameEngine)
        }
        
        set {
            cuckoo_manager.setter("gameEngine",
                value: newValue,
                superclassCall:
                    
                    super.gameEngine = newValue
                    ,
                defaultCall: __defaultImplStub!.gameEngine = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_GameStateMachine: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sceneManager: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameStateMachine, SceneManager> {
	        return .init(manager: cuckoo_manager, name: "sceneManager")
	    }
	    
	    
	    var gameEngine: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameStateMachine, GameEngine> {
	        return .init(manager: cuckoo_manager, name: "gameEngine")
	    }
	    
	    
	}

	 struct __VerificationProxy_GameStateMachine: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sceneManager: Cuckoo.VerifyOptionalProperty<SceneManager> {
	        return .init(manager: cuckoo_manager, name: "sceneManager", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var gameEngine: Cuckoo.VerifyOptionalProperty<GameEngine> {
	        return .init(manager: cuckoo_manager, name: "gameEngine", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class GameStateMachineStub: GameStateMachine {
    
    
     override var sceneManager: SceneManager? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SceneManager?).self)
        }
        
        set { }
        
    }
    
    
     override var gameEngine: GameEngine? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GameEngine?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/Scenes/GameScene.swift at 2020-03-21 17:51:19 +0000

//
//  GameScene.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockGameScene: GameScene, Cuckoo.ClassMock {
    
     typealias MocksType = GameScene
    
     typealias Stubbing = __StubbingProxy_GameScene
     typealias Verification = __VerificationProxy_GameScene

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameScene?

     func enableDefaultImplementation(_ stub: GameScene) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var backgroundLayer: SKNode! {
        get {
            return cuckoo_manager.getter("backgroundLayer",
                superclassCall:
                    
                    super.backgroundLayer
                    ,
                defaultCall: __defaultImplStub!.backgroundLayer)
        }
        
    }
    
    
    
     override var enemyLayer: SKNode! {
        get {
            return cuckoo_manager.getter("enemyLayer",
                superclassCall:
                    
                    super.enemyLayer
                    ,
                defaultCall: __defaultImplStub!.enemyLayer)
        }
        
    }
    
    
    
     override var powerUpAnimationLayer: SKNode! {
        get {
            return cuckoo_manager.getter("powerUpAnimationLayer",
                superclassCall:
                    
                    super.powerUpAnimationLayer
                    ,
                defaultCall: __defaultImplStub!.powerUpAnimationLayer)
        }
        
    }
    
    
    
     override var removalAnimationLayer: SKNode! {
        get {
            return cuckoo_manager.getter("removalAnimationLayer",
                superclassCall:
                    
                    super.removalAnimationLayer
                    ,
                defaultCall: __defaultImplStub!.removalAnimationLayer)
        }
        
    }
    
    
    
     override var gestureLayer: SKNode! {
        get {
            return cuckoo_manager.getter("gestureLayer",
                superclassCall:
                    
                    super.gestureLayer
                    ,
                defaultCall: __defaultImplStub!.gestureLayer)
        }
        
    }
    
    
    
     override var playerAreaLayer: SKNode! {
        get {
            return cuckoo_manager.getter("playerAreaLayer",
                superclassCall:
                    
                    super.playerAreaLayer
                    ,
                defaultCall: __defaultImplStub!.playerAreaLayer)
        }
        
    }
    
    
    
     override var manaDropLayer: SKNode! {
        get {
            return cuckoo_manager.getter("manaDropLayer",
                superclassCall:
                    
                    super.manaDropLayer
                    ,
                defaultCall: __defaultImplStub!.manaDropLayer)
        }
        
    }
    
    
    
     override var highestPriorityLayer: SKNode! {
        get {
            return cuckoo_manager.getter("highestPriorityLayer",
                superclassCall:
                    
                    super.highestPriorityLayer
                    ,
                defaultCall: __defaultImplStub!.highestPriorityLayer)
        }
        
    }
    
    
    
     override var playerAreaNode: PlayerAreaNode! {
        get {
            return cuckoo_manager.getter("playerAreaNode",
                superclassCall:
                    
                    super.playerAreaNode
                    ,
                defaultCall: __defaultImplStub!.playerAreaNode)
        }
        
    }
    
    
    
     override var gestureAreaNode: GestureAreaNode! {
        get {
            return cuckoo_manager.getter("gestureAreaNode",
                superclassCall:
                    
                    super.gestureAreaNode
                    ,
                defaultCall: __defaultImplStub!.gestureAreaNode)
        }
        
    }
    
    
    
     override var bgmNode: SKAudioNode! {
        get {
            return cuckoo_manager.getter("bgmNode",
                superclassCall:
                    
                    super.bgmNode
                    ,
                defaultCall: __defaultImplStub!.bgmNode)
        }
        
        set {
            cuckoo_manager.setter("bgmNode",
                value: newValue,
                superclassCall:
                    
                    super.bgmNode = newValue
                    ,
                defaultCall: __defaultImplStub!.bgmNode = newValue)
        }
        
    }
    

    

    
    
    
     override func sceneDidLoad()  {
        
    return cuckoo_manager.call("sceneDidLoad()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.sceneDidLoad()
                ,
            defaultCall: __defaultImplStub!.sceneDidLoad())
        
    }
    
    
    
     override func didMove(to view: SKView)  {
        
    return cuckoo_manager.call("didMove(to: SKView)",
            parameters: (view),
            escapingParameters: (view),
            superclassCall:
                
                super.didMove(to: view)
                ,
            defaultCall: __defaultImplStub!.didMove(to: view))
        
    }
    
    
    
     override func willMove(from view: SKView)  {
        
    return cuckoo_manager.call("willMove(from: SKView)",
            parameters: (view),
            escapingParameters: (view),
            superclassCall:
                
                super.willMove(from: view)
                ,
            defaultCall: __defaultImplStub!.willMove(from: view))
        
    }
    
    
    
     override func update(_ currentTime: TimeInterval)  {
        
    return cuckoo_manager.call("update(_: TimeInterval)",
            parameters: (currentTime),
            escapingParameters: (currentTime),
            superclassCall:
                
                super.update(currentTime)
                ,
            defaultCall: __defaultImplStub!.update(currentTime))
        
    }
    
    
    
     override func addNodeToLayer(layer: SpriteLayerType, node: SKNode)  {
        
    return cuckoo_manager.call("addNodeToLayer(layer: SpriteLayerType, node: SKNode)",
            parameters: (layer, node),
            escapingParameters: (layer, node),
            superclassCall:
                
                super.addNodeToLayer(layer: layer, node: node)
                ,
            defaultCall: __defaultImplStub!.addNodeToLayer(layer: layer, node: node))
        
    }
    
    
    
     override func gameDidEnd(didWin: Bool)  {
        
    return cuckoo_manager.call("gameDidEnd(didWin: Bool)",
            parameters: (didWin),
            escapingParameters: (didWin),
            superclassCall:
                
                super.gameDidEnd(didWin: didWin)
                ,
            defaultCall: __defaultImplStub!.gameDidEnd(didWin: didWin))
        
    }
    

	 struct __StubbingProxy_GameScene: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var backgroundLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "backgroundLayer")
	    }
	    
	    
	    var enemyLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "enemyLayer")
	    }
	    
	    
	    var powerUpAnimationLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "powerUpAnimationLayer")
	    }
	    
	    
	    var removalAnimationLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "removalAnimationLayer")
	    }
	    
	    
	    var gestureLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "gestureLayer")
	    }
	    
	    
	    var playerAreaLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "playerAreaLayer")
	    }
	    
	    
	    var manaDropLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "manaDropLayer")
	    }
	    
	    
	    var highestPriorityLayer: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, SKNode?> {
	        return .init(manager: cuckoo_manager, name: "highestPriorityLayer")
	    }
	    
	    
	    var playerAreaNode: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, PlayerAreaNode?> {
	        return .init(manager: cuckoo_manager, name: "playerAreaNode")
	    }
	    
	    
	    var gestureAreaNode: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, GestureAreaNode?> {
	        return .init(manager: cuckoo_manager, name: "gestureAreaNode")
	    }
	    
	    
	    var bgmNode: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameScene, SKAudioNode> {
	        return .init(manager: cuckoo_manager, name: "bgmNode")
	    }
	    
	    
	    func sceneDidLoad() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "sceneDidLoad()", parameterMatchers: matchers))
	    }
	    
	    func didMove<M1: Cuckoo.Matchable>(to view: M1) -> Cuckoo.ClassStubNoReturnFunction<(SKView)> where M1.MatchedType == SKView {
	        let matchers: [Cuckoo.ParameterMatcher<(SKView)>] = [wrap(matchable: view) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "didMove(to: SKView)", parameterMatchers: matchers))
	    }
	    
	    func willMove<M1: Cuckoo.Matchable>(from view: M1) -> Cuckoo.ClassStubNoReturnFunction<(SKView)> where M1.MatchedType == SKView {
	        let matchers: [Cuckoo.ParameterMatcher<(SKView)>] = [wrap(matchable: view) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "willMove(from: SKView)", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable>(_ currentTime: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: currentTime) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "update(_: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func addNodeToLayer<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(layer: M1, node: M2) -> Cuckoo.ClassStubNoReturnFunction<(SpriteLayerType, SKNode)> where M1.MatchedType == SpriteLayerType, M2.MatchedType == SKNode {
	        let matchers: [Cuckoo.ParameterMatcher<(SpriteLayerType, SKNode)>] = [wrap(matchable: layer) { $0.0 }, wrap(matchable: node) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "addNodeToLayer(layer: SpriteLayerType, node: SKNode)", parameterMatchers: matchers))
	    }
	    
	    func gameDidEnd<M1: Cuckoo.Matchable>(didWin: M1) -> Cuckoo.ClassStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: didWin) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "gameDidEnd(didWin: Bool)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameScene: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var backgroundLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "backgroundLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var enemyLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "enemyLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var powerUpAnimationLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "powerUpAnimationLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var removalAnimationLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "removalAnimationLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var gestureLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "gestureLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerAreaLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "playerAreaLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var manaDropLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "manaDropLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var highestPriorityLayer: Cuckoo.VerifyReadOnlyProperty<SKNode?> {
	        return .init(manager: cuckoo_manager, name: "highestPriorityLayer", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerAreaNode: Cuckoo.VerifyReadOnlyProperty<PlayerAreaNode?> {
	        return .init(manager: cuckoo_manager, name: "playerAreaNode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var gestureAreaNode: Cuckoo.VerifyReadOnlyProperty<GestureAreaNode?> {
	        return .init(manager: cuckoo_manager, name: "gestureAreaNode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var bgmNode: Cuckoo.VerifyOptionalProperty<SKAudioNode> {
	        return .init(manager: cuckoo_manager, name: "bgmNode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func sceneDidLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("sceneDidLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didMove<M1: Cuckoo.Matchable>(to view: M1) -> Cuckoo.__DoNotUse<(SKView), Void> where M1.MatchedType == SKView {
	        let matchers: [Cuckoo.ParameterMatcher<(SKView)>] = [wrap(matchable: view) { $0 }]
	        return cuckoo_manager.verify("didMove(to: SKView)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func willMove<M1: Cuckoo.Matchable>(from view: M1) -> Cuckoo.__DoNotUse<(SKView), Void> where M1.MatchedType == SKView {
	        let matchers: [Cuckoo.ParameterMatcher<(SKView)>] = [wrap(matchable: view) { $0 }]
	        return cuckoo_manager.verify("willMove(from: SKView)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(_ currentTime: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: currentTime) { $0 }]
	        return cuckoo_manager.verify("update(_: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addNodeToLayer<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(layer: M1, node: M2) -> Cuckoo.__DoNotUse<(SpriteLayerType, SKNode), Void> where M1.MatchedType == SpriteLayerType, M2.MatchedType == SKNode {
	        let matchers: [Cuckoo.ParameterMatcher<(SpriteLayerType, SKNode)>] = [wrap(matchable: layer) { $0.0 }, wrap(matchable: node) { $0.1 }]
	        return cuckoo_manager.verify("addNodeToLayer(layer: SpriteLayerType, node: SKNode)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func gameDidEnd<M1: Cuckoo.Matchable>(didWin: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: didWin) { $0 }]
	        return cuckoo_manager.verify("gameDidEnd(didWin: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameSceneStub: GameScene {
    
    
     override var backgroundLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var enemyLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var powerUpAnimationLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var removalAnimationLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var gestureLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var playerAreaLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var manaDropLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var highestPriorityLayer: SKNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKNode?).self)
        }
        
    }
    
    
     override var playerAreaNode: PlayerAreaNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerAreaNode?).self)
        }
        
    }
    
    
     override var gestureAreaNode: GestureAreaNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (GestureAreaNode?).self)
        }
        
    }
    
    
     override var bgmNode: SKAudioNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (SKAudioNode?).self)
        }
        
        set { }
        
    }
    

    

    
     override func sceneDidLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func didMove(to view: SKView)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func willMove(from view: SKView)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func update(_ currentTime: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func addNodeToLayer(layer: SpriteLayerType, node: SKNode)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func gameDidEnd(didWin: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

