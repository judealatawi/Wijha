//
//  Intro.swift
//  Bookmarked
//
//  Created by Nouf  on 20/05/1444 AH.
//

import SwiftUI

//intro model and sample screen
struct Intro: Identifiable{
    
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var pic: String
    var color: Color
    var offset: CGSize = .zero
}

///*
//  Localizable.strings
//  Bookmarked
//
//  Created by Jude Alatawi on 25/05/1444 AH.
//
//*/
//"Category" = "قائمة";
//"Trending" = "رائج";
//"more" = "المزيد";
//"Latest" = "الجديد";
//"What is new in Riyadh" = "ماهو جديد بالرياض";
//
//"Nerd Cafe" = "نيرد كوفي ";
//"Riaydh Front" = "واجهة الرياض ";
//"Deep Brown" = "ديب براون";
//"Riyadh Park" = " الرياض بارك";
//"Playground" = "ملعب اطفال";
//"Boulevard" = "بلوفارد";
//"Knoll Library" = "مكتبة نوول ";
//"BLANCA" = "بلانكا";
//"Welcome" = "مرحبا";
//
