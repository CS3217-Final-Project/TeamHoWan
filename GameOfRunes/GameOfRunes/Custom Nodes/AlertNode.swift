//
//  AlertNode.swift
//  GameOfRunes
//
//  Created by Jermy on 14/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import SpriteKit

class AlertNode: SKNode {
    enum Status: String {
        case success
        case warning
    }
    
    private let screeningNode: SKSpriteNode
    private let viewNode: AlertViewNode
    weak var responder: AlertResponder?
    var identifier: String?
    
    /**
     Dims all other contents in the view where this node is presented.
     Does not work when background content is enabled.
     */
    var dimBackgroundContent: Bool {
        get {
            screeningNode.color != .clear
        }
        set {
            screeningNode.color = newValue ? .black : .clear
        }
    }
    
    /**
     Disable user interaction with all other contents in the view where this node is presented
     */
    var disableBackgroundContent: Bool {
        get {
            !screeningNode.isHidden
        }
        set {
            screeningNode.isHidden = !newValue
        }
    }
    var showLoader: Bool {
        get {
            !viewNode.loaderNode.isHidden
        }
        set {
            viewNode.loaderNode.isHidden = !newValue
        }
    }
    var showTick: Bool {
        get {
            viewNode.visibleActionNodes.tick
        }
        set {
            viewNode.visibleActionNodes = (newValue, viewNode.visibleActionNodes.cross)
        }
    }
    var showCross: Bool {
        get {
            viewNode.visibleActionNodes.cross
        }
        set {
            viewNode.visibleActionNodes = (viewNode.visibleActionNodes.tick, newValue)
        }
    }
    var status: Status? {
        didSet {
            guard let status = status else {
                viewNode.statusNode.isHidden = true
                return
            }
            
            viewNode.statusNode.isHidden = false
            viewNode.statusNode.texture = .init(imageNamed: "\(status)-logo")
        }
    }
    var alertDescription: String {
        get {
            viewNode.descriptionNode.text ?? ""
        }
        set {
            viewNode.descriptionNode.text = newValue
        }
    }
    
    init(size: CGSize) {
        screeningNode = .init(texture: nil, color: .clear, size: size)
        viewNode = .init(size: .init(width: size.width * 0.9, height: size.height * 0.5))
        super.init()
        
        screeningNode.zPosition = 10_000
        screeningNode.alpha = 0.7
        
        viewNode.zPosition = 10_001
        viewNode.tickNode.customResponder = self
        viewNode.crossNode.customResponder = self
        
        addChild(screeningNode)
        addChild(viewNode)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertNode: TapResponder {
    func onTapped(tappedNode: ButtonNode) {
        switch tappedNode.buttonType {
        case .tickButton:
            responder?.tickOnTapped(sender: self)
        case .crossButton:
            responder?.crossOnTapped(sender: self)
        default:
            fatalError("Unknown button type in alert")
        }
    }
}
