import SwiftUI
import SceneKit

struct Drone3DView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.backgroundColor = .clear
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        if let sceneURL = Bundle.main.url(forResource: "manta_flight", withExtension: "dae"),
           let scene = try? SCNScene(url: sceneURL, options: nil) {
            sceneView.scene = scene
        }
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // No dynamic updates needed
    }
}

#if DEBUG
#Preview {
    Drone3DView()
        .frame(height: 400)
        .cornerRadius(16)
        .padding()
}
#endif
