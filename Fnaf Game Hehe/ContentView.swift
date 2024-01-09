//
//  ContentView.swift
//  Fnaf Game Hehe
//
//  Created by 寒意⛓🥀💎▩xxııʌ.𝕽𝕬𝕽▽▽ on 12/20/23.
//

import SwiftUI
struct ContentView: View {
    var cameraArr = ["camera01", "camera02", "camera03", "camera04", "camera05", "camera06", "camera07", "camera08", "camera09", "camera10", "camera11", "camera12"]
    var RoomArr = ["https://media.giphy.com/media/kqzL9sYIf9Ml2/giphy.gif?cid=ecf05e474evip3aj4g1rop5la4i8km6zg2zabbvl621u2vtw&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.giphy.com/media/l44QjgeQ5ium91n9K/giphy.gif?cid=ecf05e47m54l29g0ylphyt2ffa6v55p5mdsl042n1nbkqyg7&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.giphy.com/media/6JMWKEZI7m4H6/giphy.gif?cid=ecf05e47m54l29g0ylphyt2ffa6v55p5mdsl042n1nbkqyg7&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.giphy.com/media/P4ZnbN540XQZ2/giphy.gif?cid=ecf05e47m54l29g0ylphyt2ffa6v55p5mdsl042n1nbkqyg7&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.giphy.com/media/VSiNfsl8VIRIk/giphy.gif?cid=ecf05e47m54l29g0ylphyt2ffa6v55p5mdsl042n1nbkqyg7&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.giphy.com/media/l2JJuYblC1NiQCUmY/giphy.gif?cid=ecf05e47uaz6mqbyrtrnwxbkatxrxce7swnk90ghwzxhc8uy&ep=v1_gifs_search&rid=giphy.gif&ct=g","https://media.tenor.com/JZtTu2zRXCsAAAAM/freddy-run-run.gif","https://velocityagency.com/wp-content/uploads/2023/04/giphy.gif","https://media.tenor.com/g0WrZAacacwAAAAM/dancing-sheriff-elevator.gif","https://media.tenor.com/6D23QLm_JxIAAAAd/mad-swag.gif","https://img1.picmix.com/output/pic/normal/8/0/4/7/11457408_4982d.gif","https://i.gifer.com/W4ym.gif"]
    @State var timeRemaining = 1
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   @State var currentCamera = 0
    @State var ScreenOn = true
    
    let data = (1...12).map { "Item \($0)" }

      let columns = [
        GridItem(.flexible()),
        GridItem(),
        GridItem(.flexible(minimum: 1, maximum: 9)),
               
      ]
    
    
    var body: some View {
        ZStack{
            Color(.black)
            if timeRemaining == 0 {
                GIFView(type: .url(URL(string: RoomArr[currentCamera])!))
    //                .clipShape(Rectangle())
                    .frame(width:388, height:291)
            }
           
            Image("\(cameraArr[currentCamera])")
                .resizable()
                .scaledToFit()
                .frame(width:400)
            
            
            
            Section{
                Button("1"){
                    currentCamera = 0
                    timeRemaining = 1
                }
                .offset(x:33, y:68)
                Button("2"){
                currentCamera = 1
                    timeRemaining = 1
                    }
                .onReceive(timer) { time in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
                .offset(x:90, y:68)
                Button("3"){
                    currentCamera = 2
                    timeRemaining = 1
                }
                .offset(x:33, y:42)
                Button("4"){
                    currentCamera = 3
                    timeRemaining = 1
                } .offset(x:88, y:42)
             
                Button("5"){
                    currentCamera = 4
                    timeRemaining = 1
                }
                .offset(x:38, y:105)
                Button("6"){
                    currentCamera = 5
                    timeRemaining = 1
                }
                .offset(x:83, y:105)
                Button("7"){
                    currentCamera = 6
                    timeRemaining = 1
                }.offset(x:96, y:19)
              
                Button("8"){
                    currentCamera = 7
                    timeRemaining = 1
                }
                .offset(x:36, y:14)
             
                Button("9"){
                    currentCamera = 8
                    timeRemaining = 1
                }
                .offset(x:158, y:2)
                Button("10"){
                    currentCamera = 9
                    timeRemaining = 1
                }
                .offset(x:130, y:49)
                Button("11"){
                    currentCamera = 10
                    timeRemaining = 1
                }
                .offset(x:171, y:31)
                Button("12"){
                    currentCamera = 11
                    timeRemaining = 1
                }
                .offset(x:165, y:67)
            }
            .foregroundStyle(.clear)
            
            
//            Text("\(timeRemaining)")
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
