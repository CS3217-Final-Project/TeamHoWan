// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/DroppedManaNode/DroppedManaNode.swift at 2020-03-27 17:02:51 +0000

//
//  DroppedManaNode.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import SpriteKit


 class MockDroppedManaNode: DroppedManaNode, Cuckoo.ClassMock {
    
     typealias MocksType = DroppedManaNode
    
     typealias Stubbing = __StubbingProxy_DroppedManaNode
     typealias Verification = __VerificationProxy_DroppedManaNode

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: DroppedManaNode?

     func enableDefaultImplementation(_ stub: DroppedManaNode) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var droppedManaEntity: DroppedManaEntity? {
        get {
            return cuckoo_manager.getter("droppedManaEntity",
                superclassCall:
                    
                    super.droppedManaEntity
                    ,
                defaultCall: __defaultImplStub!.droppedManaEntity)
        }
        
        set {
            cuckoo_manager.setter("droppedManaEntity",
                value: newValue,
                superclassCall:
                    
                    super.droppedManaEntity = newValue
                    ,
                defaultCall: __defaultImplStub!.droppedManaEntity = newValue)
        }
        
    }
    

    

    
    
    
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)  {
        
    return cuckoo_manager.call("touchesEnded(_: Set<UITouch>, with: UIEvent?)",
            parameters: (touches, event),
            escapingParameters: (touches, event),
            superclassCall:
                
                super.touchesEnded(touches, with: event)
                ,
            defaultCall: __defaultImplStub!.touchesEnded(touches, with: event))
        
    }
    

	 struct __StubbingProxy_DroppedManaNode: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var droppedManaEntity: Cuckoo.ClassToBeStubbedOptionalProperty<MockDroppedManaNode, DroppedManaEntity> {
	        return .init(manager: cuckoo_manager, name: "droppedManaEntity")
	    }
	    
	    
	    func touchesEnded<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ touches: M1, with event: M2) -> Cuckoo.ClassStubNoReturnFunction<(Set<UITouch>, UIEvent?)> where M1.MatchedType == Set<UITouch>, M2.OptionalMatchedType == UIEvent {
	        let matchers: [Cuckoo.ParameterMatcher<(Set<UITouch>, UIEvent?)>] = [wrap(matchable: touches) { $0.0 }, wrap(matchable: event) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockDroppedManaNode.self, method: "touchesEnded(_: Set<UITouch>, with: UIEvent?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_DroppedManaNode: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var droppedManaEntity: Cuckoo.VerifyOptionalProperty<DroppedManaEntity> {
	        return .init(manager: cuckoo_manager, name: "droppedManaEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func touchesEnded<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(_ touches: M1, with event: M2) -> Cuckoo.__DoNotUse<(Set<UITouch>, UIEvent?), Void> where M1.MatchedType == Set<UITouch>, M2.OptionalMatchedType == UIEvent {
	        let matchers: [Cuckoo.ParameterMatcher<(Set<UITouch>, UIEvent?)>] = [wrap(matchable: touches) { $0.0 }, wrap(matchable: event) { $0.1 }]
	        return cuckoo_manager.verify("touchesEnded(_: Set<UITouch>, with: UIEvent?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class DroppedManaNodeStub: DroppedManaNode {
    
    
     override var droppedManaEntity: DroppedManaEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (DroppedManaEntity?).self)
        }
        
        set { }
        
    }
    

    

    
     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/Player Area/HealthBarNode.swift at 2020-03-27 17:02:51 +0000

//
//  HealthBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import SpriteKit


 class MockHealthBarNode: HealthBarNode, Cuckoo.ClassMock {
    
     typealias MocksType = HealthBarNode
    
     typealias Stubbing = __StubbingProxy_HealthBarNode
     typealias Verification = __VerificationProxy_HealthBarNode

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HealthBarNode?

     func enableDefaultImplementation(_ stub: HealthBarNode) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var totalLives: Int {
        get {
            return cuckoo_manager.getter("totalLives",
                superclassCall:
                    
                    super.totalLives
                    ,
                defaultCall: __defaultImplStub!.totalLives)
        }
        
        set {
            cuckoo_manager.setter("totalLives",
                value: newValue,
                superclassCall:
                    
                    super.totalLives = newValue
                    ,
                defaultCall: __defaultImplStub!.totalLives = newValue)
        }
        
    }
    
    
    
     override var livesLeft: Int {
        get {
            return cuckoo_manager.getter("livesLeft",
                superclassCall:
                    
                    super.livesLeft
                    ,
                defaultCall: __defaultImplStub!.livesLeft)
        }
        
        set {
            cuckoo_manager.setter("livesLeft",
                value: newValue,
                superclassCall:
                    
                    super.livesLeft = newValue
                    ,
                defaultCall: __defaultImplStub!.livesLeft = newValue)
        }
        
    }
    
    
    
     override var size: CGSize {
        get {
            return cuckoo_manager.getter("size",
                superclassCall:
                    
                    super.size
                    ,
                defaultCall: __defaultImplStub!.size)
        }
        
        set {
            cuckoo_manager.setter("size",
                value: newValue,
                superclassCall:
                    
                    super.size = newValue
                    ,
                defaultCall: __defaultImplStub!.size = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_HealthBarNode: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var totalLives: Cuckoo.ClassToBeStubbedProperty<MockHealthBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "totalLives")
	    }
	    
	    
	    var livesLeft: Cuckoo.ClassToBeStubbedProperty<MockHealthBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "livesLeft")
	    }
	    
	    
	    var size: Cuckoo.ClassToBeStubbedProperty<MockHealthBarNode, CGSize> {
	        return .init(manager: cuckoo_manager, name: "size")
	    }
	    
	    
	}

	 struct __VerificationProxy_HealthBarNode: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var totalLives: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "totalLives", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var livesLeft: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "livesLeft", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var size: Cuckoo.VerifyProperty<CGSize> {
	        return .init(manager: cuckoo_manager, name: "size", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class HealthBarNodeStub: HealthBarNode {
    
    
     override var totalLives: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var livesLeft: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var size: CGSize {
        get {
            return DefaultValueRegistry.defaultValue(for: (CGSize).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/Player Area/ManaBarNode.swift at 2020-03-27 17:02:51 +0000

//
//  ManaBarNode.swift
//  GameOfRunes
//
//  Created by Jermy on 10/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import SpriteKit


 class MockManaBarNode: ManaBarNode, Cuckoo.ClassMock {
    
     typealias MocksType = ManaBarNode
    
     typealias Stubbing = __StubbingProxy_ManaBarNode
     typealias Verification = __VerificationProxy_ManaBarNode

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ManaBarNode?

     func enableDefaultImplementation(_ stub: ManaBarNode) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var numManaUnits: Int {
        get {
            return cuckoo_manager.getter("numManaUnits",
                superclassCall:
                    
                    super.numManaUnits
                    ,
                defaultCall: __defaultImplStub!.numManaUnits)
        }
        
        set {
            cuckoo_manager.setter("numManaUnits",
                value: newValue,
                superclassCall:
                    
                    super.numManaUnits = newValue
                    ,
                defaultCall: __defaultImplStub!.numManaUnits = newValue)
        }
        
    }
    
    
    
     override var manaPointsPerUnit: Int {
        get {
            return cuckoo_manager.getter("manaPointsPerUnit",
                superclassCall:
                    
                    super.manaPointsPerUnit
                    ,
                defaultCall: __defaultImplStub!.manaPointsPerUnit)
        }
        
        set {
            cuckoo_manager.setter("manaPointsPerUnit",
                value: newValue,
                superclassCall:
                    
                    super.manaPointsPerUnit = newValue
                    ,
                defaultCall: __defaultImplStub!.manaPointsPerUnit = newValue)
        }
        
    }
    
    
    
     override var currentManaPoints: Int {
        get {
            return cuckoo_manager.getter("currentManaPoints",
                superclassCall:
                    
                    super.currentManaPoints
                    ,
                defaultCall: __defaultImplStub!.currentManaPoints)
        }
        
        set {
            cuckoo_manager.setter("currentManaPoints",
                value: newValue,
                superclassCall:
                    
                    super.currentManaPoints = newValue
                    ,
                defaultCall: __defaultImplStub!.currentManaPoints = newValue)
        }
        
    }
    
    
    
     override var totalManaPoints: Int {
        get {
            return cuckoo_manager.getter("totalManaPoints",
                superclassCall:
                    
                    super.totalManaPoints
                    ,
                defaultCall: __defaultImplStub!.totalManaPoints)
        }
        
    }
    
    
    
     override var size: CGSize {
        get {
            return cuckoo_manager.getter("size",
                superclassCall:
                    
                    super.size
                    ,
                defaultCall: __defaultImplStub!.size)
        }
        
        set {
            cuckoo_manager.setter("size",
                value: newValue,
                superclassCall:
                    
                    super.size = newValue
                    ,
                defaultCall: __defaultImplStub!.size = newValue)
        }
        
    }
    
    
    
     override var manaColor: UIColor {
        get {
            return cuckoo_manager.getter("manaColor",
                superclassCall:
                    
                    super.manaColor
                    ,
                defaultCall: __defaultImplStub!.manaColor)
        }
        
        set {
            cuckoo_manager.setter("manaColor",
                value: newValue,
                superclassCall:
                    
                    super.manaColor = newValue
                    ,
                defaultCall: __defaultImplStub!.manaColor = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ManaBarNode: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var numManaUnits: Cuckoo.ClassToBeStubbedProperty<MockManaBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "numManaUnits")
	    }
	    
	    
	    var manaPointsPerUnit: Cuckoo.ClassToBeStubbedProperty<MockManaBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "manaPointsPerUnit")
	    }
	    
	    
	    var currentManaPoints: Cuckoo.ClassToBeStubbedProperty<MockManaBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "currentManaPoints")
	    }
	    
	    
	    var totalManaPoints: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockManaBarNode, Int> {
	        return .init(manager: cuckoo_manager, name: "totalManaPoints")
	    }
	    
	    
	    var size: Cuckoo.ClassToBeStubbedProperty<MockManaBarNode, CGSize> {
	        return .init(manager: cuckoo_manager, name: "size")
	    }
	    
	    
	    var manaColor: Cuckoo.ClassToBeStubbedProperty<MockManaBarNode, UIColor> {
	        return .init(manager: cuckoo_manager, name: "manaColor")
	    }
	    
	    
	}

	 struct __VerificationProxy_ManaBarNode: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var numManaUnits: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "numManaUnits", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var manaPointsPerUnit: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "manaPointsPerUnit", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var currentManaPoints: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "currentManaPoints", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var totalManaPoints: Cuckoo.VerifyReadOnlyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "totalManaPoints", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var size: Cuckoo.VerifyProperty<CGSize> {
	        return .init(manager: cuckoo_manager, name: "size", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var manaColor: Cuckoo.VerifyProperty<UIColor> {
	        return .init(manager: cuckoo_manager, name: "manaColor", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ManaBarNodeStub: ManaBarNode {
    
    
     override var numManaUnits: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var manaPointsPerUnit: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var currentManaPoints: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var totalManaPoints: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
    }
    
    
     override var size: CGSize {
        get {
            return DefaultValueRegistry.defaultValue(for: (CGSize).self)
        }
        
        set { }
        
    }
    
    
     override var manaColor: UIColor {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIColor).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/GestureComponent.swift at 2020-03-27 17:02:51 +0000

//
//  GestureComponent.swift
//  GameOfRunes
//
//  Created by Andy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockGestureComponent: GestureComponent, Cuckoo.ClassMock {
    
     typealias MocksType = GestureComponent
    
     typealias Stubbing = __StubbingProxy_GestureComponent
     typealias Verification = __VerificationProxy_GestureComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GestureComponent?

     func enableDefaultImplementation(_ stub: GestureComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_GestureComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGestureComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_GestureComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class GestureComponentStub: GestureComponent {
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/HealthComponent.swift at 2020-03-27 17:02:51 +0000

//
//  HealthComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockHealthComponent: HealthComponent, Cuckoo.ClassMock {
    
     typealias MocksType = HealthComponent
    
     typealias Stubbing = __StubbingProxy_HealthComponent
     typealias Verification = __VerificationProxy_HealthComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HealthComponent?

     func enableDefaultImplementation(_ stub: HealthComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var healthPoints: Int {
        get {
            return cuckoo_manager.getter("healthPoints",
                superclassCall:
                    
                    super.healthPoints
                    ,
                defaultCall: __defaultImplStub!.healthPoints)
        }
        
        set {
            cuckoo_manager.setter("healthPoints",
                value: newValue,
                superclassCall:
                    
                    super.healthPoints = newValue
                    ,
                defaultCall: __defaultImplStub!.healthPoints = newValue)
        }
        
    }
    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_HealthComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var healthPoints: Cuckoo.ClassToBeStubbedProperty<MockHealthComponent, Int> {
	        return .init(manager: cuckoo_manager, name: "healthPoints")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockHealthComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_HealthComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var healthPoints: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "healthPoints", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class HealthComponentStub: HealthComponent {
    
    
     override var healthPoints: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/ManaComponent.swift at 2020-03-27 17:02:51 +0000

//
//  ManaComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockManaComponent: ManaComponent, Cuckoo.ClassMock {
    
     typealias MocksType = ManaComponent
    
     typealias Stubbing = __StubbingProxy_ManaComponent
     typealias Verification = __VerificationProxy_ManaComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ManaComponent?

     func enableDefaultImplementation(_ stub: ManaComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var manaPoints: Int {
        get {
            return cuckoo_manager.getter("manaPoints",
                superclassCall:
                    
                    super.manaPoints
                    ,
                defaultCall: __defaultImplStub!.manaPoints)
        }
        
        set {
            cuckoo_manager.setter("manaPoints",
                value: newValue,
                superclassCall:
                    
                    super.manaPoints = newValue
                    ,
                defaultCall: __defaultImplStub!.manaPoints = newValue)
        }
        
    }
    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ManaComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var manaPoints: Cuckoo.ClassToBeStubbedProperty<MockManaComponent, Int> {
	        return .init(manager: cuckoo_manager, name: "manaPoints")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockManaComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_ManaComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var manaPoints: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "manaPoints", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ManaComponentStub: ManaComponent {
    
    
     override var manaPoints: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/MoveComponent/MoveBehavior.swift at 2020-03-27 17:02:51 +0000

//
//  MoveBehavior.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockMoveBehavior: MoveBehavior, Cuckoo.ClassMock {
    
     typealias MocksType = MoveBehavior
    
     typealias Stubbing = __StubbingProxy_MoveBehavior
     typealias Verification = __VerificationProxy_MoveBehavior

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MoveBehavior?

     func enableDefaultImplementation(_ stub: MoveBehavior) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_MoveBehavior: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_MoveBehavior: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class MoveBehaviorStub: MoveBehavior {
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/MoveComponent/MoveComponent.swift at 2020-03-27 17:02:51 +0000

//
//  MoveComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockMoveComponent: MoveComponent, Cuckoo.ClassMock {
    
     typealias MocksType = MoveComponent
    
     typealias Stubbing = __StubbingProxy_MoveComponent
     typealias Verification = __VerificationProxy_MoveComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MoveComponent?

     func enableDefaultImplementation(_ stub: MoveComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    
    
    
     override var activePauses: Int {
        get {
            return cuckoo_manager.getter("activePauses",
                superclassCall:
                    
                    super.activePauses
                    ,
                defaultCall: __defaultImplStub!.activePauses)
        }
        
        set {
            cuckoo_manager.setter("activePauses",
                value: newValue,
                superclassCall:
                    
                    super.activePauses = newValue
                    ,
                defaultCall: __defaultImplStub!.activePauses = newValue)
        }
        
    }
    

    

    
    
    
     override func willRemoveFromEntity()  {
        
    return cuckoo_manager.call("willRemoveFromEntity()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.willRemoveFromEntity()
                ,
            defaultCall: __defaultImplStub!.willRemoveFromEntity())
        
    }
    
    
    
     override func agentWillUpdate(_ agent: GKAgent)  {
        
    return cuckoo_manager.call("agentWillUpdate(_: GKAgent)",
            parameters: (agent),
            escapingParameters: (agent),
            superclassCall:
                
                super.agentWillUpdate(agent)
                ,
            defaultCall: __defaultImplStub!.agentWillUpdate(agent))
        
    }
    
    
    
     override func agentDidUpdate(_ agent: GKAgent)  {
        
    return cuckoo_manager.call("agentDidUpdate(_: GKAgent)",
            parameters: (agent),
            escapingParameters: (agent),
            superclassCall:
                
                super.agentDidUpdate(agent)
                ,
            defaultCall: __defaultImplStub!.agentDidUpdate(agent))
        
    }
    

	 struct __StubbingProxy_MoveComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockMoveComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	    var activePauses: Cuckoo.ClassToBeStubbedProperty<MockMoveComponent, Int> {
	        return .init(manager: cuckoo_manager, name: "activePauses")
	    }
	    
	    
	    func willRemoveFromEntity() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockMoveComponent.self, method: "willRemoveFromEntity()", parameterMatchers: matchers))
	    }
	    
	    func agentWillUpdate<M1: Cuckoo.Matchable>(_ agent: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKAgent)> where M1.MatchedType == GKAgent {
	        let matchers: [Cuckoo.ParameterMatcher<(GKAgent)>] = [wrap(matchable: agent) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoveComponent.self, method: "agentWillUpdate(_: GKAgent)", parameterMatchers: matchers))
	    }
	    
	    func agentDidUpdate<M1: Cuckoo.Matchable>(_ agent: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKAgent)> where M1.MatchedType == GKAgent {
	        let matchers: [Cuckoo.ParameterMatcher<(GKAgent)>] = [wrap(matchable: agent) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoveComponent.self, method: "agentDidUpdate(_: GKAgent)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MoveComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var activePauses: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "activePauses", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func willRemoveFromEntity() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("willRemoveFromEntity()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func agentWillUpdate<M1: Cuckoo.Matchable>(_ agent: M1) -> Cuckoo.__DoNotUse<(GKAgent), Void> where M1.MatchedType == GKAgent {
	        let matchers: [Cuckoo.ParameterMatcher<(GKAgent)>] = [wrap(matchable: agent) { $0 }]
	        return cuckoo_manager.verify("agentWillUpdate(_: GKAgent)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func agentDidUpdate<M1: Cuckoo.Matchable>(_ agent: M1) -> Cuckoo.__DoNotUse<(GKAgent), Void> where M1.MatchedType == GKAgent {
	        let matchers: [Cuckoo.ParameterMatcher<(GKAgent)>] = [wrap(matchable: agent) { $0 }]
	        return cuckoo_manager.verify("agentDidUpdate(_: GKAgent)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MoveComponentStub: MoveComponent {
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    
    
     override var activePauses: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    

    

    
     override func willRemoveFromEntity()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func agentWillUpdate(_ agent: GKAgent)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func agentDidUpdate(_ agent: GKAgent)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/SpriteComponent.swift at 2020-03-27 17:02:51 +0000

//
//  SpriteComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockSpriteComponent: SpriteComponent, Cuckoo.ClassMock {
    
     typealias MocksType = SpriteComponent
    
     typealias Stubbing = __StubbingProxy_SpriteComponent
     typealias Verification = __VerificationProxy_SpriteComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SpriteComponent?

     func enableDefaultImplementation(_ stub: SpriteComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    
    
    
     override var activePauses: Int {
        get {
            return cuckoo_manager.getter("activePauses",
                superclassCall:
                    
                    super.activePauses
                    ,
                defaultCall: __defaultImplStub!.activePauses)
        }
        
        set {
            cuckoo_manager.setter("activePauses",
                value: newValue,
                superclassCall:
                    
                    super.activePauses = newValue
                    ,
                defaultCall: __defaultImplStub!.activePauses = newValue)
        }
        
    }
    
    
    
     override var layerType: SpriteLayerType {
        get {
            return cuckoo_manager.getter("layerType",
                superclassCall:
                    
                    super.layerType
                    ,
                defaultCall: __defaultImplStub!.layerType)
        }
        
        set {
            cuckoo_manager.setter("layerType",
                value: newValue,
                superclassCall:
                    
                    super.layerType = newValue
                    ,
                defaultCall: __defaultImplStub!.layerType = newValue)
        }
        
    }
    

    

    
    
    
     override func setGestureConstraint(referenceNode: SKSpriteNode)  {
        
    return cuckoo_manager.call("setGestureConstraint(referenceNode: SKSpriteNode)",
            parameters: (referenceNode),
            escapingParameters: (referenceNode),
            superclassCall:
                
                super.setGestureConstraint(referenceNode: referenceNode)
                ,
            defaultCall: __defaultImplStub!.setGestureConstraint(referenceNode: referenceNode))
        
    }
    

	 struct __StubbingProxy_SpriteComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockSpriteComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	    var activePauses: Cuckoo.ClassToBeStubbedProperty<MockSpriteComponent, Int> {
	        return .init(manager: cuckoo_manager, name: "activePauses")
	    }
	    
	    
	    var layerType: Cuckoo.ClassToBeStubbedProperty<MockSpriteComponent, SpriteLayerType> {
	        return .init(manager: cuckoo_manager, name: "layerType")
	    }
	    
	    
	    func setGestureConstraint<M1: Cuckoo.Matchable>(referenceNode: M1) -> Cuckoo.ClassStubNoReturnFunction<(SKSpriteNode)> where M1.MatchedType == SKSpriteNode {
	        let matchers: [Cuckoo.ParameterMatcher<(SKSpriteNode)>] = [wrap(matchable: referenceNode) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteComponent.self, method: "setGestureConstraint(referenceNode: SKSpriteNode)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SpriteComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var activePauses: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "activePauses", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var layerType: Cuckoo.VerifyProperty<SpriteLayerType> {
	        return .init(manager: cuckoo_manager, name: "layerType", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setGestureConstraint<M1: Cuckoo.Matchable>(referenceNode: M1) -> Cuckoo.__DoNotUse<(SKSpriteNode), Void> where M1.MatchedType == SKSpriteNode {
	        let matchers: [Cuckoo.ParameterMatcher<(SKSpriteNode)>] = [wrap(matchable: referenceNode) { $0 }]
	        return cuckoo_manager.verify("setGestureConstraint(referenceNode: SKSpriteNode)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SpriteComponentStub: SpriteComponent {
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    
    
     override var activePauses: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var layerType: SpriteLayerType {
        get {
            return DefaultValueRegistry.defaultValue(for: (SpriteLayerType).self)
        }
        
        set { }
        
    }
    

    

    
     override func setGestureConstraint(referenceNode: SKSpriteNode)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/TeamComponent.swift at 2020-03-27 17:02:51 +0000

//
//  TeamComponent.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockTeamComponent: TeamComponent, Cuckoo.ClassMock {
    
     typealias MocksType = TeamComponent
    
     typealias Stubbing = __StubbingProxy_TeamComponent
     typealias Verification = __VerificationProxy_TeamComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TeamComponent?

     func enableDefaultImplementation(_ stub: TeamComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_TeamComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockTeamComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_TeamComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class TeamComponentStub: TeamComponent {
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/TimerComponent.swift at 2020-03-27 17:02:51 +0000

//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockTimerComponent: TimerComponent, Cuckoo.ClassMock {
    
     typealias MocksType = TimerComponent
    
     typealias Stubbing = __StubbingProxy_TimerComponent
     typealias Verification = __VerificationProxy_TimerComponent

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TimerComponent?

     func enableDefaultImplementation(_ stub: TimerComponent) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var lastUpdatedTime: TimeInterval {
        get {
            return cuckoo_manager.getter("lastUpdatedTime",
                superclassCall:
                    
                    super.lastUpdatedTime
                    ,
                defaultCall: __defaultImplStub!.lastUpdatedTime)
        }
        
        set {
            cuckoo_manager.setter("lastUpdatedTime",
                value: newValue,
                superclassCall:
                    
                    super.lastUpdatedTime = newValue
                    ,
                defaultCall: __defaultImplStub!.lastUpdatedTime = newValue)
        }
        
    }
    
    
    
     override var currentTime: Int {
        get {
            return cuckoo_manager.getter("currentTime",
                superclassCall:
                    
                    super.currentTime
                    ,
                defaultCall: __defaultImplStub!.currentTime)
        }
        
        set {
            cuckoo_manager.setter("currentTime",
                value: newValue,
                superclassCall:
                    
                    super.currentTime = newValue
                    ,
                defaultCall: __defaultImplStub!.currentTime = newValue)
        }
        
    }
    
    
    
     override var type: ComponentType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_TimerComponent: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var lastUpdatedTime: Cuckoo.ClassToBeStubbedProperty<MockTimerComponent, TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "lastUpdatedTime")
	    }
	    
	    
	    var currentTime: Cuckoo.ClassToBeStubbedProperty<MockTimerComponent, Int> {
	        return .init(manager: cuckoo_manager, name: "currentTime")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockTimerComponent, ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_TimerComponent: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var lastUpdatedTime: Cuckoo.VerifyProperty<TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "lastUpdatedTime", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var currentTime: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "currentTime", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class TimerComponentStub: TimerComponent {
    
    
     override var lastUpdatedTime: TimeInterval {
        get {
            return DefaultValueRegistry.defaultValue(for: (TimeInterval).self)
        }
        
        set { }
        
    }
    
    
     override var currentTime: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/DroppedManaEntity.swift at 2020-03-27 17:02:51 +0000

//
//  DroppedManaEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 15/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockDroppedManaEntity: DroppedManaEntity, Cuckoo.ClassMock {
    
     typealias MocksType = DroppedManaEntity
    
     typealias Stubbing = __StubbingProxy_DroppedManaEntity
     typealias Verification = __VerificationProxy_DroppedManaEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: DroppedManaEntity?

     func enableDefaultImplementation(_ stub: DroppedManaEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_DroppedManaEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockDroppedManaEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_DroppedManaEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class DroppedManaEntityStub: DroppedManaEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/EndPointEntity.swift at 2020-03-27 17:02:51 +0000

//
//  EndPointEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 9/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockEndPointEntity: EndPointEntity, Cuckoo.ClassMock {
    
     typealias MocksType = EndPointEntity
    
     typealias Stubbing = __StubbingProxy_EndPointEntity
     typealias Verification = __VerificationProxy_EndPointEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: EndPointEntity?

     func enableDefaultImplementation(_ stub: EndPointEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_EndPointEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockEndPointEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_EndPointEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class EndPointEntityStub: EndPointEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/EnemyEntity.swift at 2020-03-27 17:02:51 +0000

//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockEnemyEntity: EnemyEntity, Cuckoo.ClassMock {
    
     typealias MocksType = EnemyEntity
    
     typealias Stubbing = __StubbingProxy_EnemyEntity
     typealias Verification = __VerificationProxy_EnemyEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: EnemyEntity?

     func enableDefaultImplementation(_ stub: EnemyEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var gestureEntity: GestureEntity? {
        get {
            return cuckoo_manager.getter("gestureEntity",
                superclassCall:
                    
                    super.gestureEntity
                    ,
                defaultCall: __defaultImplStub!.gestureEntity)
        }
        
    }
    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    
    
    
     override func setCurrentGesture()  {
        
    return cuckoo_manager.call("setCurrentGesture()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.setCurrentGesture()
                ,
            defaultCall: __defaultImplStub!.setCurrentGesture())
        
    }
    
    
    
     override func removeGesture() -> Bool {
        
    return cuckoo_manager.call("removeGesture() -> Bool",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.removeGesture()
                ,
            defaultCall: __defaultImplStub!.removeGesture())
        
    }
    

	 struct __StubbingProxy_EnemyEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var gestureEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockEnemyEntity, GestureEntity?> {
	        return .init(manager: cuckoo_manager, name: "gestureEntity")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockEnemyEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	    func setCurrentGesture() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockEnemyEntity.self, method: "setCurrentGesture()", parameterMatchers: matchers))
	    }
	    
	    func removeGesture() -> Cuckoo.ClassStubFunction<(), Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockEnemyEntity.self, method: "removeGesture() -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_EnemyEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var gestureEntity: Cuckoo.VerifyReadOnlyProperty<GestureEntity?> {
	        return .init(manager: cuckoo_manager, name: "gestureEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func setCurrentGesture() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("setCurrentGesture()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeGesture() -> Cuckoo.__DoNotUse<(), Bool> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("removeGesture() -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class EnemyEntityStub: EnemyEntity {
    
    
     override var gestureEntity: GestureEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GestureEntity?).self)
        }
        
    }
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
     override func setCurrentGesture()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeGesture() -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/GestureEntity.swift at 2020-03-27 17:02:51 +0000

//
//  GestureEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGestureEntity: GestureEntity, Cuckoo.ClassMock {
    
     typealias MocksType = GestureEntity
    
     typealias Stubbing = __StubbingProxy_GestureEntity
     typealias Verification = __VerificationProxy_GestureEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GestureEntity?

     func enableDefaultImplementation(_ stub: GestureEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var parentEntity: GKEntity? {
        get {
            return cuckoo_manager.getter("parentEntity",
                superclassCall:
                    
                    super.parentEntity
                    ,
                defaultCall: __defaultImplStub!.parentEntity)
        }
        
        set {
            cuckoo_manager.setter("parentEntity",
                value: newValue,
                superclassCall:
                    
                    super.parentEntity = newValue
                    ,
                defaultCall: __defaultImplStub!.parentEntity = newValue)
        }
        
    }
    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_GestureEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var parentEntity: Cuckoo.ClassToBeStubbedOptionalProperty<MockGestureEntity, GKEntity> {
	        return .init(manager: cuckoo_manager, name: "parentEntity")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGestureEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_GestureEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var parentEntity: Cuckoo.VerifyOptionalProperty<GKEntity> {
	        return .init(manager: cuckoo_manager, name: "parentEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class GestureEntityStub: GestureEntity {
    
    
     override var parentEntity: GKEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GKEntity?).self)
        }
        
        set { }
        
    }
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PlayerEntity.swift at 2020-03-27 17:02:51 +0000

//
//  PlayerEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 27/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockPlayerEntity: PlayerEntity, Cuckoo.ClassMock {
    
     typealias MocksType = PlayerEntity
    
     typealias Stubbing = __StubbingProxy_PlayerEntity
     typealias Verification = __VerificationProxy_PlayerEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PlayerEntity?

     func enableDefaultImplementation(_ stub: PlayerEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_PlayerEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockPlayerEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_PlayerEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class PlayerEntityStub: PlayerEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/DarkVortexPowerUpEntity.swift at 2020-03-27 17:02:51 +0000

//
//  DarkVortexPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Brian Yen on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockDarkVortexPowerUpEntity: DarkVortexPowerUpEntity, Cuckoo.ClassMock {
    
     typealias MocksType = DarkVortexPowerUpEntity
    
     typealias Stubbing = __StubbingProxy_DarkVortexPowerUpEntity
     typealias Verification = __VerificationProxy_DarkVortexPowerUpEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: DarkVortexPowerUpEntity?

     func enableDefaultImplementation(_ stub: DarkVortexPowerUpEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var powerUpType: PowerUpType {
        get {
            return cuckoo_manager.getter("powerUpType",
                superclassCall:
                    
                    super.powerUpType
                    ,
                defaultCall: __defaultImplStub!.powerUpType)
        }
        
    }
    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_DarkVortexPowerUpEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var powerUpType: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockDarkVortexPowerUpEntity, PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockDarkVortexPowerUpEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_DarkVortexPowerUpEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var powerUpType: Cuckoo.VerifyReadOnlyProperty<PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class DarkVortexPowerUpEntityStub: DarkVortexPowerUpEntity {
    
    
     override var powerUpType: PowerUpType {
        get {
            return DefaultValueRegistry.defaultValue(for: (PowerUpType).self)
        }
        
    }
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/HellfirePowerUpEntity.swift at 2020-03-27 17:02:51 +0000

//
//  HellfireEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockHellfirePowerUpEntity: HellfirePowerUpEntity, Cuckoo.ClassMock {
    
     typealias MocksType = HellfirePowerUpEntity
    
     typealias Stubbing = __StubbingProxy_HellfirePowerUpEntity
     typealias Verification = __VerificationProxy_HellfirePowerUpEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HellfirePowerUpEntity?

     func enableDefaultImplementation(_ stub: HellfirePowerUpEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var powerUpType: PowerUpType {
        get {
            return cuckoo_manager.getter("powerUpType",
                superclassCall:
                    
                    super.powerUpType
                    ,
                defaultCall: __defaultImplStub!.powerUpType)
        }
        
    }
    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_HellfirePowerUpEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var powerUpType: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockHellfirePowerUpEntity, PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockHellfirePowerUpEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_HellfirePowerUpEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var powerUpType: Cuckoo.VerifyReadOnlyProperty<PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class HellfirePowerUpEntityStub: HellfirePowerUpEntity {
    
    
     override var powerUpType: PowerUpType {
        get {
            return DefaultValueRegistry.defaultValue(for: (PowerUpType).self)
        }
        
    }
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/IcePrisonPowerUpEntity.swift at 2020-03-27 17:02:51 +0000

//
//  IcePrisonPowerUpEntity.swift
//  GameOfRunes
//
//  Created by Andy on 19/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit
import SpriteKit


 class MockIcePrisonPowerUpEntity: IcePrisonPowerUpEntity, Cuckoo.ClassMock {
    
     typealias MocksType = IcePrisonPowerUpEntity
    
     typealias Stubbing = __StubbingProxy_IcePrisonPowerUpEntity
     typealias Verification = __VerificationProxy_IcePrisonPowerUpEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: IcePrisonPowerUpEntity?

     func enableDefaultImplementation(_ stub: IcePrisonPowerUpEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var powerUpType: PowerUpType {
        get {
            return cuckoo_manager.getter("powerUpType",
                superclassCall:
                    
                    super.powerUpType
                    ,
                defaultCall: __defaultImplStub!.powerUpType)
        }
        
    }
    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_IcePrisonPowerUpEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var powerUpType: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockIcePrisonPowerUpEntity, PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType")
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockIcePrisonPowerUpEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_IcePrisonPowerUpEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var powerUpType: Cuckoo.VerifyReadOnlyProperty<PowerUpType> {
	        return .init(manager: cuckoo_manager, name: "powerUpType", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class IcePrisonPowerUpEntityStub: IcePrisonPowerUpEntity {
    
    
     override var powerUpType: PowerUpType {
        get {
            return DefaultValueRegistry.defaultValue(for: (PowerUpType).self)
        }
        
    }
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/TimerEntity.swift at 2020-03-27 17:02:51 +0000

//
//  TimerEntity.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockTimerEntity: TimerEntity, Cuckoo.ClassMock {
    
     typealias MocksType = TimerEntity
    
     typealias Stubbing = __StubbingProxy_TimerEntity
     typealias Verification = __VerificationProxy_TimerEntity

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TimerEntity?

     func enableDefaultImplementation(_ stub: TimerEntity) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_TimerEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockTimerEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
	    }
	    
	    
	}

	 struct __VerificationProxy_TimerEntity: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class TimerEntityStub: TimerEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/GameEngine.swift at 2020-03-27 17:02:51 +0000

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
    

    
    
    
     override var metadata: GameMetaData {
        get {
            return cuckoo_manager.getter("metadata",
                superclassCall:
                    
                    super.metadata
                    ,
                defaultCall: __defaultImplStub!.metadata)
        }
        
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
    
    
    
     override var playerEntity: PlayerEntity? {
        get {
            return cuckoo_manager.getter("playerEntity",
                superclassCall:
                    
                    super.playerEntity
                    ,
                defaultCall: __defaultImplStub!.playerEntity)
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
	    
	    
	    var metadata: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, GameMetaData> {
	        return .init(manager: cuckoo_manager, name: "metadata")
	    }
	    
	    
	    var gameScene: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameEngine, GameScene> {
	        return .init(manager: cuckoo_manager, name: "gameScene")
	    }
	    
	    
	    var playerEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, PlayerEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerEntity")
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
	
	    
	    
	    var metadata: Cuckoo.VerifyReadOnlyProperty<GameMetaData> {
	        return .init(manager: cuckoo_manager, name: "metadata", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var gameScene: Cuckoo.VerifyOptionalProperty<GameScene> {
	        return .init(manager: cuckoo_manager, name: "gameScene", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerEntity: Cuckoo.VerifyReadOnlyProperty<PlayerEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
    
    
     override var metadata: GameMetaData {
        get {
            return DefaultValueRegistry.defaultValue(for: (GameMetaData).self)
        }
        
    }
    
    
     override var gameScene: GameScene? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GameScene?).self)
        }
        
        set { }
        
    }
    
    
     override var playerEntity: PlayerEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerEntity?).self)
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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/RemoveDelegate.swift at 2020-03-27 17:02:51 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/SystemDelegate.swift at 2020-03-27 17:02:51 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/HealthSystem.swift at 2020-03-27 17:02:51 +0000

//
//  HealthSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockHealthSystem: HealthSystem, Cuckoo.ClassMock {
    
     typealias MocksType = HealthSystem
    
     typealias Stubbing = __StubbingProxy_HealthSystem
     typealias Verification = __VerificationProxy_HealthSystem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HealthSystem?

     func enableDefaultImplementation(_ stub: HealthSystem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
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
    
    
    
     override func removeComponent(_ component: Component)  {
        
    return cuckoo_manager.call("removeComponent(_: Component)",
            parameters: (component),
            escapingParameters: (component),
            superclassCall:
                
                super.removeComponent(component)
                ,
            defaultCall: __defaultImplStub!.removeComponent(component))
        
    }
    

	 struct __StubbingProxy_HealthSystem: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHealthSystem.self, method: "minusHealthPoints(for: GKEntity) -> Int?", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHealthSystem.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HealthSystem: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("minusHealthPoints(for: GKEntity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HealthSystemStub: HealthSystem {
    

    

    
     override func minusHealthPoints(for entity: GKEntity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/ManaSystem.swift at 2020-03-27 17:02:51 +0000

//
//  ManaSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockManaSystem: ManaSystem, Cuckoo.ClassMock {
    
     typealias MocksType = ManaSystem
    
     typealias Stubbing = __StubbingProxy_ManaSystem
     typealias Verification = __VerificationProxy_ManaSystem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ManaSystem?

     func enableDefaultImplementation(_ stub: ManaSystem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
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
    
    
    
     override func increaseMana(by manaPoints: Int, for entity: GKEntity)  {
        
    return cuckoo_manager.call("increaseMana(by: Int, for: GKEntity)",
            parameters: (manaPoints, entity),
            escapingParameters: (manaPoints, entity),
            superclassCall:
                
                super.increaseMana(by: manaPoints, for: entity)
                ,
            defaultCall: __defaultImplStub!.increaseMana(by: manaPoints, for: entity))
        
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
    

	 struct __StubbingProxy_ManaSystem: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockManaSystem.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	    func increaseMana<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(by manaPoints: M1, for entity: M2) -> Cuckoo.ClassStubNoReturnFunction<(Int, GKEntity)> where M1.MatchedType == Int, M2.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, GKEntity)>] = [wrap(matchable: manaPoints) { $0.0 }, wrap(matchable: entity) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockManaSystem.self, method: "increaseMana(by: Int, for: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func getMana<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockManaSystem.self, method: "getMana(for: GKEntity) -> Int?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ManaSystem: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func increaseMana<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(by manaPoints: M1, for entity: M2) -> Cuckoo.__DoNotUse<(Int, GKEntity), Void> where M1.MatchedType == Int, M2.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, GKEntity)>] = [wrap(matchable: manaPoints) { $0.0 }, wrap(matchable: entity) { $0.1 }]
	        return cuckoo_manager.verify("increaseMana(by: Int, for: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getMana<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Int?> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("getMana(for: GKEntity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ManaSystemStub: ManaSystem {
    

    

    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func increaseMana(by manaPoints: Int, for entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func getMana(for entity: GKEntity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/MoveSystem.swift at 2020-03-27 17:02:51 +0000

//
//  MoveSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockMoveSystem: MoveSystem, Cuckoo.ClassMock {
    
     typealias MocksType = MoveSystem
    
     typealias Stubbing = __StubbingProxy_MoveSystem
     typealias Verification = __VerificationProxy_MoveSystem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: MoveSystem?

     func enableDefaultImplementation(_ stub: MoveSystem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func update(deltaTime seconds: TimeInterval)  {
        
    return cuckoo_manager.call("update(deltaTime: TimeInterval)",
            parameters: (seconds),
            escapingParameters: (seconds),
            superclassCall:
                
                super.update(deltaTime: seconds)
                ,
            defaultCall: __defaultImplStub!.update(deltaTime: seconds))
        
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
    

	 struct __StubbingProxy_MoveSystem: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func update<M1: Cuckoo.Matchable>(deltaTime seconds: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: seconds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoveSystem.self, method: "update(deltaTime: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockMoveSystem.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_MoveSystem: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(deltaTime seconds: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: seconds) { $0 }]
	        return cuckoo_manager.verify("update(deltaTime: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class MoveSystemStub: MoveSystem {
    

    

    
     override func update(deltaTime seconds: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/SpriteSystem.swift at 2020-03-27 17:02:51 +0000

//
//  SpriteSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 12/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockSpriteSystem: SpriteSystem, Cuckoo.ClassMock {
    
     typealias MocksType = SpriteSystem
    
     typealias Stubbing = __StubbingProxy_SpriteSystem
     typealias Verification = __VerificationProxy_SpriteSystem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SpriteSystem?

     func enableDefaultImplementation(_ stub: SpriteSystem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func addComponent(foundIn entity: GKEntity)  {
        
    return cuckoo_manager.call("addComponent(foundIn: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.addComponent(foundIn: entity)
                ,
            defaultCall: __defaultImplStub!.addComponent(foundIn: entity))
        
    }
    
    
    
     override func removeComponent(foundIn entity: GKEntity)  {
        
    return cuckoo_manager.call("removeComponent(foundIn: GKEntity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.removeComponent(foundIn: entity)
                ,
            defaultCall: __defaultImplStub!.removeComponent(foundIn: entity))
        
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
    
    
    
     override func stopAnimationForDuration(for entity: Entity, duration: TimeInterval, animationNodeKey: String)  {
        
    return cuckoo_manager.call("stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)",
            parameters: (entity, duration, animationNodeKey),
            escapingParameters: (entity, duration, animationNodeKey),
            superclassCall:
                
                super.stopAnimationForDuration(for: entity, duration: duration, animationNodeKey: animationNodeKey)
                ,
            defaultCall: __defaultImplStub!.stopAnimationForDuration(for: entity, duration: duration, animationNodeKey: animationNodeKey))
        
    }
    

	 struct __StubbingProxy_SpriteSystem: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func addComponent<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "addComponent(foundIn: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKEntity)> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "removeComponent(foundIn: GKEntity)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	    func stopAnimationForDuration<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.ClassStubNoReturnFunction<(Entity, TimeInterval, String)> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SpriteSystem: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func addComponent<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("addComponent(foundIn: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(foundIn entity: M1) -> Cuckoo.__DoNotUse<(GKEntity), Void> where M1.MatchedType == GKEntity {
	        let matchers: [Cuckoo.ParameterMatcher<(GKEntity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeComponent(foundIn: GKEntity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func stopAnimationForDuration<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(for entity: M1, duration: M2, animationNodeKey: M3) -> Cuckoo.__DoNotUse<(Entity, TimeInterval, String), Void> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: animationNodeKey) { $0.2 }]
	        return cuckoo_manager.verify("stopAnimationForDuration(for: Entity, duration: TimeInterval, animationNodeKey: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SpriteSystemStub: SpriteSystem {
    

    

    
     override func addComponent(foundIn entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(foundIn entity: GKEntity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func stopAnimationForDuration(for entity: Entity, duration: TimeInterval, animationNodeKey: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/TimerSystem.swift at 2020-03-27 17:02:51 +0000

//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Dong SiJi on 16/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockTimerSystem: TimerSystem, Cuckoo.ClassMock {
    
     typealias MocksType = TimerSystem
    
     typealias Stubbing = __StubbingProxy_TimerSystem
     typealias Verification = __VerificationProxy_TimerSystem

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: TimerSystem?

     func enableDefaultImplementation(_ stub: TimerSystem) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func update(deltaTime seconds: TimeInterval)  {
        
    return cuckoo_manager.call("update(deltaTime: TimeInterval)",
            parameters: (seconds),
            escapingParameters: (seconds),
            superclassCall:
                
                super.update(deltaTime: seconds)
                ,
            defaultCall: __defaultImplStub!.update(deltaTime: seconds))
        
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
    

	 struct __StubbingProxy_TimerSystem: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func update<M1: Cuckoo.Matchable>(deltaTime seconds: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: seconds) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTimerSystem.self, method: "update(deltaTime: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.ClassStubNoReturnFunction<(Component)> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTimerSystem.self, method: "removeComponent(_: Component)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_TimerSystem: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(deltaTime seconds: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: seconds) { $0 }]
	        return cuckoo_manager.verify("update(deltaTime: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class TimerSystemStub: TimerSystem {
    

    

    
     override func update(deltaTime seconds: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameEndState.swift at 2020-03-27 17:02:51 +0000

//
//  GameEndState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGameEndState: GameEndState, Cuckoo.ClassMock {
    
     typealias MocksType = GameEndState
    
     typealias Stubbing = __StubbingProxy_GameEndState
     typealias Verification = __VerificationProxy_GameEndState

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameEndState?

     func enableDefaultImplementation(_ stub: GameEndState) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var didWin: Bool {
        get {
            return cuckoo_manager.getter("didWin",
                superclassCall:
                    
                    super.didWin
                    ,
                defaultCall: __defaultImplStub!.didWin)
        }
        
        set {
            cuckoo_manager.setter("didWin",
                value: newValue,
                superclassCall:
                    
                    super.didWin = newValue
                    ,
                defaultCall: __defaultImplStub!.didWin = newValue)
        }
        
    }
    

    

    
    
    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
    return cuckoo_manager.call("isValidNextState(_: AnyClass) -> Bool",
            parameters: (stateClass),
            escapingParameters: (stateClass),
            superclassCall:
                
                super.isValidNextState(stateClass)
                ,
            defaultCall: __defaultImplStub!.isValidNextState(stateClass))
        
    }
    
    
    
     override func didEnter(from previousState: GKState?)  {
        
    return cuckoo_manager.call("didEnter(from: GKState?)",
            parameters: (previousState),
            escapingParameters: (previousState),
            superclassCall:
                
                super.didEnter(from: previousState)
                ,
            defaultCall: __defaultImplStub!.didEnter(from: previousState))
        
    }
    

	 struct __StubbingProxy_GameEndState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var didWin: Cuckoo.ClassToBeStubbedProperty<MockGameEndState, Bool> {
	        return .init(manager: cuckoo_manager, name: "didWin")
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEndState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEndState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameEndState: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var didWin: Cuckoo.VerifyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "didWin", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.__DoNotUse<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return cuckoo_manager.verify("isValidNextState(_: AnyClass) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.__DoNotUse<(GKState?), Void> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return cuckoo_manager.verify("didEnter(from: GKState?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameEndStateStub: GameEndState {
    
    
     override var didWin: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameInPlayState.swift at 2020-03-27 17:02:51 +0000

//
//  GameInPlayState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGameInPlayState: GameInPlayState, Cuckoo.ClassMock {
    
     typealias MocksType = GameInPlayState
    
     typealias Stubbing = __StubbingProxy_GameInPlayState
     typealias Verification = __VerificationProxy_GameInPlayState

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameInPlayState?

     func enableDefaultImplementation(_ stub: GameInPlayState) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
    return cuckoo_manager.call("isValidNextState(_: AnyClass) -> Bool",
            parameters: (stateClass),
            escapingParameters: (stateClass),
            superclassCall:
                
                super.isValidNextState(stateClass)
                ,
            defaultCall: __defaultImplStub!.isValidNextState(stateClass))
        
    }
    
    
    
     override func didEnter(from previousState: GKState?)  {
        
    return cuckoo_manager.call("didEnter(from: GKState?)",
            parameters: (previousState),
            escapingParameters: (previousState),
            superclassCall:
                
                super.didEnter(from: previousState)
                ,
            defaultCall: __defaultImplStub!.didEnter(from: previousState))
        
    }
    

	 struct __StubbingProxy_GameInPlayState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameInPlayState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameInPlayState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameInPlayState: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.__DoNotUse<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return cuckoo_manager.verify("isValidNextState(_: AnyClass) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.__DoNotUse<(GKState?), Void> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return cuckoo_manager.verify("didEnter(from: GKState?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameInPlayStateStub: GameInPlayState {
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GamePauseState.swift at 2020-03-27 17:02:51 +0000

//
//  GamePauseState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGamePauseState: GamePauseState, Cuckoo.ClassMock {
    
     typealias MocksType = GamePauseState
    
     typealias Stubbing = __StubbingProxy_GamePauseState
     typealias Verification = __VerificationProxy_GamePauseState

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GamePauseState?

     func enableDefaultImplementation(_ stub: GamePauseState) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
    return cuckoo_manager.call("isValidNextState(_: AnyClass) -> Bool",
            parameters: (stateClass),
            escapingParameters: (stateClass),
            superclassCall:
                
                super.isValidNextState(stateClass)
                ,
            defaultCall: __defaultImplStub!.isValidNextState(stateClass))
        
    }
    
    
    
     override func didEnter(from previousState: GKState?)  {
        
    return cuckoo_manager.call("didEnter(from: GKState?)",
            parameters: (previousState),
            escapingParameters: (previousState),
            superclassCall:
                
                super.didEnter(from: previousState)
                ,
            defaultCall: __defaultImplStub!.didEnter(from: previousState))
        
    }
    

	 struct __StubbingProxy_GamePauseState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGamePauseState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGamePauseState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GamePauseState: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.__DoNotUse<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return cuckoo_manager.verify("isValidNextState(_: AnyClass) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.__DoNotUse<(GKState?), Void> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return cuckoo_manager.verify("didEnter(from: GKState?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GamePauseStateStub: GamePauseState {
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameSelectionState.swift at 2020-03-27 17:02:51 +0000

//
//  GameSelectionState.swift
//  GameOfRunes
//
//  Created by Jermy on 28/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGameSelectionState: GameSelectionState, Cuckoo.ClassMock {
    
     typealias MocksType = GameSelectionState
    
     typealias Stubbing = __StubbingProxy_GameSelectionState
     typealias Verification = __VerificationProxy_GameSelectionState

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameSelectionState?

     func enableDefaultImplementation(_ stub: GameSelectionState) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
    return cuckoo_manager.call("isValidNextState(_: AnyClass) -> Bool",
            parameters: (stateClass),
            escapingParameters: (stateClass),
            superclassCall:
                
                super.isValidNextState(stateClass)
                ,
            defaultCall: __defaultImplStub!.isValidNextState(stateClass))
        
    }
    
    
    
     override func didEnter(from previousState: GKState?)  {
        
    return cuckoo_manager.call("didEnter(from: GKState?)",
            parameters: (previousState),
            escapingParameters: (previousState),
            superclassCall:
                
                super.didEnter(from: previousState)
                ,
            defaultCall: __defaultImplStub!.didEnter(from: previousState))
        
    }
    

	 struct __StubbingProxy_GameSelectionState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameSelectionState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameSelectionState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameSelectionState: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.__DoNotUse<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return cuckoo_manager.verify("isValidNextState(_: AnyClass) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.__DoNotUse<(GKState?), Void> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return cuckoo_manager.verify("didEnter(from: GKState?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameSelectionStateStub: GameSelectionState {
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameStartState.swift at 2020-03-27 17:02:51 +0000

//
//  GameStartState.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import GameplayKit


 class MockGameStartState: GameStartState, Cuckoo.ClassMock {
    
     typealias MocksType = GameStartState
    
     typealias Stubbing = __StubbingProxy_GameStartState
     typealias Verification = __VerificationProxy_GameStartState

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GameStartState?

     func enableDefaultImplementation(_ stub: GameStartState) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        
    return cuckoo_manager.call("isValidNextState(_: AnyClass) -> Bool",
            parameters: (stateClass),
            escapingParameters: (stateClass),
            superclassCall:
                
                super.isValidNextState(stateClass)
                ,
            defaultCall: __defaultImplStub!.isValidNextState(stateClass))
        
    }
    
    
    
     override func didEnter(from previousState: GKState?)  {
        
    return cuckoo_manager.call("didEnter(from: GKState?)",
            parameters: (previousState),
            escapingParameters: (previousState),
            superclassCall:
                
                super.didEnter(from: previousState)
                ,
            defaultCall: __defaultImplStub!.didEnter(from: previousState))
        
    }
    

	 struct __StubbingProxy_GameStartState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameStartState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameStartState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GameStartState: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.__DoNotUse<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return cuckoo_manager.verify("isValidNextState(_: AnyClass) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.__DoNotUse<(GKState?), Void> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return cuckoo_manager.verify("didEnter(from: GKState?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameStartStateStub: GameStartState {
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameStateMachine.swift at 2020-03-27 17:02:51 +0000

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
    

    

    

	 struct __StubbingProxy_GameStateMachine: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sceneManager: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameStateMachine, SceneManager> {
	        return .init(manager: cuckoo_manager, name: "sceneManager")
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
	    
	
	    
	}
}

 class GameStateMachineStub: GameStateMachine {
    
    
     override var sceneManager: SceneManager? {
        get {
            return DefaultValueRegistry.defaultValue(for: (SceneManager?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/Scenes/GameScene.swift at 2020-03-27 17:02:51 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/Scenes/SceneManager.swift at 2020-03-27 17:02:51 +0000

//
//  SceneManager.swift
//  GameOfRunes
//
//  Created by Brian Yen on 11/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

import SpriteKit


 class MockSceneManager: SceneManager, Cuckoo.ClassMock {
    
     typealias MocksType = SceneManager
    
     typealias Stubbing = __StubbingProxy_SceneManager
     typealias Verification = __VerificationProxy_SceneManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: SceneManager?

     func enableDefaultImplementation(_ stub: SceneManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func transitionToScene(sceneIdentifier: SceneIdentifier)  {
        
    return cuckoo_manager.call("transitionToScene(sceneIdentifier: SceneIdentifier)",
            parameters: (sceneIdentifier),
            escapingParameters: (sceneIdentifier),
            superclassCall:
                
                super.transitionToScene(sceneIdentifier: sceneIdentifier)
                ,
            defaultCall: __defaultImplStub!.transitionToScene(sceneIdentifier: sceneIdentifier))
        
    }
    
    
    
     override func restartGame()  {
        
    return cuckoo_manager.call("restartGame()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.restartGame()
                ,
            defaultCall: __defaultImplStub!.restartGame())
        
    }
    

	 struct __StubbingProxy_SceneManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func transitionToScene<M1: Cuckoo.Matchable>(sceneIdentifier: M1) -> Cuckoo.ClassStubNoReturnFunction<(SceneIdentifier)> where M1.MatchedType == SceneIdentifier {
	        let matchers: [Cuckoo.ParameterMatcher<(SceneIdentifier)>] = [wrap(matchable: sceneIdentifier) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSceneManager.self, method: "transitionToScene(sceneIdentifier: SceneIdentifier)", parameterMatchers: matchers))
	    }
	    
	    func restartGame() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSceneManager.self, method: "restartGame()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SceneManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func transitionToScene<M1: Cuckoo.Matchable>(sceneIdentifier: M1) -> Cuckoo.__DoNotUse<(SceneIdentifier), Void> where M1.MatchedType == SceneIdentifier {
	        let matchers: [Cuckoo.ParameterMatcher<(SceneIdentifier)>] = [wrap(matchable: sceneIdentifier) { $0 }]
	        return cuckoo_manager.verify("transitionToScene(sceneIdentifier: SceneIdentifier)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func restartGame() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("restartGame()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SceneManagerStub: SceneManager {
    

    

    
     override func transitionToScene(sceneIdentifier: SceneIdentifier)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func restartGame()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

