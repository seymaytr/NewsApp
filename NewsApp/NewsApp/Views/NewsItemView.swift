//
//  NewsItemView.swift
//  NewsApp
//
//  Created by Seyma Yeter on 6.08.2022.
//

import SwiftUI

struct NewsItemView: View {
    let title: String?
    let description: String?
    let date: String?
    let image: String?

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if let title = title {
                    Text(title)
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .font(.system(size: 15).bold())
                }
                if let description = description {
                    Text(description)
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .font(.system(size: 13))
                        .padding(.bottom, 1)
                }
                if let date = date {
                    Text(Utility().getDate(dateString: date))
                        .lineLimit(2)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }
            .multilineTextAlignment(.leading)

            AsyncImage(url: URL(string: image ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.5)
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .padding(.horizontal)
    }
}

struct NewsItemViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsItemView(title: "Title", description: "Description",
                     date: "27:02:2022", image: "https://www.apple.com")
    }
}
