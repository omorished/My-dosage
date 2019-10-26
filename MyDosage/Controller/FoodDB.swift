

import Foundation



class FoodDB{
    
    static var foodBasket: [Food] = []
    
    //(1) PROTEIN LIST
    static var proteinList: [Food] =
    [
Food(foodType: .protein, foodName: "لحم", amountUnit: "جرام", numberInArray: 0),
Food(foodType: .protein, foodName: "دجاج", amountUnit: "جرام", numberInArray: 1),
Food(foodType: .protein, foodName: "السمك", amountUnit: "جرام", numberInArray: 2),
Food(foodType: .protein, foodName: "بيض", amountUnit: "حبة", numberInArray: 3),
Food(foodType: .protein, foodName: "الجوز", amountUnit: "كوب", numberInArray: 4),
Food(foodType: .protein, foodName: "اللوز", amountUnit: "كوب", numberInArray: 5),
Food(foodType: .protein, foodName: "فستق", amountUnit: "كوب", numberInArray: 6),
Food(foodType: .protein, foodName: "الفول السوداني", amountUnit: "كوب", numberInArray: 7),
Food(foodType: .protein, foodName: "البندق", amountUnit: "كوب", numberInArray: 8),
Food(foodType: .protein, foodName: "بذور الكتان", amountUnit: "كوب", numberInArray: 9),
Food(foodType: .protein, foodName: "بذور اليقطين", amountUnit: "كوب", numberInArray: 10),
Food(foodType: .protein, foodName: "كاجو", amountUnit: "كوب", numberInArray: 11),
Food(foodType: .protein, foodName: "كستناء", amountUnit: "كوب", numberInArray: 12),
Food(foodType: .protein, foodName: "العدس", amountUnit: "كوب", numberInArray: 13),
Food(foodType: .protein, foodName: "الفول", amountUnit: "كوب", numberInArray: 14),
Food(foodType: .protein, foodName: "لوبيا", amountUnit: "كوب", numberInArray: 15),
Food(foodType: .protein, foodName: "فاصوليا", amountUnit: "كوب", numberInArray: 16),
Food(foodType: .protein, foodName: "حمص", amountUnit: "كوب", numberInArray: 17),
Food(foodType: .protein, foodName: "بازيلا", amountUnit: "كوب", numberInArray: 18)
        ]

    //(2) MILK AND DIARY
    static var milkAndDairyList: [Food] = [
Food(foodType: .milkAndDairy, foodName: "زبادي كامل الدسم", amountUnit: "مل", numberInArray: 0),
Food(foodType: .milkAndDairy, foodName: "زبادي قليل الدسم", amountUnit: "مل", numberInArray: 1),
Food(foodType: .milkAndDairy, foodName: "زبادي خالي الدسم", amountUnit: "مل", numberInArray: 2),
Food(foodType: .milkAndDairy, foodName: "زبادي يوناني ساده", amountUnit: "جم", numberInArray: 3),
Food(foodType: .milkAndDairy, foodName: "قشطة طازجة", amountUnit: "جم", numberInArray: 4),
Food(foodType: .milkAndDairy, foodName: "لبنة كاملة الدسم", amountUnit: "جم", numberInArray: 5),
Food(foodType: .milkAndDairy, foodName: "لبنة قليلة الدسم", amountUnit: "جم", numberInArray: 6),
Food(foodType: .milkAndDairy, foodName: "حليب كامل الدسم", amountUnit: "كوب", numberInArray: 7),
Food(foodType: .milkAndDairy, foodName: "حليب قليل الدسم", amountUnit: "كوب", numberInArray: 8),
Food(foodType: .milkAndDairy, foodName: "لبن كامل الدسم", amountUnit: "كوب", numberInArray: 9),
Food(foodType: .milkAndDairy, foodName: "لبن قليل الدسم", amountUnit: "كوب", numberInArray: 10),
Food(foodType: .milkAndDairy, foodName: "لبن خالي الدسم", amountUnit: "كوب", numberInArray: 11)
]
    
