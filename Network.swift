//
//  Network.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/21/22.
//

import Foundation
import Network

class NetworkManager: ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Network Manager")
    @Published var isConnected = true
    
    func connectionDescription() -> Double{
        if isConnected{
            return 0.0
        }else{
            return 1.0
        }
    }
    
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async{
                self.isConnected = path.status == .satisfied

            }
        }
        monitor.start(queue: queue)
    }
}
