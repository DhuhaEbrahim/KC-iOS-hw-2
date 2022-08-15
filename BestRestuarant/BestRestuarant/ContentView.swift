//
//  ContentView.swift
//  BestRestuarant
//
//  Created by dhuha kaweyani on 15/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var dish1 = 0
    @State var dish2 = 0
    @State var dish3 = 0
    @State var dish4 = 0
    @State var dish5 = 0
    @State var dish6 = 0
    @State var dish7 = 0
    @State var dish8 = 0
    
    @State var usermoney = ""
    @State var fatoora = 0.0
    @State var condition = ""
    var body: some View {
        
        //background
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            
            VStack{
                
                //restuarant name and logo
                HStack{
                    Image("woknroll").resizable().frame(width: 100, height: 100)
                    Text("WOK N ROLL").font(.custom("NightinTokyo-Bold", fixedSize:40))}
                
                //each dish and its price
                ScrollView{
                row(name: "Dune Maki \t 4.750 KD", dish: $dish1)
                row(name: "Noodles \t 2.500 KD", dish: $dish2)
                row(name: "Fried Rice \t 3 KD", dish: $dish3)
                row(name: "Shrimp \t 5 KD", dish: $dish4)
                row(name: "Sushi \t 3.250 KD", dish: $dish5)
                row(name: "creamy Lobster \t 6 KD", dish: $dish6)
                row(name: "Spicy Salmon \t 3.500 KD", dish: $dish7)
                row(name: "Tum Yum soup \t 1.750 KD", dish: $dish8)
                }
                
                //user money
                HStack{
                    TextField("المبلغ", text: $usermoney)
                        .padding().frame(width: 100, height: 40).multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(.white).cornerRadius(10).foregroundColor(.black)
                    
                    Text("ادخل المبلغ الذي لديك الآن :")
                        .font(.system(size: 21, weight: .semibold))
                }.padding()
                
                //total price calculation
                Text("اضغط لمعرفة الفاتورة").padding().background(.gray.opacity(0.3)).cornerRadius(10)
                    .font(.system(size: 20, weight: .semibold))
                    .onTapGesture {
                        fatoora = (Double(dish1)) * 4.750 + (Double(dish2)) * 2.500 + (Double(dish3)) * 3 + (Double(dish4)) * 5 + (Double(dish5)) * 3.250 + (Double(dish6)) * 6 + (Double(dish7)) * 3.500 + (Double(dish8)) * 1.750
                        
                        if (Double(usermoney) ?? 0) >= (Double(fatoora)){
                            
                            condition = "تمت العملية بنجاح!"
                            
                        }
                        else if usermoney == ""       //bonus
                        {
                            condition = "عفوا، ادخل المبلغ الذي لديك اولا"
                            
                        }
                        else{
                            condition = "عفوا، لا يوجد مال كافي لاتمام العملية"
                            
                        }
                        
                    }
                //total price print
                VStack{
                    Text("المبلغ الاجمالي هو : \(fatoora)\n").font(.system(size: 20, weight: .semibold))
                    
                    Text("\(condition)").foregroundColor(.red).font(.system(size: 20, weight: .black))
                }
            }
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}

struct row: View {
    
    @State var name : String
    @Binding var dish : Int
    var body: some View {
        HStack{
            
            Stepper(name, value: $dish, in: 0...100, step: 1)      //bonus
                .font(.custom("IowanOldStyle-Roman", size: 20))
            
            
            Text("\(dish)")
            
        }.padding().background(.gray.opacity(0.3))
    }
}