    //(3) Veg
    static var vegList: [Food] = [
Food(foodType: .veg, foodName: "جزر", amountUnit: "كوب", numberInArray: 0),
Food(foodType: .veg, foodName: "جزر", amountUnit: "كوب مطبوخ", numberInArray: 1),
Food(foodType: .veg, foodName: "بروكلي", amountUnit: "كوب", numberInArray: 2),
Food(foodType: .veg, foodName: "بروكلي", amountUnit: "كوب مطبوخ", numberInArray: 3),
Food(foodType: .veg, foodName: "شمندر", amountUnit: "كوب", numberInArray: 4),
Food(foodType: .veg, foodName: "شمندر", amountUnit: "كوب مطبوخ", numberInArray: 5),
Food(foodType: .veg, foodName: "فلفل رومي", amountUnit: "كوب", numberInArray: 6),
Food(foodType: .veg, foodName: "فلفل رومي", amountUnit: "كوب مطبوخ", numberInArray: 7),
Food(foodType: .veg, foodName: "طماطم", amountUnit: "كوب", numberInArray: 8),
Food(foodType: .veg, foodName: "طماطم", amountUnit: "كوب مطبوخ", numberInArray: 9),
Food(foodType: .veg, foodName: "بصل", amountUnit: "كوب", numberInArray: 10),
Food(foodType: .veg, foodName: "بصل", amountUnit: "كوب مطبوخ", numberInArray: 11),
Food(foodType: .veg, foodName: "فطر", amountUnit: "كوب", numberInArray: 12),
Food(foodType: .veg, foodName: "فطر", amountUnit: "كوب مطبوخ", numberInArray: 13),
Food(foodType: .veg, foodName: "سبانخ", amountUnit: "كوب", numberInArray: 14),
Food(foodType: .veg, foodName: "سبانخ", amountUnit: "كوب مطبوخ", numberInArray: 15),
Food(foodType: .veg, foodName: "كوسة", amountUnit: "كوب", numberInArray: 16),
Food(foodType: .veg, foodName: "كوسة", amountUnit: "كوب مطبوخ", numberInArray: 17),
Food(foodType: .veg, foodName: "ذرة مسلوقة", amountUnit: "كوب", numberInArray: 18),
Food(foodType: .veg, foodName: "بطاطس", amountUnit: "حبة صغيرة", numberInArray: 19),
Food(foodType: .veg, foodName: "بطاطا حلوة", amountUnit: "حبة صغيرة", numberInArray: 20),
Food(foodType: .veg, foodName: "باذنجان", amountUnit: "حبة كبيرة", numberInArray: 21),
Food(foodType: .veg, foodName: "قرع", amountUnit: "حبة", numberInArray: 22),
Food(foodType: .veg, foodName: "خس", amountUnit: "كوب", numberInArray: 23),
Food(foodType: .veg, foodName: "خيار", amountUnit: "حبة كبيرة", numberInArray: 24),
Food(foodType: .veg, foodName: "ملفوف", amountUnit: "كوب", numberInArray: 25),
Food(foodType: .veg, foodName: "بقدونس", amountUnit: "كوب", numberInArray: 26),
Food(foodType: .veg, foodName: "جرجير", amountUnit: "كوب", numberInArray: 27),
    ]

