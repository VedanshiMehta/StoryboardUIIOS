//
//  CardModel.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 05/01/26.
//
class CardModel {

    func getCardData() -> [Card] {
        let cards = [
            Card(
                imageName:
                    "https://img.freepik.com/premium-photo/image-person-with-orange-shirt-that-says-power-man_1034560-66053.jpg?semt=ais_hybrid&w=740&q=80",
                characName: "Goku",
                characterDescription: "The main protagonist, Saiyan warrior.",
                family: [
                    Family(
                        imageName:
                            "https://dragonball.guru/wp-content/uploads/2021/03/Chi-Chi-Profile-Pic-415x415.png",
                        characName: "Chi Chi",
                        characterRelation: "Spouse",
                        characterDescription: "Goku's Spouse"
                    ),
                    Family(
                        imageName:
                            "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2025/06/beast-gohan.jpg?w=1600&h=900&fit=crop",
                        characName: "Gohan",
                        characterRelation: "Son",
                        characterDescription: "Goku's eldest son."
                    ),
                    Family(
                        imageName:
                            "https://i.ytimg.com/vi/I7Knp0KhpwU/maxresdefault.jpg",
                        characName: "Goten",
                        characterRelation: "Son",
                        characterDescription: "Goku's youngest son."
                    ),
                    Family(
                        imageName:
                            "https://www.superherotoystore.com/cdn/shop/articles/1191116_4800x.jpg?v=1727433152",
                        characName: "Pan",
                        characterRelation: "Grand Daughter",
                        characterDescription: "Grand-Daughter of Goku."
                    ),
                ]

            ),
            Card(
                imageName:
                    "https://www.xtrafondos.com/wallpapers/super-saiyan-blue-vegeta-dragon-ball-super-3044.jpg",
                characName: "Vegeta",
                characterDescription: "The prince of all Saiyans.",
                family: [
                    Family(
                        imageName:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR3xvvTVMLCAQsX6zu9hAERNr0zdi668K8lA&s",
                        characName: "Bulma",
                        characterRelation: "Spouse",
                        characterDescription:
                            "Vegetas's wife, a brilliant scientist."
                    ),
                    Family(
                        imageName:
                            "https://static.wikia.nocookie.net/dragonuniverse/images/f/fb/Trunks_DBK124.png/revision/latest?cb=20160910222512",
                        characName: "Trunks",
                        characterRelation: "Friend's Son",
                        characterDescription:
                            "Vegeta's son, Goten's best friend."
                    ),
                    Family(
                        imageName:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0iuzXwbh-kTaE0eCyo7Qe98iDeMbIceqIgA&s",
                        characName: "Bulla",
                        characterRelation: "Daughter",
                        characterDescription: "Daughter of Vegeta and Bulma."
                    ),
                ]
            ),
            Card(
                imageName:
                    "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2025/06/beast-gohan.jpg?w=1600&h=900&fit=crop",
                characName: "Gohan",
                characterDescription: "Goku's youngest son.",
                family: [
                    Family(
                        imageName:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeSsR8CYs1BtzQwBR8BR-Niy4SVrTmCAksGg&s",
                        characName: "Videl",
                        characterRelation: "Spouse",
                        characterDescription: "Gohan's wife."
                    ),
                    Family(
                        imageName:
                            "https://www.superherotoystore.com/cdn/shop/articles/1191116_4800x.jpg?v=1727433152",
                        characName: "Pan",
                        characterRelation: "Daughter",
                        characterDescription: "Daughter of Gohan and Videl."
                    ),
                ]
            ),
            
        ]
        return cards
    }
}
