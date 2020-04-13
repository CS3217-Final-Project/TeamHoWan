// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/DroppedManaNode/DroppedManaNode.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/Player Area/HealthBarNode.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/Custom Nodes/Player Area/ManaBarNode.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/GestureComponent.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/HealthComponent.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/ManaComponent.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/MoveComponent/MoveBehavior.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/MoveComponent/MoveComponent.swift at 2020-04-13 11:39:26 +0000

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
    

    

    
     override func agentWillUpdate(_ agent: GKAgent)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func agentDidUpdate(_ agent: GKAgent)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/SpriteComponent.swift at 2020-04-13 11:39:26 +0000

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
    

    

    
     override func setGestureConstraint(referenceNode: SKSpriteNode)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/TeamComponent.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Components/TimerComponent.swift at 2020-04-13 11:39:26 +0000

//
//  TimerComponent.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
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
    

    
    
    
     override var time: TimeInterval {
        get {
            return cuckoo_manager.getter("time",
                superclassCall:
                    
                    super.time
                    ,
                defaultCall: __defaultImplStub!.time)
        }
        
        set {
            cuckoo_manager.setter("time",
                value: newValue,
                superclassCall:
                    
                    super.time = newValue
                    ,
                defaultCall: __defaultImplStub!.time = newValue)
        }
        
    }
    
    
    
     override var isCountDown: Bool {
        get {
            return cuckoo_manager.getter("isCountDown",
                superclassCall:
                    
                    super.isCountDown
                    ,
                defaultCall: __defaultImplStub!.isCountDown)
        }
        
        set {
            cuckoo_manager.setter("isCountDown",
                value: newValue,
                superclassCall:
                    
                    super.isCountDown = newValue
                    ,
                defaultCall: __defaultImplStub!.isCountDown = newValue)
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
	    
	    
	    var time: Cuckoo.ClassToBeStubbedProperty<MockTimerComponent, TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "time")
	    }
	    
	    
	    var isCountDown: Cuckoo.ClassToBeStubbedProperty<MockTimerComponent, Bool> {
	        return .init(manager: cuckoo_manager, name: "isCountDown")
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
	
	    
	    
	    var time: Cuckoo.VerifyProperty<TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "time", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var isCountDown: Cuckoo.VerifyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isCountDown", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<ComponentType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class TimerComponentStub: TimerComponent {
    
    
     override var time: TimeInterval {
        get {
            return DefaultValueRegistry.defaultValue(for: (TimeInterval).self)
        }
        
        set { }
        
    }
    
    
     override var isCountDown: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
        set { }
        
    }
    
    
     override var type: ComponentType {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComponentType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/DroppedManaEntity.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/EndPointEntity.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/EnemyEntity.swift at 2020-04-13 11:39:26 +0000

//
//  EnemyEntity.swift
//  GameOfRunes
//
//  Created by Jermy on 8/3/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import Cuckoo
@testable import GameOfRunes

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
    

    
    
    
     override var type: EntityType {
        get {
            return cuckoo_manager.getter("type",
                superclassCall:
                    
                    super.type
                    ,
                defaultCall: __defaultImplStub!.type)
        }
        
    }
    

    

    

	 struct __StubbingProxy_EnemyEntity: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var type: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockEnemyEntity, EntityType> {
	        return .init(manager: cuckoo_manager, name: "type")
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
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class EnemyEntityStub: EnemyEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/GestureEntity.swift at 2020-04-13 11:39:26 +0000

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
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class GestureEntityStub: GestureEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PlayerEntity.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/DarkVortexPowerUpEntity.swift at 2020-04-13 11:39:26 +0000

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
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class DarkVortexPowerUpEntityStub: DarkVortexPowerUpEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/HellfirePowerUpEntity.swift at 2020-04-13 11:39:26 +0000

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
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class HellfirePowerUpEntityStub: HellfirePowerUpEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/PowerUps/IcePrisonPowerUpEntity.swift at 2020-04-13 11:39:26 +0000

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
	
	    
	    
	    var type: Cuckoo.VerifyReadOnlyProperty<EntityType> {
	        return .init(manager: cuckoo_manager, name: "type", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class IcePrisonPowerUpEntityStub: IcePrisonPowerUpEntity {
    
    
     override var type: EntityType {
        get {
            return DefaultValueRegistry.defaultValue(for: (EntityType).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Entities/TimerEntity.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/GameEngine+SystemDelegate.swift at 2020-04-13 11:39:26 +0000

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

// MARK: - Mocks generated from file: GameOfRunes/GameEngine/GameEngine.swift at 2020-04-13 11:39:26 +0000

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
    

    
    
    
     override var systems: [ComponentType: System] {
        get {
            return cuckoo_manager.getter("systems",
                superclassCall:
                    
                    super.systems
                    ,
                defaultCall: __defaultImplStub!.systems)
        }
        
    }
    
    
    
     override var rootRenderNode: RootRenderNode? {
        get {
            return cuckoo_manager.getter("rootRenderNode",
                superclassCall:
                    
                    super.rootRenderNode
                    ,
                defaultCall: __defaultImplStub!.rootRenderNode)
        }
        
        set {
            cuckoo_manager.setter("rootRenderNode",
                value: newValue,
                superclassCall:
                    
                    super.rootRenderNode = newValue
                    ,
                defaultCall: __defaultImplStub!.rootRenderNode = newValue)
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
    
    
    
     override var comboEntity: ComboEntity? {
        get {
            return cuckoo_manager.getter("comboEntity",
                superclassCall:
                    
                    super.comboEntity
                    ,
                defaultCall: __defaultImplStub!.comboEntity)
        }
        
    }
    
    
    
     override var isDivineShieldActivated: Bool {
        get {
            return cuckoo_manager.getter("isDivineShieldActivated",
                superclassCall:
                    
                    super.isDivineShieldActivated
                    ,
                defaultCall: __defaultImplStub!.isDivineShieldActivated)
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
    
    
    
     override func addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)  {
        
    return cuckoo_manager.call("addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)",
            parameters: (healthNode, manaNode, scoreNode),
            escapingParameters: (healthNode, manaNode, scoreNode),
            superclassCall:
                
                super.addPlayerEntity(healthNode: healthNode, manaNode: manaNode, scoreNode: scoreNode)
                ,
            defaultCall: __defaultImplStub!.addPlayerEntity(healthNode: healthNode, manaNode: manaNode, scoreNode: scoreNode))
        
    }
    
    
    
     override func addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)  {
        
    return cuckoo_manager.call("addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)",
            parameters: (timerNode, initialTimerValue),
            escapingParameters: (timerNode, initialTimerValue),
            superclassCall:
                
                super.addTimerEntity(timerNode: timerNode, initialTimerValue: initialTimerValue)
                ,
            defaultCall: __defaultImplStub!.addTimerEntity(timerNode: timerNode, initialTimerValue: initialTimerValue))
        
    }
    
    
    
     override func addEndPointEntity(node: SKSpriteNode, team: Team)  {
        
    return cuckoo_manager.call("addEndPointEntity(node: SKSpriteNode, team: Team)",
            parameters: (node, team),
            escapingParameters: (node, team),
            superclassCall:
                
                super.addEndPointEntity(node: node, team: team)
                ,
            defaultCall: __defaultImplStub!.addEndPointEntity(node: node, team: team))
        
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
    
    
    
     override func update(with deltaTime: TimeInterval)  {
        
    return cuckoo_manager.call("update(with: TimeInterval)",
            parameters: (deltaTime),
            escapingParameters: (deltaTime),
            superclassCall:
                
                super.update(with: deltaTime)
                ,
            defaultCall: __defaultImplStub!.update(with: deltaTime))
        
    }
    
    
    
     override func startNextSpawnWave()  {
        
    return cuckoo_manager.call("startNextSpawnWave()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.startNextSpawnWave()
                ,
            defaultCall: __defaultImplStub!.startNextSpawnWave())
        
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
    
    
    
     override func addScore(by points: Int)  {
        
    return cuckoo_manager.call("addScore(by: Int)",
            parameters: (points),
            escapingParameters: (points),
            superclassCall:
                
                super.addScore(by: points)
                ,
            defaultCall: __defaultImplStub!.addScore(by: points))
        
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
    
    
    
     override func unitForceRemoved(_ entity: Entity)  {
        
    return cuckoo_manager.call("unitForceRemoved(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.unitForceRemoved(entity)
                ,
            defaultCall: __defaultImplStub!.unitForceRemoved(entity))
        
    }
    
    
    
     override func unitReachedLine(_ entity: Entity)  {
        
    return cuckoo_manager.call("unitReachedLine(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.unitReachedLine(entity)
                ,
            defaultCall: __defaultImplStub!.unitReachedLine(entity))
        
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
    
    
    
     override func incrementCombo()  {
        
    return cuckoo_manager.call("incrementCombo()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.incrementCombo()
                ,
            defaultCall: __defaultImplStub!.incrementCombo())
        
    }
    
    
    
     override func incrementMultiplier()  {
        
    return cuckoo_manager.call("incrementMultiplier()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.incrementMultiplier()
                ,
            defaultCall: __defaultImplStub!.incrementMultiplier())
        
    }
    
    
    
     override func endCombo()  {
        
    return cuckoo_manager.call("endCombo()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.endCombo()
                ,
            defaultCall: __defaultImplStub!.endCombo())
        
    }
    
    
    
     override func updateSelectedPowerUp(powerUpType: PowerUpType?)  {
        
    return cuckoo_manager.call("updateSelectedPowerUp(powerUpType: PowerUpType?)",
            parameters: (powerUpType),
            escapingParameters: (powerUpType),
            superclassCall:
                
                super.updateSelectedPowerUp(powerUpType: powerUpType)
                ,
            defaultCall: __defaultImplStub!.updateSelectedPowerUp(powerUpType: powerUpType))
        
    }
    
    
    
     override func activatePowerUp(at position: CGPoint, with size: CGSize?)  {
        
    return cuckoo_manager.call("activatePowerUp(at: CGPoint, with: CGSize?)",
            parameters: (position, size),
            escapingParameters: (position, size),
            superclassCall:
                
                super.activatePowerUp(at: position, with: size)
                ,
            defaultCall: __defaultImplStub!.activatePowerUp(at: position, with: size))
        
    }
    
    
    
     override func spawnPlayerUnitWave()  {
        
    return cuckoo_manager.call("spawnPlayerUnitWave()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.spawnPlayerUnitWave()
                ,
            defaultCall: __defaultImplStub!.spawnPlayerUnitWave())
        
    }
    
    
    
     override func activateInvincibleEndPoint()  {
        
    return cuckoo_manager.call("activateInvincibleEndPoint()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.activateInvincibleEndPoint()
                ,
            defaultCall: __defaultImplStub!.activateInvincibleEndPoint())
        
    }
    
    
    
     override func deactivateInvincibleEndPoint()  {
        
    return cuckoo_manager.call("deactivateInvincibleEndPoint()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.deactivateInvincibleEndPoint()
                ,
            defaultCall: __defaultImplStub!.deactivateInvincibleEndPoint())
        
    }
    

	 struct __StubbingProxy_GameEngine: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var systems: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, [ComponentType: System]> {
	        return .init(manager: cuckoo_manager, name: "systems")
	    }
	    
	    
	    var rootRenderNode: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameEngine, RootRenderNode> {
	        return .init(manager: cuckoo_manager, name: "rootRenderNode")
	    }
	    
	    
	    var playerEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, PlayerEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerEntity")
	    }
	    
	    
	    var comboEntity: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, ComboEntity?> {
	        return .init(manager: cuckoo_manager, name: "comboEntity")
	    }
	    
	    
	    var isDivineShieldActivated: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameEngine, Bool> {
	        return .init(manager: cuckoo_manager, name: "isDivineShieldActivated")
	    }
	    
	    
	    func add<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "add(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func addPlayerEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(healthNode: M1, manaNode: M2, scoreNode: M3) -> Cuckoo.ClassStubNoReturnFunction<(HealthBarNode, ManaBarNode, ScoreNode)> where M1.MatchedType == HealthBarNode, M2.MatchedType == ManaBarNode, M3.MatchedType == ScoreNode {
	        let matchers: [Cuckoo.ParameterMatcher<(HealthBarNode, ManaBarNode, ScoreNode)>] = [wrap(matchable: healthNode) { $0.0 }, wrap(matchable: manaNode) { $0.1 }, wrap(matchable: scoreNode) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)", parameterMatchers: matchers))
	    }
	    
	    func addTimerEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(timerNode: M1, initialTimerValue: M2) -> Cuckoo.ClassStubNoReturnFunction<(SKLabelNode, TimeInterval)> where M1.MatchedType == SKLabelNode, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(SKLabelNode, TimeInterval)>] = [wrap(matchable: timerNode) { $0.0 }, wrap(matchable: initialTimerValue) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func addEndPointEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(node: M1, team: M2) -> Cuckoo.ClassStubNoReturnFunction<(SKSpriteNode, Team)> where M1.MatchedType == SKSpriteNode, M2.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(SKSpriteNode, Team)>] = [wrap(matchable: node) { $0.0 }, wrap(matchable: team) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "addEndPointEntity(node: SKSpriteNode, team: Team)", parameterMatchers: matchers))
	    }
	    
	    func remove<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "remove(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable>(with deltaTime: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltaTime) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "update(with: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func startNextSpawnWave() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "startNextSpawnWave()", parameterMatchers: matchers))
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
	    
	    func addScore<M1: Cuckoo.Matchable>(by points: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: points) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "addScore(by: Int)", parameterMatchers: matchers))
	    }
	    
	    func gestureActivated<M1: Cuckoo.Matchable>(gesture: M1) -> Cuckoo.ClassStubNoReturnFunction<(CustomGesture)> where M1.MatchedType == CustomGesture {
	        let matchers: [Cuckoo.ParameterMatcher<(CustomGesture)>] = [wrap(matchable: gesture) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "gestureActivated(gesture: CustomGesture)", parameterMatchers: matchers))
	    }
	    
	    func unitForceRemoved<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "unitForceRemoved(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func unitReachedLine<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "unitReachedLine(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func increasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "increasePlayerMana(by: Int)", parameterMatchers: matchers))
	    }
	    
	    func decreasePlayerMana<M1: Cuckoo.Matchable>(by manaPoints: M1) -> Cuckoo.ClassStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: manaPoints) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "decreasePlayerMana(by: Int)", parameterMatchers: matchers))
	    }
	    
	    func incrementCombo() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "incrementCombo()", parameterMatchers: matchers))
	    }
	    
	    func incrementMultiplier() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "incrementMultiplier()", parameterMatchers: matchers))
	    }
	    
	    func endCombo() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "endCombo()", parameterMatchers: matchers))
	    }
	    
	    func updateSelectedPowerUp<M1: Cuckoo.OptionalMatchable>(powerUpType: M1) -> Cuckoo.ClassStubNoReturnFunction<(PowerUpType?)> where M1.OptionalMatchedType == PowerUpType {
	        let matchers: [Cuckoo.ParameterMatcher<(PowerUpType?)>] = [wrap(matchable: powerUpType) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "updateSelectedPowerUp(powerUpType: PowerUpType?)", parameterMatchers: matchers))
	    }
	    
	    func activatePowerUp<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(at position: M1, with size: M2) -> Cuckoo.ClassStubNoReturnFunction<(CGPoint, CGSize?)> where M1.MatchedType == CGPoint, M2.OptionalMatchedType == CGSize {
	        let matchers: [Cuckoo.ParameterMatcher<(CGPoint, CGSize?)>] = [wrap(matchable: position) { $0.0 }, wrap(matchable: size) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "activatePowerUp(at: CGPoint, with: CGSize?)", parameterMatchers: matchers))
	    }
	    
	    func spawnPlayerUnitWave() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "spawnPlayerUnitWave()", parameterMatchers: matchers))
	    }
	    
	    func activateInvincibleEndPoint() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "activateInvincibleEndPoint()", parameterMatchers: matchers))
	    }
	    
	    func deactivateInvincibleEndPoint() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEngine.self, method: "deactivateInvincibleEndPoint()", parameterMatchers: matchers))
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
	
	    
	    
	    var systems: Cuckoo.VerifyReadOnlyProperty<[ComponentType: System]> {
	        return .init(manager: cuckoo_manager, name: "systems", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var rootRenderNode: Cuckoo.VerifyOptionalProperty<RootRenderNode> {
	        return .init(manager: cuckoo_manager, name: "rootRenderNode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var playerEntity: Cuckoo.VerifyReadOnlyProperty<PlayerEntity?> {
	        return .init(manager: cuckoo_manager, name: "playerEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var comboEntity: Cuckoo.VerifyReadOnlyProperty<ComboEntity?> {
	        return .init(manager: cuckoo_manager, name: "comboEntity", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var isDivineShieldActivated: Cuckoo.VerifyReadOnlyProperty<Bool> {
	        return .init(manager: cuckoo_manager, name: "isDivineShieldActivated", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func add<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("add(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addPlayerEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(healthNode: M1, manaNode: M2, scoreNode: M3) -> Cuckoo.__DoNotUse<(HealthBarNode, ManaBarNode, ScoreNode), Void> where M1.MatchedType == HealthBarNode, M2.MatchedType == ManaBarNode, M3.MatchedType == ScoreNode {
	        let matchers: [Cuckoo.ParameterMatcher<(HealthBarNode, ManaBarNode, ScoreNode)>] = [wrap(matchable: healthNode) { $0.0 }, wrap(matchable: manaNode) { $0.1 }, wrap(matchable: scoreNode) { $0.2 }]
	        return cuckoo_manager.verify("addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addTimerEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(timerNode: M1, initialTimerValue: M2) -> Cuckoo.__DoNotUse<(SKLabelNode, TimeInterval), Void> where M1.MatchedType == SKLabelNode, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(SKLabelNode, TimeInterval)>] = [wrap(matchable: timerNode) { $0.0 }, wrap(matchable: initialTimerValue) { $0.1 }]
	        return cuckoo_manager.verify("addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func addEndPointEntity<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(node: M1, team: M2) -> Cuckoo.__DoNotUse<(SKSpriteNode, Team), Void> where M1.MatchedType == SKSpriteNode, M2.MatchedType == Team {
	        let matchers: [Cuckoo.ParameterMatcher<(SKSpriteNode, Team)>] = [wrap(matchable: node) { $0.0 }, wrap(matchable: team) { $0.1 }]
	        return cuckoo_manager.verify("addEndPointEntity(node: SKSpriteNode, team: Team)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func remove<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("remove(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(with deltaTime: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: deltaTime) { $0 }]
	        return cuckoo_manager.verify("update(with: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func startNextSpawnWave() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("startNextSpawnWave()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
	    func addScore<M1: Cuckoo.Matchable>(by points: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: points) { $0 }]
	        return cuckoo_manager.verify("addScore(by: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func gestureActivated<M1: Cuckoo.Matchable>(gesture: M1) -> Cuckoo.__DoNotUse<(CustomGesture), Void> where M1.MatchedType == CustomGesture {
	        let matchers: [Cuckoo.ParameterMatcher<(CustomGesture)>] = [wrap(matchable: gesture) { $0 }]
	        return cuckoo_manager.verify("gestureActivated(gesture: CustomGesture)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func unitForceRemoved<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("unitForceRemoved(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func unitReachedLine<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("unitReachedLine(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
	    
	    @discardableResult
	    func incrementCombo() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("incrementCombo()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func incrementMultiplier() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("incrementMultiplier()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func endCombo() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("endCombo()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func updateSelectedPowerUp<M1: Cuckoo.OptionalMatchable>(powerUpType: M1) -> Cuckoo.__DoNotUse<(PowerUpType?), Void> where M1.OptionalMatchedType == PowerUpType {
	        let matchers: [Cuckoo.ParameterMatcher<(PowerUpType?)>] = [wrap(matchable: powerUpType) { $0 }]
	        return cuckoo_manager.verify("updateSelectedPowerUp(powerUpType: PowerUpType?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func activatePowerUp<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(at position: M1, with size: M2) -> Cuckoo.__DoNotUse<(CGPoint, CGSize?), Void> where M1.MatchedType == CGPoint, M2.OptionalMatchedType == CGSize {
	        let matchers: [Cuckoo.ParameterMatcher<(CGPoint, CGSize?)>] = [wrap(matchable: position) { $0.0 }, wrap(matchable: size) { $0.1 }]
	        return cuckoo_manager.verify("activatePowerUp(at: CGPoint, with: CGSize?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func spawnPlayerUnitWave() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("spawnPlayerUnitWave()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func activateInvincibleEndPoint() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("activateInvincibleEndPoint()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deactivateInvincibleEndPoint() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("deactivateInvincibleEndPoint()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameEngineStub: GameEngine {
    
    
     override var systems: [ComponentType: System] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([ComponentType: System]).self)
        }
        
    }
    
    
     override var rootRenderNode: RootRenderNode? {
        get {
            return DefaultValueRegistry.defaultValue(for: (RootRenderNode?).self)
        }
        
        set { }
        
    }
    
    
     override var playerEntity: PlayerEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerEntity?).self)
        }
        
    }
    
    
     override var comboEntity: ComboEntity? {
        get {
            return DefaultValueRegistry.defaultValue(for: (ComboEntity?).self)
        }
        
    }
    
    
     override var isDivineShieldActivated: Bool {
        get {
            return DefaultValueRegistry.defaultValue(for: (Bool).self)
        }
        
    }
    

    

    
     override func add(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func addPlayerEntity(healthNode: HealthBarNode, manaNode: ManaBarNode, scoreNode: ScoreNode)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func addTimerEntity(timerNode: SKLabelNode, initialTimerValue: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func addEndPointEntity(node: SKSpriteNode, team: Team)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func remove(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func update(with deltaTime: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func startNextSpawnWave()   {
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
    
     override func addScore(by points: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func gestureActivated(gesture: CustomGesture)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func unitForceRemoved(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func unitReachedLine(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func increasePlayerMana(by manaPoints: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func decreasePlayerMana(by manaPoints: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func incrementCombo()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func incrementMultiplier()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func endCombo()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func updateSelectedPowerUp(powerUpType: PowerUpType?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func activatePowerUp(at position: CGPoint, with size: CGSize?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func spawnPlayerUnitWave()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func activateInvincibleEndPoint()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func deactivateInvincibleEndPoint()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/RemoveDelegate.swift at 2020-04-13 11:39:26 +0000

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
    

    

    

    
    
    
     override func removeGesture(for entity: Entity)  {
        
    return cuckoo_manager.call("removeGesture(for: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.removeGesture(for: entity)
                ,
            defaultCall: __defaultImplStub!.removeGesture(for: entity))
        
    }
    
    
    
     override func removeUnit(_ entity: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool, fullAnimation: Bool)  {
        
    return cuckoo_manager.call("removeUnit(_: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool, fullAnimation: Bool)",
            parameters: (entity, shouldDecreasePlayerHealth, shouldIncreaseScore, fullAnimation),
            escapingParameters: (entity, shouldDecreasePlayerHealth, shouldIncreaseScore, fullAnimation),
            superclassCall:
                
                super.removeUnit(entity, shouldDecreasePlayerHealth: shouldDecreasePlayerHealth, shouldIncreaseScore: shouldIncreaseScore, fullAnimation: fullAnimation)
                ,
            defaultCall: __defaultImplStub!.removeUnit(entity, shouldDecreasePlayerHealth: shouldDecreasePlayerHealth, shouldIncreaseScore: shouldIncreaseScore, fullAnimation: fullAnimation))
        
    }
    
    
    
     override func removeDroppedMana(_ entity: Entity)  {
        
    return cuckoo_manager.call("removeDroppedMana(_: Entity)",
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
	    
	    
	    func removeGesture<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeGesture(for: Entity)", parameterMatchers: matchers))
	    }
	    
	    func removeUnit<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ entity: M1, shouldDecreasePlayerHealth: M2, shouldIncreaseScore: M3, fullAnimation: M4) -> Cuckoo.ClassStubNoReturnFunction<(Entity, Bool, Bool, Bool)> where M1.MatchedType == Entity, M2.MatchedType == Bool, M3.MatchedType == Bool, M4.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, Bool, Bool, Bool)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: shouldDecreasePlayerHealth) { $0.1 }, wrap(matchable: shouldIncreaseScore) { $0.2 }, wrap(matchable: fullAnimation) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeUnit(_: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool, fullAnimation: Bool)", parameterMatchers: matchers))
	    }
	    
	    func removeDroppedMana<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRemoveDelegate.self, method: "removeDroppedMana(_: Entity)", parameterMatchers: matchers))
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
	    func removeGesture<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeGesture(for: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeUnit<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(_ entity: M1, shouldDecreasePlayerHealth: M2, shouldIncreaseScore: M3, fullAnimation: M4) -> Cuckoo.__DoNotUse<(Entity, Bool, Bool, Bool), Void> where M1.MatchedType == Entity, M2.MatchedType == Bool, M3.MatchedType == Bool, M4.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, Bool, Bool, Bool)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: shouldDecreasePlayerHealth) { $0.1 }, wrap(matchable: shouldIncreaseScore) { $0.2 }, wrap(matchable: fullAnimation) { $0.3 }]
	        return cuckoo_manager.verify("removeUnit(_: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool, fullAnimation: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeDroppedMana<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("removeDroppedMana(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RemoveDelegateStub: RemoveDelegate {
    

    

    
     override func removeGesture(for entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeUnit(_ entity: Entity, shouldDecreasePlayerHealth: Bool, shouldIncreaseScore: Bool, fullAnimation: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeDroppedMana(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/HealthSystem.swift at 2020-04-13 11:39:26 +0000

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
    

    

    

    
    
    
     override func minusHealthPoints(for entity: Entity) -> Int? {
        
    return cuckoo_manager.call("minusHealthPoints(for: Entity) -> Int?",
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
	    
	    
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubFunction<(Entity), Int?> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHealthSystem.self, method: "minusHealthPoints(for: Entity) -> Int?", parameterMatchers: matchers))
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
	    func minusHealthPoints<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(Entity), Int?> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("minusHealthPoints(for: Entity) -> Int?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func removeComponent<M1: Cuckoo.Matchable>(_ component: M1) -> Cuckoo.__DoNotUse<(Component), Void> where M1.MatchedType == Component {
	        let matchers: [Cuckoo.ParameterMatcher<(Component)>] = [wrap(matchable: component) { $0 }]
	        return cuckoo_manager.verify("removeComponent(_: Component)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HealthSystemStub: HealthSystem {
    

    

    
     override func minusHealthPoints(for entity: Entity) -> Int?  {
        return DefaultValueRegistry.defaultValue(for: (Int?).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/ManaSystem.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/MoveSystem.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/SpriteSystem.swift at 2020-04-13 11:39:26 +0000

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
    
    
    
     override func runFadingAnimation(_ entity: Entity)  {
        
    return cuckoo_manager.call("runFadingAnimation(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.runFadingAnimation(entity)
                ,
            defaultCall: __defaultImplStub!.runFadingAnimation(entity))
        
    }
    
    
    
     override func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String)  {
        
    return cuckoo_manager.call("changeAnimationSpeed(for: Entity, duration: TimeInterval, to: Float, animationNodeKey: String)",
            parameters: (entity, duration, speed, animationNodeKey),
            escapingParameters: (entity, duration, speed, animationNodeKey),
            superclassCall:
                
                super.changeAnimationSpeed(for: entity, duration: duration, to: speed, animationNodeKey: animationNodeKey)
                ,
            defaultCall: __defaultImplStub!.changeAnimationSpeed(for: entity, duration: duration, to: speed, animationNodeKey: animationNodeKey))
        
    }
    
    
    
     override func activateInvincibleEndPoint(for entity: Entity)  {
        
    return cuckoo_manager.call("activateInvincibleEndPoint(for: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.activateInvincibleEndPoint(for: entity)
                ,
            defaultCall: __defaultImplStub!.activateInvincibleEndPoint(for: entity))
        
    }
    
    
    
     override func deactivateInvincibleEndPoint(for entity: Entity)  {
        
    return cuckoo_manager.call("deactivateInvincibleEndPoint(for: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.deactivateInvincibleEndPoint(for: entity)
                ,
            defaultCall: __defaultImplStub!.deactivateInvincibleEndPoint(for: entity))
        
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
	    
	    func runFadingAnimation<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "runFadingAnimation(_: Entity)", parameterMatchers: matchers))
	    }
	    
	    func changeAnimationSpeed<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(for entity: M1, duration: M2, to speed: M3, animationNodeKey: M4) -> Cuckoo.ClassStubNoReturnFunction<(Entity, TimeInterval, Float, String)> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == Float, M4.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, Float, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: speed) { $0.2 }, wrap(matchable: animationNodeKey) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "changeAnimationSpeed(for: Entity, duration: TimeInterval, to: Float, animationNodeKey: String)", parameterMatchers: matchers))
	    }
	    
	    func activateInvincibleEndPoint<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "activateInvincibleEndPoint(for: Entity)", parameterMatchers: matchers))
	    }
	    
	    func deactivateInvincibleEndPoint<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSpriteSystem.self, method: "deactivateInvincibleEndPoint(for: Entity)", parameterMatchers: matchers))
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
	    func runFadingAnimation<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("runFadingAnimation(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func changeAnimationSpeed<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(for entity: M1, duration: M2, to speed: M3, animationNodeKey: M4) -> Cuckoo.__DoNotUse<(Entity, TimeInterval, Float, String), Void> where M1.MatchedType == Entity, M2.MatchedType == TimeInterval, M3.MatchedType == Float, M4.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity, TimeInterval, Float, String)>] = [wrap(matchable: entity) { $0.0 }, wrap(matchable: duration) { $0.1 }, wrap(matchable: speed) { $0.2 }, wrap(matchable: animationNodeKey) { $0.3 }]
	        return cuckoo_manager.verify("changeAnimationSpeed(for: Entity, duration: TimeInterval, to: Float, animationNodeKey: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func activateInvincibleEndPoint<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("activateInvincibleEndPoint(for: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func deactivateInvincibleEndPoint<M1: Cuckoo.Matchable>(for entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("deactivateInvincibleEndPoint(for: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
    
     override func runFadingAnimation(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func changeAnimationSpeed(for entity: Entity, duration: TimeInterval, to speed: Float, animationNodeKey: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func activateInvincibleEndPoint(for entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func deactivateInvincibleEndPoint(for entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameEngine/Systems/TimerSystem.swift at 2020-04-13 11:39:26 +0000

//
//  TimerSystem.swift
//  GameOfRunes
//
//  Created by Andy on 27/3/20.
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
    
    
    
     override func updateComponent(_ component: TimerComponent, _ seconds: TimeInterval)  {
        
    return cuckoo_manager.call("updateComponent(_: TimerComponent, _: TimeInterval)",
            parameters: (component, seconds),
            escapingParameters: (component, seconds),
            superclassCall:
                
                super.updateComponent(component, seconds)
                ,
            defaultCall: __defaultImplStub!.updateComponent(component, seconds))
        
    }
    
    
    
     override func resetTimer(_ entity: Entity)  {
        
    return cuckoo_manager.call("resetTimer(_: Entity)",
            parameters: (entity),
            escapingParameters: (entity),
            superclassCall:
                
                super.resetTimer(entity)
                ,
            defaultCall: __defaultImplStub!.resetTimer(entity))
        
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
	    
	    func updateComponent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ component: M1, _ seconds: M2) -> Cuckoo.ClassStubNoReturnFunction<(TimerComponent, TimeInterval)> where M1.MatchedType == TimerComponent, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimerComponent, TimeInterval)>] = [wrap(matchable: component) { $0.0 }, wrap(matchable: seconds) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTimerSystem.self, method: "updateComponent(_: TimerComponent, _: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func resetTimer<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.ClassStubNoReturnFunction<(Entity)> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockTimerSystem.self, method: "resetTimer(_: Entity)", parameterMatchers: matchers))
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
	    func updateComponent<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ component: M1, _ seconds: M2) -> Cuckoo.__DoNotUse<(TimerComponent, TimeInterval), Void> where M1.MatchedType == TimerComponent, M2.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimerComponent, TimeInterval)>] = [wrap(matchable: component) { $0.0 }, wrap(matchable: seconds) { $0.1 }]
	        return cuckoo_manager.verify("updateComponent(_: TimerComponent, _: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func resetTimer<M1: Cuckoo.Matchable>(_ entity: M1) -> Cuckoo.__DoNotUse<(Entity), Void> where M1.MatchedType == Entity {
	        let matchers: [Cuckoo.ParameterMatcher<(Entity)>] = [wrap(matchable: entity) { $0 }]
	        return cuckoo_manager.verify("resetTimer(_: Entity)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
    
     override func updateComponent(_ component: TimerComponent, _ seconds: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func resetTimer(_ entity: Entity)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func removeComponent(_ component: Component)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameEndState.swift at 2020-04-13 11:39:26 +0000

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
    
    
    
     override var finalScore: Int {
        get {
            return cuckoo_manager.getter("finalScore",
                superclassCall:
                    
                    super.finalScore
                    ,
                defaultCall: __defaultImplStub!.finalScore)
        }
        
        set {
            cuckoo_manager.setter("finalScore",
                value: newValue,
                superclassCall:
                    
                    super.finalScore = newValue
                    ,
                defaultCall: __defaultImplStub!.finalScore = newValue)
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
    
    
    
     override func updateAndSaveStageData()  {
        
    return cuckoo_manager.call("updateAndSaveStageData()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.updateAndSaveStageData()
                ,
            defaultCall: __defaultImplStub!.updateAndSaveStageData())
        
    }
    

	 struct __StubbingProxy_GameEndState: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var didWin: Cuckoo.ClassToBeStubbedProperty<MockGameEndState, Bool> {
	        return .init(manager: cuckoo_manager, name: "didWin")
	    }
	    
	    
	    var finalScore: Cuckoo.ClassToBeStubbedProperty<MockGameEndState, Int> {
	        return .init(manager: cuckoo_manager, name: "finalScore")
	    }
	    
	    
	    func isValidNextState<M1: Cuckoo.Matchable>(_ stateClass: M1) -> Cuckoo.ClassStubFunction<(AnyClass), Bool> where M1.MatchedType == AnyClass {
	        let matchers: [Cuckoo.ParameterMatcher<(AnyClass)>] = [wrap(matchable: stateClass) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEndState.self, method: "isValidNextState(_: AnyClass) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func didEnter<M1: Cuckoo.OptionalMatchable>(from previousState: M1) -> Cuckoo.ClassStubNoReturnFunction<(GKState?)> where M1.OptionalMatchedType == GKState {
	        let matchers: [Cuckoo.ParameterMatcher<(GKState?)>] = [wrap(matchable: previousState) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEndState.self, method: "didEnter(from: GKState?)", parameterMatchers: matchers))
	    }
	    
	    func updateAndSaveStageData() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameEndState.self, method: "updateAndSaveStageData()", parameterMatchers: matchers))
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
	    
	    
	    var finalScore: Cuckoo.VerifyProperty<Int> {
	        return .init(manager: cuckoo_manager, name: "finalScore", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
	    
	    @discardableResult
	    func updateAndSaveStageData() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("updateAndSaveStageData()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
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
    
    
     override var finalScore: Int {
        get {
            return DefaultValueRegistry.defaultValue(for: (Int).self)
        }
        
        set { }
        
    }
    

    

    
     override func isValidNextState(_ stateClass: AnyClass) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     override func didEnter(from previousState: GKState?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func updateAndSaveStageData()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameInPlayState.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameState/GamePauseState.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameSelectionState.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameStartState.swift at 2020-04-13 11:39:26 +0000

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


// MARK: - Mocks generated from file: GameOfRunes/GameState/GameStateMachine.swift at 2020-04-13 11:39:26 +0000

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
    
    
    
     override var stage: Stage? {
        get {
            return cuckoo_manager.getter("stage",
                superclassCall:
                    
                    super.stage
                    ,
                defaultCall: __defaultImplStub!.stage)
        }
        
        set {
            cuckoo_manager.setter("stage",
                value: newValue,
                superclassCall:
                    
                    super.stage = newValue
                    ,
                defaultCall: __defaultImplStub!.stage = newValue)
        }
        
    }
    
    
    
     override var avatar: Avatar? {
        get {
            return cuckoo_manager.getter("avatar",
                superclassCall:
                    
                    super.avatar
                    ,
                defaultCall: __defaultImplStub!.avatar)
        }
        
        set {
            cuckoo_manager.setter("avatar",
                value: newValue,
                superclassCall:
                    
                    super.avatar = newValue
                    ,
                defaultCall: __defaultImplStub!.avatar = newValue)
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
	    
	    
	    var stage: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameStateMachine, Stage> {
	        return .init(manager: cuckoo_manager, name: "stage")
	    }
	    
	    
	    var avatar: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameStateMachine, Avatar> {
	        return .init(manager: cuckoo_manager, name: "avatar")
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
	    
	    
	    var stage: Cuckoo.VerifyOptionalProperty<Stage> {
	        return .init(manager: cuckoo_manager, name: "stage", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var avatar: Cuckoo.VerifyOptionalProperty<Avatar> {
	        return .init(manager: cuckoo_manager, name: "avatar", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
    
    
     override var stage: Stage? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Stage?).self)
        }
        
        set { }
        
    }
    
    
     override var avatar: Avatar? {
        get {
            return DefaultValueRegistry.defaultValue(for: (Avatar?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: GameOfRunes/Scenes/GameScene.swift at 2020-04-13 11:39:26 +0000

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
    

    
    
    
     override var gameStateMachine: GameStateMachine? {
        get {
            return cuckoo_manager.getter("gameStateMachine",
                superclassCall:
                    
                    super.gameStateMachine
                    ,
                defaultCall: __defaultImplStub!.gameStateMachine)
        }
        
    }
    
    
    
     override var rootRenderNode: RootRenderNode! {
        get {
            return cuckoo_manager.getter("rootRenderNode",
                superclassCall:
                    
                    super.rootRenderNode
                    ,
                defaultCall: __defaultImplStub!.rootRenderNode)
        }
        
        set {
            cuckoo_manager.setter("rootRenderNode",
                value: newValue,
                superclassCall:
                    
                    super.rootRenderNode = newValue
                    ,
                defaultCall: __defaultImplStub!.rootRenderNode = newValue)
        }
        
    }
    
    
    
     override var deltaTime: TimeInterval {
        get {
            return cuckoo_manager.getter("deltaTime",
                superclassCall:
                    
                    super.deltaTime
                    ,
                defaultCall: __defaultImplStub!.deltaTime)
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
    
    
    
     override func update(_ currentTime: TimeInterval)  {
        
    return cuckoo_manager.call("update(_: TimeInterval)",
            parameters: (currentTime),
            escapingParameters: (currentTime),
            superclassCall:
                
                super.update(currentTime)
                ,
            defaultCall: __defaultImplStub!.update(currentTime))
        
    }
    
    
    
     override func gameDidEnd(didWin: Bool, finalScore: Int)  {
        
    return cuckoo_manager.call("gameDidEnd(didWin: Bool, finalScore: Int)",
            parameters: (didWin, finalScore),
            escapingParameters: (didWin, finalScore),
            superclassCall:
                
                super.gameDidEnd(didWin: didWin, finalScore: finalScore)
                ,
            defaultCall: __defaultImplStub!.gameDidEnd(didWin: didWin, finalScore: finalScore))
        
    }
    

	 struct __StubbingProxy_GameScene: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var gameStateMachine: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, GameStateMachine?> {
	        return .init(manager: cuckoo_manager, name: "gameStateMachine")
	    }
	    
	    
	    var rootRenderNode: Cuckoo.ClassToBeStubbedOptionalProperty<MockGameScene, RootRenderNode> {
	        return .init(manager: cuckoo_manager, name: "rootRenderNode")
	    }
	    
	    
	    var deltaTime: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGameScene, TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "deltaTime")
	    }
	    
	    
	    func sceneDidLoad() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "sceneDidLoad()", parameterMatchers: matchers))
	    }
	    
	    func update<M1: Cuckoo.Matchable>(_ currentTime: M1) -> Cuckoo.ClassStubNoReturnFunction<(TimeInterval)> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: currentTime) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "update(_: TimeInterval)", parameterMatchers: matchers))
	    }
	    
	    func gameDidEnd<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(didWin: M1, finalScore: M2) -> Cuckoo.ClassStubNoReturnFunction<(Bool, Int)> where M1.MatchedType == Bool, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool, Int)>] = [wrap(matchable: didWin) { $0.0 }, wrap(matchable: finalScore) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGameScene.self, method: "gameDidEnd(didWin: Bool, finalScore: Int)", parameterMatchers: matchers))
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
	
	    
	    
	    var gameStateMachine: Cuckoo.VerifyReadOnlyProperty<GameStateMachine?> {
	        return .init(manager: cuckoo_manager, name: "gameStateMachine", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var rootRenderNode: Cuckoo.VerifyOptionalProperty<RootRenderNode> {
	        return .init(manager: cuckoo_manager, name: "rootRenderNode", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var deltaTime: Cuckoo.VerifyReadOnlyProperty<TimeInterval> {
	        return .init(manager: cuckoo_manager, name: "deltaTime", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func sceneDidLoad() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("sceneDidLoad()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable>(_ currentTime: M1) -> Cuckoo.__DoNotUse<(TimeInterval), Void> where M1.MatchedType == TimeInterval {
	        let matchers: [Cuckoo.ParameterMatcher<(TimeInterval)>] = [wrap(matchable: currentTime) { $0 }]
	        return cuckoo_manager.verify("update(_: TimeInterval)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func gameDidEnd<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(didWin: M1, finalScore: M2) -> Cuckoo.__DoNotUse<(Bool, Int), Void> where M1.MatchedType == Bool, M2.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool, Int)>] = [wrap(matchable: didWin) { $0.0 }, wrap(matchable: finalScore) { $0.1 }]
	        return cuckoo_manager.verify("gameDidEnd(didWin: Bool, finalScore: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GameSceneStub: GameScene {
    
    
     override var gameStateMachine: GameStateMachine? {
        get {
            return DefaultValueRegistry.defaultValue(for: (GameStateMachine?).self)
        }
        
    }
    
    
     override var rootRenderNode: RootRenderNode! {
        get {
            return DefaultValueRegistry.defaultValue(for: (RootRenderNode?).self)
        }
        
        set { }
        
    }
    
    
     override var deltaTime: TimeInterval {
        get {
            return DefaultValueRegistry.defaultValue(for: (TimeInterval).self)
        }
        
    }
    

    

    
     override func sceneDidLoad()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func update(_ currentTime: TimeInterval)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func gameDidEnd(didWin: Bool, finalScore: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: GameOfRunes/Scenes/SceneManager.swift at 2020-04-13 11:39:26 +0000

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
    
    
    
     override func beginNewStage()  {
        
    return cuckoo_manager.call("beginNewStage()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.beginNewStage()
                ,
            defaultCall: __defaultImplStub!.beginNewStage())
        
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
	    
	    func beginNewStage() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockSceneManager.self, method: "beginNewStage()", parameterMatchers: matchers))
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
	    func beginNewStage() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("beginNewStage()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SceneManagerStub: SceneManager {
    

    

    
     override func transitionToScene(sceneIdentifier: SceneIdentifier)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func beginNewStage()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

