//
//  MenuDataSource.swift
//  CollectionViewDiffableDataSource
//
//  Created by Alex Diaz on 31/8/24.
//

import Foundation

/// Representable se refiere a un protocolo
protocol MenuDataSourceRepresentable {
    func getMenuItems(query: String) -> [MenuModel]
}

class MockMenuDataSource: MenuDataSourceRepresentable {
    // TODO: - Add implementation
    func getMenuItems(query: String) -> [MenuModel] {
        return menuItems
    }
    // MARK: - Private
    private let menuItems: [MenuModel] = [
        MenuModel(
            id: "1",
            name: "Panqueques con Jarabe",
            price: 6.99,
            image: "panqueques_con_jarabe",
            type: .breakfast,
            description: "Panqueques esponjosos servidos con jarabe de arce y mantequilla."
        ),
        MenuModel(
            id: "2",
            name: "Tocino y Huevos",
            price: 7.49,
            image: "tocino_y_huevos",
            type: .breakfast,
            description: "Clásica combinación de desayuno con tocino crujiente y huevos fritos."
        ),
        MenuModel(
            id: "3",
            name: "Ensalada de Pollo a la Parrilla",
            price: 9.99,
            image: "ensalada_de_pollo_a_la_parrilla",
            type: .mainCourse,
            description: "Ensalada saludable con pollo a la parrilla, lechuga y aderezo de vinagreta."
        ),
        MenuModel(
            id: "4",
            name: "Espagueti a la Carbonara",
            price: 12.49,
            image: "espagueti_a_la_carbonara",
            type: .mainCourse,
            description: "Plato de pasta italiana con una salsa cremosa hecha con huevos, queso y panceta."
        ),
        MenuModel(
            id: "5",
            name: "Chuleta de T-Bone",
            price: 19.99,
            image: "chuleta_de_t_bone",
            type: .mainCourse,
            description: "Jugosa chuleta de T-Bone cocinada a la perfección, servida con verduras asadas."
        ),
        MenuModel(
            id: "6",
            name: "Cappuccino",
            price: 3.99,
            image: "cappuccino",
            type: .drink,
            description: "Bebida rica y espumosa a base de espresso, cubierta con leche vaporizada."
        ),
        MenuModel(
            id: "7",
            name: "Jugo de Naranja",
            price: 2.99,
            image: "jugo_de_naranja",
            type: .drink,
            description: "Jugo de naranja recién exprimido, perfecto para una bebida refrescante."
        ),
        MenuModel(
            id: "8",
            name: "Tarta de Queso",
            price: 5.49,
            image: "tarta_de_queso",
            type: .dessert,
            description: "Tarta de queso cremosa y rica con una base de galletas graham."
        ),
        MenuModel(
            id: "9",
            name: "Pastel de Lava de Chocolate",
            price: 6.49,
            image: "pastel_de_lava_de_chocolate",
            type: .dessert,
            description: "Pastel de chocolate caliente con un centro de chocolate fundido."
        ),
        MenuModel(
            id: "10",
            name: "Latte Helado",
            price: 4.49,
            image: "latte_helado",
            type: .drink,
            description: "Bebida fría a base de espresso con leche y hielo."
        ),
        MenuModel(
            id: "11",
            name: "Croissant con Jamón y Queso",
            price: 5.99,
            image: "croissant_con_jamon_y_queso",
            type: .breakfast,
            description: "Delicioso croissant relleno de jamón y queso fundido."
        ),
        MenuModel(
            id: "12",
            name: "Omelette de Espinacas",
            price: 6.49,
            image: "omelette_de_espinacas",
            type: .breakfast,
            description: "Omelette ligero con espinacas frescas y queso cheddar."
        ),
        MenuModel(
            id: "13",
            name: "Hamburguesa Clásica",
            price: 8.99,
            image: "hamburguesa_clasica",
            type: .mainCourse,
            description: "Jugosa hamburguesa de res con lechuga, tomate, queso y salsa especial."
        ),
        MenuModel(
            id: "14",
            name: "Tacos de Carnitas",
            price: 7.99,
            image: "tacos_de_carnitas",
            type: .mainCourse,
            description: "Tacos rellenos de carnitas tiernas, cebolla, cilantro y salsa verde."
        ),
        MenuModel(
            id: "15",
            name: "Pechuga de Pollo a la Parrilla",
            price: 10.49,
            image: "pechuga_de_pollo_a_la_parrilla",
            type: .mainCourse,
            description: "Pechuga de pollo marinada y asada a la parrilla, servida con arroz y vegetales."
        ),
        MenuModel(
            id: "16",
            name: "Limonada",
            price: 2.49,
            image: "limonada",
            type: .drink,
            description: "Limonada fresca hecha con limones naturales, perfecta para el verano."
        ),
        MenuModel(
            id: "17",
            name: "Té Helado",
            price: 2.99,
            image: "te_helado",
            type: .drink,
            description: "Té helado refrescante con un toque de limón."
        ),
        MenuModel(
            id: "18",
            name: "Brownie de Chocolate",
            price: 3.99,
            image: "brownie_de_chocolate",
            type: .dessert,
            description: "Delicioso brownie de chocolate con nueces y una textura suave y esponjosa."
        ),
        MenuModel(
            id: "19",
            name: "Helado de Vainilla",
            price: 3.49,
            image: "helado_de_vainilla",
            type: .dessert,
            description: "Clásico helado de vainilla, perfecto para acompañar cualquier postre."
        ),
        MenuModel(
            id: "20",
            name: "Smoothie de Fresa",
            price: 4.49,
            image: "smoothie_de_fresa",
            type: .drink,
            description: "Bebida suave y refrescante hecha con fresas frescas y yogurt."
        )
    ]
}
