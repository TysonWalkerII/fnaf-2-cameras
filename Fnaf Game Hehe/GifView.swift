//
//  GifView.swift
//  Fnaf Game Hehe
//
//  Created by 寒意⛓🥀💎▩xxııʌ.𝕽𝕬𝕽▽▽ on 12/20/23.
//

import SwiftUI
import FLAnimatedImage



    
    struct GIFView: UIViewRepresentable {
        enum URLType{
            case name(String)
            case url(URL)
            
            var url:URL? {
                switch self{
                case.name(let name):
                    return Bundle.main.url(forResource: name, withExtension: "GIF")
                    
                case.url(let remoteURL):
                    return remoteURL
                }
            }
        }

        private var type: URLType

        init(type: URLType) {

            self.type = type

        }

        func makeUIView(context: Context) -> UIView {

          let view = UIView(frame: .zero)




          view.addSubview(activityIndicator)

          view.addSubview(imageView)




          imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

          imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true




          activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

          activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true




          return view

        }

        

        func updateUIView(_ uiView: UIView, context: Context) {

          activityIndicator.startAnimating()

          guard let url = type.url else { return }




          DispatchQueue.global().async {

            if let data = try? Data(contentsOf: url) {

              let image = FLAnimatedImage(animatedGIFData: data)




              DispatchQueue.main.async {

                activityIndicator.stopAnimating()

                imageView.animatedImage = image

              }

            }

          }

        }

        

        private let imageView: FLAnimatedImageView = {

            let imageView = FLAnimatedImageView()

            imageView.translatesAutoresizingMaskIntoConstraints = false

            // UNCOMMENT TO ADD ROUNDING TO YOUR VIEW

    //      imageView.layer.cornerRadius = 24

            imageView.layer.masksToBounds = true

            return imageView

        }()




        private let activityIndicator: UIActivityIndicatorView = {

            let activityIndicator = UIActivityIndicatorView()

            activityIndicator.translatesAutoresizingMaskIntoConstraints = false

            activityIndicator.color = .systemBlue

            return activityIndicator

        }()

    }






#Preview {
    GIFView(type: .url(URL(string: "https://media.giphy.com/media/n9Kkeq0KdeymTDaLcW/giphy.gif?cid=ecf05e47ttyw36j3d6wsbs7icji71ikoucss2yj3l2mde5hl&ep=v1_gifs_search&rid=giphy.gif&ct=g")!))
    
//    GIFView(type: .name("sheriff"))

}