    //(4) Fruit
    static var fruitList: [Food] = [
Food(foodType: .fruit, foodName: "تفاحة", amountUnit: "حبة", numberInArray: 0),
Food(foodType: .fruit, foodName: "مشمش", amountUnit: "حبة", numberInArray: 1),
Food(foodType: .fruit, foodName: "توت اسود", amountUnit: "كوب", numberInArray: 2),
Food(foodType: .fruit, foodName: "توت ازرق", amountUnit: "كوب", numberInArray: 3),
Food(foodType: .fruit, foodName: "كزر", amountUnit: "حبة", numberInArray: 4),
Food(foodType: .fruit, foodName: "كيوي", amountUnit: "حبة", numberInArray: 5),
Food(foodType: .fruit, foodName: "كمثرى", amountUnit: "حبة", numberInArray: 6),
Food(foodType: .fruit, foodName: "برتقال", amountUnit: "حبة", numberInArray: 7),
Food(foodType: .fruit, foodName: "خوخ", amountUnit: "حبة", numberInArray: 8),
Food(foodType: .fruit, foodName: "موز", amountUnit: "حبة", numberInArray: 9),
Food(foodType: .fruit, foodName: "عنب", amountUnit: "حبة", numberInArray: 10),
Food(foodType: .fruit, foodName: "مانجو", amountUnit: "حبة", numberInArray: 11),
Food(foodType: .fruit, foodName: "برقوق", amountUnit: "حبة", numberInArray: 12),
Food(foodType: .fruit, foodName: "يوسفي", amountUnit: "حبة", numberInArray: 13),
Food(foodType: .fruit, foodName: "فراولة", amountUnit: "كوب", numberInArray: 14),
    ]
    
    
    //(5) Carbo
    static var carboList: [Food] = [
    
Food(foodType: .carbo, foodName: "ارز ابيض", amountUnit: "ملاعق", numberInArray: 0),
Food(foodType: .carbo, foodName: "ارز بني", amountUnit: "كوب", numberInArray: 1),
Food(foodType: .carbo, foodName: "يكنوا", amountUnit: "كوب", numberInArray: 2),
Food(foodType: .carbo, foodName: "خبز ابيض", amountUnit: "رغيف", numberInArray: 3),
Food(foodType: .carbo, foodName: "خبز بالنخالة", amountUnit: "رغيف", numberInArray: 4),
Food(foodType: .carbo, foodName: "خبز اسمر", amountUnit: "رغيف", numberInArray: 5),
Food(foodType: .carbo, foodName: "خبز بالشوفان", amountUnit: "شريحة صغيرة", numberInArray: 6),
Food(foodType: .carbo, foodName: "خبز البرجر", amountUnit: "الطبقة الاولى", numberInArray: 7),
Food(foodType: .carbo, foodName: "خبز البرجر", amountUnit: "الطبقة الثانية", numberInArray: 8),
Food(foodType: .carbo, foodName: "خبز التوست الابيض", amountUnit: "قطعة", numberInArray: 10),
Food(foodType: .carbo, foodName: "خبز التوست الاسمر", amountUnit: "قطعة", numberInArray: 11),
Food(foodType: .carbo, foodName: "خبز صامولي", amountUnit: "حبة", numberInArray: 12),
Food(foodType: .carbo, foodName: "شوفان", amountUnit: "ملعقة", numberInArray: 13),
Food(foodType: .carbo, foodName: "المعكرونة", amountUnit: "كوب", numberInArray: 14),
Food(foodType: .carbo, foodName: "الفشار", amountUnit: "كوب", numberInArray: 15),
Food(foodType: .carbo, foodName: "كورن فليكس", amountUnit: "كوب", numberInArray: 16),
Food(foodType: .carbo, foodName: "بسكويت", amountUnit: "شريحة", numberInArray: 17),
Food(foodType: .carbo, foodName: "شابورة", amountUnit: "شريحة", numberInArray: 18),
Food(foodType: .carbo, foodName: "حمص", amountUnit: "كوب", numberInArray: 18),


    
    ]
    
    
     static func getProteinList() -> [Food]{
        return proteinList
    }
    
    static func getMilkAndDairyList() -> [Food] {
        return milkAndDairyList
    }
    
    static func getVegList() -> [Food] {
        return vegList
    }
    
    static func getFruitList() -> [Food] {
        return fruitList
    }
    
    static func getCarboList() -> [Food] {
        return carboList
    }
    
    static func checkOrUncheckOnOriginalList(food: Food, isChecked: Bool){
        
        switch("\(food.foodType)"){
        case "protein":
        proteinList[food.numberInArray].checked = isChecked
        case "milkAndDairy":
        milkAndDairyList[food.numberInArray].checked = isChecked
        case "veg":
        vegList[food.numberInArray].checked = isChecked
        case "fruit":
        fruitList[food.numberInArray].checked = isChecked
        default :
        carboList[food.numberInArray].checked = isChecked

        }
    }
    
     static func getProperList(passTagNum: Int) -> [Food] {
        
        switch(passTagNum) {
               case 1: return proteinList
               case 2: return milkAndDairyList
               case 3: return vegList
               case 4: return fruitList
               default : return carboList
               }
        
    }
        
        static func addToBasket(food: Food) {
            foodBasket.append(food)
        }
        
        static func removeFromBasket(food: Food) {
            
            for num in 0...foodBasket.count-1 {
                if foodBasket[num].foodName == food.foodName {
                    foodBasket.remove(at: num)
                }
            
        }
    }
    
    
    
    }


