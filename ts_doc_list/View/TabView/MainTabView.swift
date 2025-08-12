//  Created by Emilio

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DoctorHomeView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
                .tag(0)
            
            Text("Приёмы")
                .tabItem {
                    Label("Приёмы", systemImage: "calendar")
                }
                .tag(1)
            
            Text("Чат")
                .tabItem {
                    Label("Чат", systemImage: "message.fill")
                }
                .tag(2)
            
            Text("Профиль")
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                }
                .tag(3)
        }
        .accentColor(.pink)
    }
}
