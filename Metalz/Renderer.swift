//
//  Renderer.swift
//  Metalz
//
//  Created by Aaron Wright on 10/13/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import Foundation
import MetalKit

class Renderer: NSObject {
    
    var view: MTKView!
    var device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var mesh: MTKMesh!
    var vertexBuffer: MTLBuffer!
    var pipelineState: MTLRenderPipelineState!
    
    var timer: Float = 0
    
    init(view: MTKView, device: MTLDevice? = MTLCreateSystemDefaultDevice()) {
        super.init()
        
        guard
            let device = device,
            let commandQueue = device.makeCommandQueue() else {
            fatalError("GPU not available")
        }
        
        self.view = view
        self.device = device
        self.commandQueue = commandQueue
        
        self.view.device = device
        self.view.clearColor = MTLClearColor(red: 1.0, green: 1.0, blue: 0.8, alpha: 1.0)
        self.view.delegate = self
        
        let mdlMesh = Primitive.cube(device: device, size: 1)
        do {
            self.mesh = try MTKMesh(mesh: mdlMesh, device: device)
        } catch {
            Swift.print(error.localizedDescription)
        }
        
        self.vertexBuffer = mesh.vertexBuffers[0].buffer
        
        let library = device.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "vertex_main")
        let fragmentFunction = library?.makeFunction(name: "fragment_main")
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mdlMesh.vertexDescriptor)
        pipelineDescriptor.colorAttachments[0].pixelFormat = self.view.colorPixelFormat
        
        do {
            self.pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
}

extension Renderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }

    func draw(in view: MTKView) {
        guard
            let descriptor = view.currentRenderPassDescriptor,
            let commandBuffer = self.commandQueue.makeCommandBuffer(),
            let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            return
        }
        
        timer += 0.05
        var currentTime = sin(timer)

        renderEncoder.setVertexBytes(&currentTime, length: MemoryLayout<Float>.stride, index: 1)
        renderEncoder.setRenderPipelineState(self.pipelineState)
        renderEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        
        for submesh in mesh.submeshes {
            renderEncoder.drawIndexedPrimitives(
                type: .triangle,
                indexCount: submesh.indexCount,
                indexType: submesh.indexType,
                indexBuffer: submesh.indexBuffer.buffer,
                indexBufferOffset: submesh.indexBuffer.offset
            )
        }

        renderEncoder.endEncoding()
        
        guard let drawable = view.currentDrawable else { return }
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}
