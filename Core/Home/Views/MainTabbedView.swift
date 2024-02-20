//
//  MainTabbedView.swift
//  XCoin
//
//  Created by Jasin ‎ on 2/20/24.
//

//
//  MainTabbedView.swift
//  XCoin
//
//  Created by Jasin ‎ on 2/20/24.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case coins = 0
    case assets
    case profile
    
    var title: String{
        switch self {
        case .coins:
            return "Coins"
        case .assets:
            return "Assets"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .coins:
            return "coins"
        case .assets:
            return "assets"
        case .profile:
            return "profile"
        }
    }
}

struct MainTabbedView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                Coins()
                    .tag(0)

                Assets()
                    .tag(1)

                Profile()
                    .tag(2)
            }

            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.blue.opacity(0.2))
            .cornerRadius(35)
            .padding(.horizontal, 26)
        }
    }
}

extension MainTabbedView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .blue.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}


#Preview {
    MainTabbedView()
}
