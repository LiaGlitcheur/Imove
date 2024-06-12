import SwiftUI

struct ContentView: View {
    let label: String
    let scriptPath: String
    @Binding var isTransferring: Bool
    @Binding var progress: Double
    @Binding var errorMessage: String?
    
    var body: some View {
        VStack {
            Text("Distri")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Image("distri")
            if isTransferring {
                ProgressView("Transfert...", value: progress, total: 1.0)
                    .padding()
            } else {
                Button("Démarrer le Transfert") {
                    startTransfer()
                }
                .padding()
            }
            
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear) // Assurez-vous que le fond est transparent
    }
    
    func startTransfer() {
        isTransferring = true
        progress = 0.0
        errorMessage = nil
        
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        task.arguments = [scriptPath]
        
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardError = errorPipe
        
        task.terminationHandler = { process in
            DispatchQueue.main.async {
                self.isTransferring = false
                self.progress = 1.0
                
                if process.terminationStatus != 0 {
                    let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
                    let output = String(data: errorData, encoding: .utf8) ?? "Erreur Inconnue"
                    self.errorMessage = output
                }
            }
        }
        
        do {
            try task.run()
            DispatchQueue.global(qos: .background).async {
                while self.isTransferring {
                    DispatchQueue.main.async {
                        self.progress += 0.1
                    }
                    sleep(1)
                }
            }
        } catch {
            self.isTransferring = false
            self.errorMessage = "Impossible de démarrer le processus: \(error.localizedDescription)"
            print("Erreur de démarrage du processus : \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            label: "Distri",
            scriptPath:"__Emplacement de votre autre fichier shell__",
            isTransferring: .constant(false),
            progress: .constant(0.0),
            errorMessage: .constant(nil)
        )
    }
}
