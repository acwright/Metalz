//
//  ViewController.swift
//  Metal
//
//  Created by Aaron Wright on 10/13/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import Cocoa
import MetalKit

class ViewController: NSViewController {

    var renderer: Renderer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = self.view as? MTKView else { fatalError("Metal view not set up in storyboard") }
        
        self.renderer = Renderer(view: view)
    }

}
