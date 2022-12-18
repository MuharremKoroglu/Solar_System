//
//  ViewController.swift
//  SolarSystem
//
//  Created by Muharrem Köroğlu on 18.12.2022.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        createSphere(radius: 1, content: "sun.png", vector: SCNVector3(0, 0, -5))
        createSphere(radius: 0.3, content: "mercury.png", vector: SCNVector3(1.5, 0, -5))
        createSphere(radius: 0.5, content: "venus.png", vector: SCNVector3(2.5, 0, -5))
        createSphere(radius: 0.8, content: "earth.png", vector: SCNVector3(4.5, 0, -5))
        createSphere(radius: 0.2, content: "moon.png", vector: SCNVector3(6.5, 0, -5))
        createSphere(radius: 0.6, content: "mars.png", vector: SCNVector3(8.5, 0, -5))
        createSphere(radius: 0.9, content: "jupiter.png", vector: SCNVector3(9.5, 0, -5))
        createSphere(radius: 0.7, content: "uranus.png", vector: SCNVector3(10.5, 0, -5))
    

        sceneView.automaticallyUpdatesLighting = true

    }
    func createSphere (radius : CGFloat, content : String, vector : SCNVector3) {
        
        let sphere = SCNSphere(radius: radius)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        sphere.materials = [sphereMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
