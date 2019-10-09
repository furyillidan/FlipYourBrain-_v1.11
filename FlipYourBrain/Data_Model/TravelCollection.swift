//
//  travelCollection.swift
//  FlipYourBrain
//
//  Created by Neo on 2018/2/4.
//  Copyright © 2018年 Cinard Digital Media Institute. All rights reserved.
//

import Foundation
import UIKit



let travelEn =
    ["bank","train \nstation","hotel","airport","restaurant",       //1
     "museum","metro","bakery","bar","platform",
     "bus \nstop","cafe","change \nbureau","pharmacy","hospital",
     "post \nbox","public \ntoilet","travel \nagency","youth \nhostel","Address",
     "Airline","Alien","Arrival","Avenue","terminal",               //5
     "Baggage","Birth Day","Birth Place","Boarding \nPass","Book",
     "Buffet","Business \nClass","Bus \nStop","Carrier","Cash",
     "Cabin","Cancellation","Carry-on","Check","Check-in",
     "Check-out","Citizen","Claim \nTag","Condition","Confirmation",
     "Transfer","Country","Currency \nExchange","Customs","Declaration",    //10
     "Departure","Destination","Direct \nFlight","Domestic \nFlight","Double \nOccupancy",
     "standby","aisle \nseat","window seat","emergency \nexit","captain",
     "round-trip \nticket","one-way \nticket","return \nticket","daily \nticket","flight",
     "transfer","take off","airsick","landing","arrival \ntime",
     "departure \ntime","Economy \nClass","Electronic \nTicket","Travel \nExpedition","Extend",   //15
     "Fare","Fair \nRule","Farm","Female","Finger \nPrint",
     "First \nClass","First \nName","Flight \nAttendant","Flight \nNumber","Flight \nSchedule",
     "Foreign \nCurrency","Form","Freeway","Gate","Gratuity",
     "Gift","Hotel","Hostel"]





let travelCh =
    ["銀行","火車站","飯店","機場","餐廳",        //1
     "博物館","地鐵","麵包店","酒吧","月台",
     "公車站","咖啡廳","兌換錢的地方","藥局","醫院",
     "郵筒","公共廁所","旅行社","青年旅館","地址",
     "航空公司","外籍人士","入境,到達","大道","航廈",   //5
     "行李","生日","出生地","登機證","書",
     "自助餐","商務艙","公車站","航空公司","現金",
     "小木屋","取消","手提行李","支票,檢查","入住登記",
     "結帳","國民","託運收據","條件","確認",
     "轉機","國家","外幣兌換","海關","申報",           //10
     "出境","目的地","直飛","國內航班","雙人房",
     "候補機位","走道座位","靠窗座位","緊急出口","機長",
     "來回票","單程票","回程票","單日票","航班",
     "轉機","起飛","暈機","降落","到達時間",
     "出發時間","經濟艙","電子機票","遠征,探險","延期",     //15
     "票價","票價規定","農場","女性","指紋",
     "頭等","名","空服員","班機號碼","航班時刻表",
     "外幣兌換","表格","高速公路","門","小費",
     "禮物","旅館","民宿"]







//I
//
//* I-20：美國學校發給的入學許可
//* I-94：美國海關入境卡
//* ID：同 Identification
//* Identification：身分證，證明文件
//* Immigration：移民
//* Immigration and Naturalization Service：美國移民局
//* Insurance：保險
//* International Flight：國際航班
//* Issued：發給
//* Itinerary：行程表，班機行程表
//
//J
//
//* Journey：旅行，旅程，旅途
//
//K
//
//L
//
//* Label：標籤
//* Landing：著陸
//* Life Jacket：救生衣
//* Limousine：加長轎車，禮車，機場巴士，機場接送的豪華房車
//* Lobby：大廳
//* Luggage：行李，皮箱
//
//M
//
//* Maid：女侍者
//* Male：男性
//* Map：地圖
//* Merchandise：商品
//* Middle Initial：中間名，通常為第一個字母。如林大于，英文翻譯為 Lin, Da Yu，中間名就為 Y。
//* Money Order：匯票，現金支票
//* Museum：博物館
//
//N
//
//* Non-refundable Ticket：不可退票或更改行程的機票
//* Non-stop：直達
//
//O
//
//* One-way：單程
//* Open：開，開放，開幕
//* Origin：起點
//* Overweight：超重
//
//P
//
//* Package：包裹，組合，套餐
//* Parking：停車場
//* Pass：證照，票，門票
//* Passenger：旅客，乘客
//* Passport Number：護照號碼
//* Passenger Train：客車
//* Payphone：公用電話，付費電話
//* Penalty：罰款
//* Platform：月台
//* Ports of call：停靠港口
//* Published Fare：公告費用
//* Public Phone：公用電話〈同 Payphone〉
//* Public Transportation：大眾運輸
//* Purpose：目的
//
//Q
//
//R
//
//* Rail：鐵路，鐵軌
//* Ranch：牧場
//* Reception：接待，接待處
//* Refundable Fare：可退款或更改的機票
//* Rental：出租，租賃
//* Reservation：預訂
//* Residence：居留，居住地
//* Restricted Fares：有限制的機票價格
//* Restroom：廁所
//* Return：回，返回
//* Round-Trip：來回，雙程
//* Route：路線，路徑
//
//S
//
//* Sail：帆，航行
//* Sailing boat：帆船
//* Sale：售，賣
//* Sales：銷售員
//* Sales Tax：銷售稅
//* Sex：性別，性
//* Shuttle：班車
//* Single：單身，單人
//* Single Room：單人房
//* Snow：雪，下雪
//* Soup：湯
//* Special：特別的
//* State：州，狀況
//* Station：車站
//* Status：狀況
//* Stay：停留，留下
//* Street：街
//* Stopover：中途下機，過境
//
//T
//
//* Tax：稅
//* Taxi：計程車，出租車
//* Terminal：航站，終點站
//* Ticket：票，罰單
//* Timetable：時刻表
//* Tip：小費，賞錢
//* Train：鐵路，練習
//* Transfer：轉車，換車，轉移
//* Translate：翻譯
//* Transport：運輸
//* Traveler's check：旅行支票
//* Tour：旅遊，旅行社，旅行團
//* Tourist：遊客
//
//U
//
//* University：大學
//
//V
//
//* Vacant：空
//* Valet Parking：代客停車，代客泊車
//* Valid：有效，確實
//* Value：價值，，估價，重要
//* Vegetable：蔬菜
//* Vinegar：醋
//* Vinery：葡萄園，酒廠
//* Vineyard：葡萄園
//* Visa：簽證
//* Visit：訪問，參觀，遊覽
//
//W
//
//* Waiter：男餐館服務員
//* Waiting List：候補名單
//* Waitress：女餐館服務員
//* Weather：天氣，氣象
//* Weekday：週末以外的任何一天
//* Weekend：週末〈通常自星期五下午至星期日晚間〉
//
//X
//
//Y
//
//* Yacht：遊艇

