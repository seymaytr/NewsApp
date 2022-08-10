//
//  SearchBarView.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""
    @State private var show = false
    
    var size: CGSize
    var action: ((String) -> Void)?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("news".localized())
                    .padding(.trailing)
                Spacer()
                
                HStack {
                    if show {
                        searchTextFieldView()
                    } else {
                        searchButton()
                    }
                }
                .padding(show ? 10 : 0)
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding()
        }
        .frame(width: size.width, height: size.height)
        .background(Color.red)
    }
    
    func searchTextFieldView() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("enterText".localized(), text: $searchText)
                .onSubmit {
                    action?(searchText)
                }
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }, label: {
                Image(systemName: "xmark").foregroundColor(.black)
            })
        }
    }
    
    func searchButton() -> some View {
        Button(action: {
            withAnimation {
                show.toggle()
            }
        }, label: {
            Image(systemName: "magnifyingglass").foregroundColor(.black).padding(10)
        })
    }
}

struct SearchBarViewPreviews: PreviewProvider {
    static var previews: some View {
        let size =  Constants.UI.screenSize
        
        VStack {
            SearchBarView(size: CGSize(width: size.width, height: 100))
                .edgesIgnoringSafeArea(.top)
            Spacer()
        }
    }
}
