//
//  homeColumn.swift
//  climbER
//
//  Created by 杨阳 on 2022/10/17.
//

import SwiftUI

struct HomeColumn: View {
    var title: String
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .fontWeight(.bold)

                }
                .padding(.horizontal)
                Spacer(minLength: 0)

                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(destination: RouteList()) {
                        Text("更多")
                    }

                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators:  false) {
                HStack {
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                    
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                    VStack {
                        VStack {
                            Image("")
                                .resizable()
                                .background(Color.gray)
                            Text("123")
                                .padding([.leading, .bottom, .trailing])
                                
                            
                        }.background(Color.white.opacity(0.5))
                    }
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding([.top, .leading, .bottom])
                    
                }
            }

        }
        
    }
}

struct homeColumn_Previews: PreviewProvider {
    static var previews: some View {
        HomeColumn(title: "栏目名")
    }
}
