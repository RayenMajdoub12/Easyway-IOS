//
//  NotificationManager.swift
//  Easyway
//
//  Created by Rayen Majdoub on 18/5/2023.
//

import Foundation
import SocketIO
class SocketIOManager: ObservableObject {
    
    static let shared = SocketIOManager()
    private var socket: SocketIOClient!

    init() {
        configureSocketConnection()
    }
    
    private func configureSocketConnection() {
        let manager = SocketManager(socketURL: URL(string: "http://172.17.4.157:3001")!, config: [.log(true), .compress])
        socket = manager.defaultSocket 

        socket.on(clientEvent: .connect) {data, ack in
            print("Socket connected!")
            let userId = UserDefaults.standard.string(forKey: "id")!
                    self.socket.emit("registerUser", userId)
        }

        socket.on("departureReminder") {data, ack in
            guard let message = data[0] as? String else { return }
            print("Notification message received: \(message)")
            
            // Show local notification
            self.showLocalNotification(with: message)
        }

        socket.connect()
    }
    
    func emit(event: String, with parameters: [Any]) {
        socket.emit(event, parameters)
    }
    
    private func showLocalNotification(with message: String) {
        let content = UNMutableNotificationContent()
        content.title = "Departure Reminder"
        content.body = message

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
