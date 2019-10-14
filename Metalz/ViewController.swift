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
        
//        let allocator = MTKMeshBufferAllocator(device: device)
//        let mdlMesh = MDLMesh(sphereWithExtent: [0.75, 0.75, 0.75],
//                              segments: [100, 100],
//                              inwardNormals: false,
//                              geometryType: .triangles,
//                              allocator: allocator)
//        guard let mesh = try? MTKMesh(mesh: mdlMesh, device: device) else { fatalError("Could not create mesh") }
        
//        let asset = MDLAsset()
//        asset.add(mdlMesh)
//
//        let fileExtension = "obj"
//
//        guard MDLAsset.canExportFileExtension(fileExtension) else { fatalError("Can't export a .\(fileExtension) format") }
//
//        do {
//            let url = FileManager.default.urls(for: FileManager.SearchPathDirectory.downloadsDirectory, in: .userDomainMask).first?.appendingPathComponent("primitive.\(fileExtension)")
//
//            try asset.export(to: url!)
//        } catch {
//            Swift.print(error)
//        }
        
//        guard let commandQueue = device.makeCommandQueue() else { fatalError("Could not create a command queue") }
//
//        guard let library = device.makeDefaultLibrary() else { fatalError("Could not create default library") }
//
//        let vertexFunction = library.makeFunction(name: "vertex_main")
//        let fragmentFunction = library.makeFunction(name: "fragment_main")
//
//        let pipelineDescriptor = MTLRenderPipelineDescriptor()
//        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
//        pipelineDescriptor.vertexFunction = vertexFunction
//        pipelineDescriptor.fragmentFunction = fragmentFunction
//        pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)
//
//        guard let pipelineState = try? device.makeRenderPipelineState(descriptor: pipelineDescriptor) else { fatalError("Could not create pipeline state") }
//
//        guard let commandBuffer = commandQueue.makeCommandBuffer(),
//                let renderPassDescriptor = mtkView.currentRenderPassDescriptor,
//                let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
//        else { fatalError() }
//
//        renderEncoder.setRenderPipelineState(pipelineState)
//        renderEncoder.setVertexBuffer(mesh.vertexBuffers[0].buffer, offset: 0, index: 0)
//
//        guard let submesh = mesh.submeshes.first else { fatalError() }
//
//        renderEncoder.drawIndexedPrimitives(type: .triangle,
//                                  indexCount: submesh.indexCount,
//                                  indexType: submesh.indexType,
//                                  indexBuffer: submesh.indexBuffer.buffer,
//                                  indexBufferOffset: 0)
//
//        renderEncoder.endEncoding()
//
//        guard let drawable = mtkView.currentDrawable else { fatalError() }
//
//        commandBuffer.present(drawable)
//        commandBuffer.commit()
    }

}
