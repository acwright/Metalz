//
//  Shaders.metal
//  Metalz
//
//  Created by Aaron Wright on 10/13/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float4 position [[ attribute(0) ]];
};

vertex float4 vertex_main(const VertexIn vertexIn [[ stage_in ]], constant float &timer [[ buffer(1) ]]) {
    float4 position = vertexIn.position;
    position.y += timer;
    
    return position;
}

fragment float4 fragment_main() {
    return float4(1.000000, 0.488274, 0.018728, 1);
}
