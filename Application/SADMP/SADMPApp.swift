import SwiftUI

@main
struct SADMPApp: App {
    @State private var isTransferring = false
    @State private var progress = 0.0
    @State private var errorMessage: String? = nil
    @State private var currentView: ViewType = .content
    
    var body: some Scene {
        WindowGroup {
            MainView(
                currentView: $currentView,
                isTransferring: $isTransferring,
                progress: $progress,
                errorMessage: $errorMessage
            )
            .background(VisualEffectView().ignoresSafeArea())
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

enum ViewType {
    case content
    case website
}

struct MainView: View {
    @Binding var currentView: ViewType
    @Binding var isTransferring: Bool
    @Binding var progress: Double
    @Binding var errorMessage: String?

    var body: some View {
        VStack {
            HStack {
                Button("Distri") {
                    currentView = .content
                }
                .padding()

                Button("Website") {
                    currentView = .website
                }
                .padding()
            }

            Spacer()

            if currentView == .content {
                ContentView(
                    label: "Distri",
                    scriptPath: "__Emplacement de votre fichier shell__",
                    isTransferring: $isTransferring,
                    progress: $progress,
                    errorMessage: $errorMessage
                )
            } else if currentView == .website {
                WebsiteView(
                    label: "Site Web",
                    scriptPath: "__Emplacement de votre fichier shell__",
                    isTransferring: $isTransferring,
                    progress: $progress,
                    errorMessage: $errorMessage
                )
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear) // Assurez-vous que le fond est transparent
    }
}
