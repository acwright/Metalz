//
//  Primitive.swift
//  Metalz
//
//  Created by Aaron Wright on 10/13/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import Foundation
import MetalKit

class Primitive {
    
    static func cube(device: MTLDevice, size: Float) -> MDLMesh {
        let allocator = MTKMeshBufferAllocator(device: device)
        let mesh = MDLMesh(
            boxWithExtent: [size, size, size],
            segments: [1, 1, 1],
            inwardNormals: false,
            geometryType: .triangles,
            allocator: allocator
        )
        return mesh
    }
    
}
