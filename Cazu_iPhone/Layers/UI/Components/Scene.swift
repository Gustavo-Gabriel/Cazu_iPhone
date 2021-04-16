//
//  Scene.swift
//  Cazu_iPhone
//
//  Created by Gustavo Anjos on 16/04/21.
//

import Foundation
import SceneKit

var scene: SCNScene? {
    let scn = SCNScene(named: "watchC_planet03.dae")
    
    let node = scn?.rootNode
    let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5.0)
    let rotateAndHover = SCNAction.group([rotateOne])
    let repeatForever = SCNAction.repeatForever(rotateAndHover)
    node?.runAction(repeatForever)
    
    scn?.background.contents = UIColor.black
    
    return scn
}

var cameraNode: SCNNode? {
    let cameraNode = SCNNode()
    cameraNode.camera = SCNCamera()
    cameraNode.camera?.fieldOfView = 70
    cameraNode.camera?.zNear = 0
    cameraNode.camera?.zFar = 1000
    cameraNode.camera?.automaticallyAdjustsZRange = true
    cameraNode.position = SCNVector3(x: 0.0, y: 0.5, z: 3.1)
    
    let lookAt = SCNLookAtConstraint(target: scene?.rootNode)
    lookAt.isGimbalLockEnabled = true
    cameraNode.constraints = [lookAt]
    
    return cameraNode
}
