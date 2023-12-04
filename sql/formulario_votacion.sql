/*
 Navicat Premium Data Transfer

 Source Server         : conexion local
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : formulario_votacion

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 11/11/2023 12:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `idCandidato` int NULL DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creacion` date NULL DEFAULT NULL,
  `activo` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES (1, 'Primer Candidato', '2023-11-09', 1);
INSERT INTO `candidatos` VALUES (2, 'Segundo Candidato', '2023-11-09', 1);

-- ----------------------------
-- Table structure for comunas
-- ----------------------------
DROP TABLE IF EXISTS `comunas`;
CREATE TABLE `comunas`  (
  `idComuna` int NOT NULL AUTO_INCREMENT,
  `id_region` int NULL DEFAULT NULL,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activo` int NULL DEFAULT NULL,
  PRIMARY KEY (`idComuna`) USING BTREE,
  INDEX `fk_region`(`id_region` ASC) USING BTREE,
  CONSTRAINT `fk_region` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`idRegion`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comunas
-- ----------------------------
INSERT INTO `comunas` VALUES (1, 1, 'Arica', 1);
INSERT INTO `comunas` VALUES (2, 1, 'Camarones', 1);
INSERT INTO `comunas` VALUES (3, 1, 'Putre', 1);
INSERT INTO `comunas` VALUES (4, 1, 'General Lagos', 1);
INSERT INTO `comunas` VALUES (5, 2, 'Iquique', 1);
INSERT INTO `comunas` VALUES (6, 2, 'Alto Hospicio', 1);
INSERT INTO `comunas` VALUES (7, 2, 'Pozo Almonte', 1);
INSERT INTO `comunas` VALUES (8, 2, 'Camiña', 1);
INSERT INTO `comunas` VALUES (9, 2, 'Colchane', 1);
INSERT INTO `comunas` VALUES (10, 2, 'Huara', 1);
INSERT INTO `comunas` VALUES (11, 2, 'Pica', 1);
INSERT INTO `comunas` VALUES (12, 3, 'Antofagasta', 1);
INSERT INTO `comunas` VALUES (13, 3, 'Mejillones', 1);
INSERT INTO `comunas` VALUES (14, 3, 'Sierra Gorda', 1);
INSERT INTO `comunas` VALUES (15, 3, 'Taltal', 1);
INSERT INTO `comunas` VALUES (16, 3, 'Calama', 1);
INSERT INTO `comunas` VALUES (17, 3, 'Ollagüe', 1);
INSERT INTO `comunas` VALUES (18, 3, 'San Pedro de Atacama', 1);
INSERT INTO `comunas` VALUES (19, 3, 'Tocopilla', 1);
INSERT INTO `comunas` VALUES (20, 3, 'María Elena', 1);
INSERT INTO `comunas` VALUES (21, 4, 'Copiapó', 1);
INSERT INTO `comunas` VALUES (22, 4, 'Caldera', 1);
INSERT INTO `comunas` VALUES (23, 4, 'Tierra Amarilla', 1);
INSERT INTO `comunas` VALUES (24, 4, 'Chañaral', 1);
INSERT INTO `comunas` VALUES (25, 4, 'Diego de Almagro', 1);
INSERT INTO `comunas` VALUES (26, 4, 'Vallenar', 1);
INSERT INTO `comunas` VALUES (27, 4, 'Alto del Carmen', 1);
INSERT INTO `comunas` VALUES (28, 4, 'Freirina', 1);
INSERT INTO `comunas` VALUES (29, 4, 'Huasco', 1);
INSERT INTO `comunas` VALUES (30, 5, 'La Serena', 1);
INSERT INTO `comunas` VALUES (31, 5, 'Coquimbo', 1);
INSERT INTO `comunas` VALUES (32, 5, 'Andacollo', 1);
INSERT INTO `comunas` VALUES (33, 5, 'La Higuera', 1);
INSERT INTO `comunas` VALUES (34, 5, 'Paihuano', 1);
INSERT INTO `comunas` VALUES (35, 5, 'Vicuña', 1);
INSERT INTO `comunas` VALUES (36, 5, 'Illapel', 1);
INSERT INTO `comunas` VALUES (37, 5, 'Canela', 1);
INSERT INTO `comunas` VALUES (38, 5, 'Los Vilos', 1);
INSERT INTO `comunas` VALUES (39, 5, 'Salamanca', 1);
INSERT INTO `comunas` VALUES (40, 5, 'Ovalle', 1);
INSERT INTO `comunas` VALUES (41, 5, 'Combarbalá', 1);
INSERT INTO `comunas` VALUES (42, 5, 'Monte Patria', 1);
INSERT INTO `comunas` VALUES (43, 5, 'Punitaqui', 1);
INSERT INTO `comunas` VALUES (44, 5, 'Río Hurtado', 1);
INSERT INTO `comunas` VALUES (45, 6, 'Valparaíso', 1);
INSERT INTO `comunas` VALUES (46, 6, 'Casablanca', 1);
INSERT INTO `comunas` VALUES (47, 6, 'Concón', 1);
INSERT INTO `comunas` VALUES (48, 6, 'Juan Fernández', 1);
INSERT INTO `comunas` VALUES (49, 6, 'Puchuncaví', 1);
INSERT INTO `comunas` VALUES (50, 6, 'Quintero', 1);
INSERT INTO `comunas` VALUES (51, 6, 'Viña del Mar', 1);
INSERT INTO `comunas` VALUES (52, 6, 'Isla de Pascua', 1);
INSERT INTO `comunas` VALUES (53, 6, 'Los Andes', 1);
INSERT INTO `comunas` VALUES (54, 6, 'Calle Larga', 1);
INSERT INTO `comunas` VALUES (55, 6, 'Rinconada', 1);
INSERT INTO `comunas` VALUES (56, 6, 'San Esteban', 1);
INSERT INTO `comunas` VALUES (57, 6, 'La Ligua', 1);
INSERT INTO `comunas` VALUES (58, 6, 'Cabildo', 1);
INSERT INTO `comunas` VALUES (59, 6, 'Papudo', 1);
INSERT INTO `comunas` VALUES (60, 6, 'Petorca', 1);
INSERT INTO `comunas` VALUES (61, 6, 'Zapallar', 1);
INSERT INTO `comunas` VALUES (62, 6, 'Quillota', 1);
INSERT INTO `comunas` VALUES (63, 6, 'La Calera', 1);
INSERT INTO `comunas` VALUES (64, 6, 'Hijuelas', 1);
INSERT INTO `comunas` VALUES (65, 6, 'La Cruz', 1);
INSERT INTO `comunas` VALUES (66, 6, 'Nogales', 1);
INSERT INTO `comunas` VALUES (67, 6, 'San Antonio', 1);
INSERT INTO `comunas` VALUES (68, 6, 'Algarrobo', 1);
INSERT INTO `comunas` VALUES (69, 6, 'Cartagena', 1);
INSERT INTO `comunas` VALUES (70, 6, 'El Quisco', 1);
INSERT INTO `comunas` VALUES (71, 6, 'El Tabo', 1);
INSERT INTO `comunas` VALUES (72, 6, 'Santo Domingo', 1);
INSERT INTO `comunas` VALUES (73, 6, 'San Felipe', 1);
INSERT INTO `comunas` VALUES (74, 6, 'Catemu', 1);
INSERT INTO `comunas` VALUES (75, 6, 'Llay-Llay', 1);
INSERT INTO `comunas` VALUES (76, 6, 'Panquehue', 1);
INSERT INTO `comunas` VALUES (77, 6, 'Putaendo', 1);
INSERT INTO `comunas` VALUES (78, 6, 'Santa María', 1);
INSERT INTO `comunas` VALUES (79, 6, 'Quilpué', 1);
INSERT INTO `comunas` VALUES (80, 6, 'Limache', 1);
INSERT INTO `comunas` VALUES (81, 6, 'Olmué', 1);
INSERT INTO `comunas` VALUES (82, 6, 'Villa Alemana', 1);
INSERT INTO `comunas` VALUES (83, 8, 'Rancagua', 1);
INSERT INTO `comunas` VALUES (84, 8, 'Codegua', 1);
INSERT INTO `comunas` VALUES (85, 8, 'Coinco', 1);
INSERT INTO `comunas` VALUES (86, 8, 'Coltauco', 1);
INSERT INTO `comunas` VALUES (87, 8, 'Doñihue', 1);
INSERT INTO `comunas` VALUES (88, 8, 'Graneros', 1);
INSERT INTO `comunas` VALUES (89, 8, 'Las Cabras', 1);
INSERT INTO `comunas` VALUES (90, 8, 'Machalí', 1);
INSERT INTO `comunas` VALUES (91, 8, 'Malloa', 1);
INSERT INTO `comunas` VALUES (92, 8, 'Mostazal', 1);
INSERT INTO `comunas` VALUES (93, 8, 'Olivar', 1);
INSERT INTO `comunas` VALUES (94, 8, 'Peumo', 1);
INSERT INTO `comunas` VALUES (95, 8, 'Pichidegua', 1);
INSERT INTO `comunas` VALUES (96, 8, 'Quinta de Tilcoco', 1);
INSERT INTO `comunas` VALUES (97, 8, 'Rengo', 1);
INSERT INTO `comunas` VALUES (98, 8, 'Requínoa', 1);
INSERT INTO `comunas` VALUES (99, 8, 'San Vicente', 1);
INSERT INTO `comunas` VALUES (100, 8, 'Pichilemu', 1);
INSERT INTO `comunas` VALUES (101, 8, 'La Estrella', 1);
INSERT INTO `comunas` VALUES (102, 8, 'Litueche', 1);
INSERT INTO `comunas` VALUES (103, 8, 'Marchihue', 1);
INSERT INTO `comunas` VALUES (104, 8, 'Navidad', 1);
INSERT INTO `comunas` VALUES (105, 8, 'Paredones', 1);
INSERT INTO `comunas` VALUES (106, 8, 'San Fernando', 1);
INSERT INTO `comunas` VALUES (107, 8, 'Chépica', 1);
INSERT INTO `comunas` VALUES (108, 8, 'Chimbarongo', 1);
INSERT INTO `comunas` VALUES (109, 8, 'Lolol', 1);
INSERT INTO `comunas` VALUES (110, 8, 'Nancagua', 1);
INSERT INTO `comunas` VALUES (111, 8, 'Palmilla', 1);
INSERT INTO `comunas` VALUES (112, 8, 'Peralillo', 1);
INSERT INTO `comunas` VALUES (113, 8, 'Placilla', 1);
INSERT INTO `comunas` VALUES (114, 8, 'Pumanque', 1);
INSERT INTO `comunas` VALUES (115, 8, 'Santa Cruz', 1);
INSERT INTO `comunas` VALUES (116, 9, 'Talca', 1);
INSERT INTO `comunas` VALUES (117, 9, 'Constitución', 1);
INSERT INTO `comunas` VALUES (118, 9, 'Curepto', 1);
INSERT INTO `comunas` VALUES (119, 9, 'Empedrado', 1);
INSERT INTO `comunas` VALUES (120, 9, 'Maule', 1);
INSERT INTO `comunas` VALUES (121, 9, 'Pelarco', 1);
INSERT INTO `comunas` VALUES (122, 9, 'Pencahue', 1);
INSERT INTO `comunas` VALUES (123, 9, 'Río Claro', 1);
INSERT INTO `comunas` VALUES (124, 9, 'San Clemente', 1);
INSERT INTO `comunas` VALUES (125, 9, 'San Rafael', 1);
INSERT INTO `comunas` VALUES (126, 9, 'Cauquenes', 1);
INSERT INTO `comunas` VALUES (127, 9, 'Chanco', 1);
INSERT INTO `comunas` VALUES (128, 9, 'Pelluhue', 1);
INSERT INTO `comunas` VALUES (129, 9, 'Curicó', 1);
INSERT INTO `comunas` VALUES (130, 9, 'Hualañé', 1);
INSERT INTO `comunas` VALUES (131, 9, 'Licantén', 1);
INSERT INTO `comunas` VALUES (132, 9, 'Molina', 1);
INSERT INTO `comunas` VALUES (133, 9, 'Rauco', 1);
INSERT INTO `comunas` VALUES (134, 9, 'Romeral', 1);
INSERT INTO `comunas` VALUES (135, 9, 'Sagrada Familia', 1);
INSERT INTO `comunas` VALUES (136, 9, 'Teno', 1);
INSERT INTO `comunas` VALUES (137, 9, 'Vichuquén', 1);
INSERT INTO `comunas` VALUES (138, 9, 'Linares', 1);
INSERT INTO `comunas` VALUES (139, 9, 'Colbún', 1);
INSERT INTO `comunas` VALUES (140, 9, 'Longaví', 1);
INSERT INTO `comunas` VALUES (141, 9, 'Parral', 1);
INSERT INTO `comunas` VALUES (142, 9, 'Retiro', 1);
INSERT INTO `comunas` VALUES (143, 9, 'San Javier', 1);
INSERT INTO `comunas` VALUES (144, 9, 'Villa Alegre', 1);
INSERT INTO `comunas` VALUES (145, 9, 'Yerbas Buenas', 1);
INSERT INTO `comunas` VALUES (146, 10, 'Chillán', 1);
INSERT INTO `comunas` VALUES (147, 10, 'Bulnes', 1);
INSERT INTO `comunas` VALUES (148, 10, 'Chillán Viejo', 1);
INSERT INTO `comunas` VALUES (149, 10, 'El Carmen', 1);
INSERT INTO `comunas` VALUES (150, 10, 'Pemuco', 1);
INSERT INTO `comunas` VALUES (151, 10, 'Pinto', 1);
INSERT INTO `comunas` VALUES (152, 10, 'Quillón', 1);
INSERT INTO `comunas` VALUES (153, 10, 'San Ignacio', 1);
INSERT INTO `comunas` VALUES (154, 10, 'Yungay', 1);
INSERT INTO `comunas` VALUES (155, 10, 'Quirihue', 1);
INSERT INTO `comunas` VALUES (156, 10, 'Cobquecura', 1);
INSERT INTO `comunas` VALUES (157, 10, 'Coelemu', 1);
INSERT INTO `comunas` VALUES (158, 10, 'Ninhue', 1);
INSERT INTO `comunas` VALUES (159, 10, 'Portezuelo', 1);
INSERT INTO `comunas` VALUES (160, 10, 'Ránquil', 1);
INSERT INTO `comunas` VALUES (161, 10, 'Treguaco', 1);
INSERT INTO `comunas` VALUES (162, 10, 'San Carlos', 1);
INSERT INTO `comunas` VALUES (163, 10, 'Coihueco', 1);
INSERT INTO `comunas` VALUES (164, 10, 'Ñiquén', 1);
INSERT INTO `comunas` VALUES (165, 10, 'San Fabián', 1);
INSERT INTO `comunas` VALUES (166, 10, 'San Nicolás', 1);
INSERT INTO `comunas` VALUES (167, 11, 'Concepción', 1);
INSERT INTO `comunas` VALUES (168, 11, 'Coronel', 1);
INSERT INTO `comunas` VALUES (169, 11, 'Chiguayante', 1);
INSERT INTO `comunas` VALUES (170, 11, 'Florida', 1);
INSERT INTO `comunas` VALUES (171, 11, 'Hualqui', 1);
INSERT INTO `comunas` VALUES (172, 11, 'Lota', 1);
INSERT INTO `comunas` VALUES (173, 11, 'Penco', 1);
INSERT INTO `comunas` VALUES (174, 11, 'San Pedro de La Paz', 1);
INSERT INTO `comunas` VALUES (175, 11, 'Santa Juana', 1);
INSERT INTO `comunas` VALUES (176, 11, 'Talcahuano', 1);
INSERT INTO `comunas` VALUES (177, 11, 'Tomé', 1);
INSERT INTO `comunas` VALUES (178, 11, 'Hualpén', 1);
INSERT INTO `comunas` VALUES (179, 11, 'Lebu', 1);
INSERT INTO `comunas` VALUES (180, 11, 'Arauco', 1);
INSERT INTO `comunas` VALUES (181, 11, 'Cañete', 1);
INSERT INTO `comunas` VALUES (182, 11, 'Contulmo', 1);
INSERT INTO `comunas` VALUES (183, 11, 'Curanilahue', 1);
INSERT INTO `comunas` VALUES (184, 11, 'Los Álamos', 1);
INSERT INTO `comunas` VALUES (185, 11, 'Tirúa', 1);
INSERT INTO `comunas` VALUES (186, 11, 'Los Ángeles', 1);
INSERT INTO `comunas` VALUES (187, 11, 'Antuco', 1);
INSERT INTO `comunas` VALUES (188, 11, 'Cabrero', 1);
INSERT INTO `comunas` VALUES (189, 11, 'Laja', 1);
INSERT INTO `comunas` VALUES (190, 11, 'Mulchén', 1);
INSERT INTO `comunas` VALUES (191, 11, 'Nacimiento', 1);
INSERT INTO `comunas` VALUES (192, 11, 'Negrete', 1);
INSERT INTO `comunas` VALUES (193, 11, 'Quilaco', 1);
INSERT INTO `comunas` VALUES (194, 11, 'Quilleco', 1);
INSERT INTO `comunas` VALUES (195, 11, 'San Rosendo', 1);
INSERT INTO `comunas` VALUES (196, 11, 'Santa Bárbara', 1);
INSERT INTO `comunas` VALUES (197, 11, 'Tucapel', 1);
INSERT INTO `comunas` VALUES (198, 11, 'Yumbel', 1);
INSERT INTO `comunas` VALUES (199, 11, 'Alto Biobío', 1);
INSERT INTO `comunas` VALUES (200, 12, 'Temuco', 1);
INSERT INTO `comunas` VALUES (201, 12, 'Carahue', 1);
INSERT INTO `comunas` VALUES (202, 12, 'Cunco', 1);
INSERT INTO `comunas` VALUES (203, 12, 'Curarrehue', 1);
INSERT INTO `comunas` VALUES (204, 12, 'Freire', 1);
INSERT INTO `comunas` VALUES (205, 12, 'Galvarino', 1);
INSERT INTO `comunas` VALUES (206, 12, 'Gorbea', 1);
INSERT INTO `comunas` VALUES (207, 12, 'Lautaro', 1);
INSERT INTO `comunas` VALUES (208, 12, 'Loncoche', 1);
INSERT INTO `comunas` VALUES (209, 12, 'Melipeuco', 1);
INSERT INTO `comunas` VALUES (210, 12, 'Nueva Imperial', 1);
INSERT INTO `comunas` VALUES (211, 12, 'Padre Las Casas', 1);
INSERT INTO `comunas` VALUES (212, 12, 'Perquenco', 1);
INSERT INTO `comunas` VALUES (213, 12, 'Pitrufquén', 1);
INSERT INTO `comunas` VALUES (214, 12, 'Pucón', 1);
INSERT INTO `comunas` VALUES (215, 12, 'Saavedra', 1);
INSERT INTO `comunas` VALUES (216, 12, 'Teodoro Schmidt', 1);
INSERT INTO `comunas` VALUES (217, 12, 'Toltén', 1);
INSERT INTO `comunas` VALUES (218, 12, 'Vilcún', 1);
INSERT INTO `comunas` VALUES (219, 12, 'Villarrica', 1);
INSERT INTO `comunas` VALUES (220, 12, 'Cholchol', 1);
INSERT INTO `comunas` VALUES (221, 12, 'Angol', 1);
INSERT INTO `comunas` VALUES (222, 12, 'Collipulli', 1);
INSERT INTO `comunas` VALUES (223, 12, 'Curacautín', 1);
INSERT INTO `comunas` VALUES (224, 12, 'Ercilla', 1);
INSERT INTO `comunas` VALUES (225, 12, 'Lonquimay', 1);
INSERT INTO `comunas` VALUES (226, 12, 'Los Sauces', 1);
INSERT INTO `comunas` VALUES (227, 12, 'Lumaco', 1);
INSERT INTO `comunas` VALUES (228, 12, 'Purén', 1);
INSERT INTO `comunas` VALUES (229, 12, 'Renaico', 1);
INSERT INTO `comunas` VALUES (230, 12, 'Traiguén', 1);
INSERT INTO `comunas` VALUES (231, 12, 'Victoria', 1);
INSERT INTO `comunas` VALUES (232, 13, 'Valdivia', 1);
INSERT INTO `comunas` VALUES (233, 13, 'Corral', 1);
INSERT INTO `comunas` VALUES (234, 13, 'Lanco', 1);
INSERT INTO `comunas` VALUES (235, 13, 'Los Lagos', 1);
INSERT INTO `comunas` VALUES (236, 13, 'Máfil', 1);
INSERT INTO `comunas` VALUES (237, 13, 'Mariquina', 1);
INSERT INTO `comunas` VALUES (238, 13, 'Paillaco', 1);
INSERT INTO `comunas` VALUES (239, 13, 'Panguipulli', 1);
INSERT INTO `comunas` VALUES (240, 13, 'La Unión', 1);
INSERT INTO `comunas` VALUES (241, 13, 'Futrono', 1);
INSERT INTO `comunas` VALUES (242, 13, 'Lago Ranco', 1);
INSERT INTO `comunas` VALUES (243, 13, 'Río Bueno', 1);
INSERT INTO `comunas` VALUES (244, 14, 'Puerto Montt', 1);
INSERT INTO `comunas` VALUES (245, 14, 'Calbuco', 1);
INSERT INTO `comunas` VALUES (246, 14, 'Cochamó', 1);
INSERT INTO `comunas` VALUES (247, 14, 'Fresia', 1);
INSERT INTO `comunas` VALUES (248, 14, 'Frutillar', 1);
INSERT INTO `comunas` VALUES (249, 14, 'Los Muermos', 1);
INSERT INTO `comunas` VALUES (250, 14, 'Llanquihue', 1);
INSERT INTO `comunas` VALUES (251, 14, 'Maullín', 1);
INSERT INTO `comunas` VALUES (252, 14, 'Puerto Varas', 1);
INSERT INTO `comunas` VALUES (253, 14, 'Castro', 1);
INSERT INTO `comunas` VALUES (254, 14, 'Ancud', 1);
INSERT INTO `comunas` VALUES (255, 14, 'Chonchi', 1);
INSERT INTO `comunas` VALUES (256, 14, 'Curaco de Vélez', 1);
INSERT INTO `comunas` VALUES (257, 14, 'Dalcahue', 1);
INSERT INTO `comunas` VALUES (258, 14, 'Puqueldón', 1);
INSERT INTO `comunas` VALUES (259, 14, 'Queilén', 1);
INSERT INTO `comunas` VALUES (260, 14, 'Quellón', 1);
INSERT INTO `comunas` VALUES (261, 14, 'Quemchi', 1);
INSERT INTO `comunas` VALUES (262, 14, 'Quinchao', 1);
INSERT INTO `comunas` VALUES (263, 14, 'Osorno', 1);
INSERT INTO `comunas` VALUES (264, 14, 'Puerto Octay', 1);
INSERT INTO `comunas` VALUES (265, 14, 'Purranque', 1);
INSERT INTO `comunas` VALUES (266, 14, 'Puyehue', 1);
INSERT INTO `comunas` VALUES (267, 14, 'Río Negro', 1);
INSERT INTO `comunas` VALUES (268, 14, 'San Juan de la Costa', 1);
INSERT INTO `comunas` VALUES (269, 14, 'San Pablo', 1);
INSERT INTO `comunas` VALUES (270, 14, 'Chaitén', 1);
INSERT INTO `comunas` VALUES (271, 14, 'Futaleufú', 1);
INSERT INTO `comunas` VALUES (272, 14, 'Hualaihué', 1);
INSERT INTO `comunas` VALUES (273, 14, 'Palena', 1);
INSERT INTO `comunas` VALUES (274, 15, 'Coyhaique', 1);
INSERT INTO `comunas` VALUES (275, 15, 'Lago Verde', 1);
INSERT INTO `comunas` VALUES (276, 15, 'Aysén', 1);
INSERT INTO `comunas` VALUES (277, 15, 'Cisnes', 1);
INSERT INTO `comunas` VALUES (278, 15, 'Guaitecas', 1);
INSERT INTO `comunas` VALUES (279, 15, 'Cochrane', 1);
INSERT INTO `comunas` VALUES (280, 15, 'O\'Higgins', 1);
INSERT INTO `comunas` VALUES (281, 15, 'Tortel', 1);
INSERT INTO `comunas` VALUES (282, 15, 'Chile Chico', 1);
INSERT INTO `comunas` VALUES (283, 15, 'Río Ibáñez', 1);
INSERT INTO `comunas` VALUES (284, 16, 'Punta Arenas', 1);
INSERT INTO `comunas` VALUES (285, 16, 'Laguna Blanca', 1);
INSERT INTO `comunas` VALUES (286, 16, 'Río Verde', 1);
INSERT INTO `comunas` VALUES (287, 16, 'San Gregorio', 1);
INSERT INTO `comunas` VALUES (288, 16, 'Cabo de Hornos', 1);
INSERT INTO `comunas` VALUES (289, 16, 'Antártica', 1);
INSERT INTO `comunas` VALUES (290, 16, 'Porvenir', 1);
INSERT INTO `comunas` VALUES (291, 16, 'Primavera', 1);
INSERT INTO `comunas` VALUES (292, 16, 'Timaukel', 1);
INSERT INTO `comunas` VALUES (293, 16, 'Natales', 1);
INSERT INTO `comunas` VALUES (294, 16, 'Torres del Paine', 1);
INSERT INTO `comunas` VALUES (295, 7, 'Santiago', 1);
INSERT INTO `comunas` VALUES (296, 7, 'Cerrillos', 1);
INSERT INTO `comunas` VALUES (297, 7, 'Cerro Navia', 1);
INSERT INTO `comunas` VALUES (298, 7, 'Conchalí', 1);
INSERT INTO `comunas` VALUES (299, 7, 'El Bosque', 1);
INSERT INTO `comunas` VALUES (300, 7, 'Estación Central', 1);
INSERT INTO `comunas` VALUES (301, 7, 'Huechuraba', 1);
INSERT INTO `comunas` VALUES (302, 7, 'Independencia', 1);
INSERT INTO `comunas` VALUES (303, 7, 'La Cisterna', 1);
INSERT INTO `comunas` VALUES (304, 7, 'La Florida', 1);
INSERT INTO `comunas` VALUES (305, 7, 'La Granja', 1);
INSERT INTO `comunas` VALUES (306, 7, 'La Pintana', 1);
INSERT INTO `comunas` VALUES (307, 7, 'La Reina', 1);
INSERT INTO `comunas` VALUES (308, 7, 'Las Condes', 1);
INSERT INTO `comunas` VALUES (309, 7, 'Lo Barnechea', 1);
INSERT INTO `comunas` VALUES (310, 7, 'Lo Espejo', 1);
INSERT INTO `comunas` VALUES (311, 7, 'Lo Prado', 1);
INSERT INTO `comunas` VALUES (312, 7, 'Macul', 1);
INSERT INTO `comunas` VALUES (313, 7, 'Maipú', 1);
INSERT INTO `comunas` VALUES (314, 7, 'Ñuñoa', 1);
INSERT INTO `comunas` VALUES (315, 7, 'Pedro Aguirre Cerda', 1);
INSERT INTO `comunas` VALUES (316, 7, 'Peñalolén', 1);
INSERT INTO `comunas` VALUES (317, 7, 'Providencia', 1);
INSERT INTO `comunas` VALUES (318, 7, 'Pudahuel', 1);
INSERT INTO `comunas` VALUES (319, 7, 'Quilicura', 1);
INSERT INTO `comunas` VALUES (320, 7, 'Quinta Normal', 1);
INSERT INTO `comunas` VALUES (321, 7, 'Recoleta', 1);
INSERT INTO `comunas` VALUES (322, 7, 'Renca', 1);
INSERT INTO `comunas` VALUES (323, 7, 'San Joaquín', 1);
INSERT INTO `comunas` VALUES (324, 7, 'San Miguel', 1);
INSERT INTO `comunas` VALUES (325, 7, 'San Ramón', 1);
INSERT INTO `comunas` VALUES (326, 7, 'Vitacura', 1);
INSERT INTO `comunas` VALUES (327, 7, 'Puente Alto', 1);
INSERT INTO `comunas` VALUES (328, 7, 'Pirque', 1);
INSERT INTO `comunas` VALUES (329, 7, 'San José de Maipo', 1);
INSERT INTO `comunas` VALUES (330, 7, 'Colina', 1);
INSERT INTO `comunas` VALUES (331, 7, 'Lampa', 1);
INSERT INTO `comunas` VALUES (332, 7, 'Til Til', 1);
INSERT INTO `comunas` VALUES (333, 7, 'San Bernardo', 1);
INSERT INTO `comunas` VALUES (334, 7, 'Buin', 1);
INSERT INTO `comunas` VALUES (335, 7, 'Calera de Tango', 1);
INSERT INTO `comunas` VALUES (336, 7, 'Paine', 1);
INSERT INTO `comunas` VALUES (337, 7, 'Melipilla', 1);
INSERT INTO `comunas` VALUES (338, 7, 'Alhué', 1);
INSERT INTO `comunas` VALUES (339, 7, 'Curacaví', 1);
INSERT INTO `comunas` VALUES (340, 7, 'María Pinto', 1);
INSERT INTO `comunas` VALUES (341, 7, 'San Pedro', 1);
INSERT INTO `comunas` VALUES (342, 7, 'Talagante', 1);
INSERT INTO `comunas` VALUES (343, 7, 'El Monte', 1);
INSERT INTO `comunas` VALUES (344, 7, 'Isla de Maipo', 1);
INSERT INTO `comunas` VALUES (345, 7, 'Padre Hurtado', 1);
INSERT INTO `comunas` VALUES (346, 7, 'Peñaflor', 1);

-- ----------------------------
-- Table structure for regiones
-- ----------------------------
DROP TABLE IF EXISTS `regiones`;
CREATE TABLE `regiones`  (
  `idRegion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activo` int NULL DEFAULT NULL,
  PRIMARY KEY (`idRegion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of regiones
-- ----------------------------
INSERT INTO `regiones` VALUES (1, 'Región de Arica y Parinacota', 1);
INSERT INTO `regiones` VALUES (2, 'Región de Tarapacá', 1);
INSERT INTO `regiones` VALUES (3, 'Región de Antofagasta', 1);
INSERT INTO `regiones` VALUES (4, 'Región de Atacama', 1);
INSERT INTO `regiones` VALUES (5, 'Región de Coquimbo', 1);
INSERT INTO `regiones` VALUES (6, 'Región de Valparaíso', 1);
INSERT INTO `regiones` VALUES (7, 'Región Metropolitana de Santiago', 1);
INSERT INTO `regiones` VALUES (8, 'Región del Libertador General Bernardo O\'Higgins', 1);
INSERT INTO `regiones` VALUES (9, 'Región del Maule', 1);
INSERT INTO `regiones` VALUES (10, 'Región de Ñuble', 1);
INSERT INTO `regiones` VALUES (11, 'Región del Biobío', 1);
INSERT INTO `regiones` VALUES (12, 'Región de La Araucanía', 1);
INSERT INTO `regiones` VALUES (13, 'Región de Los Ríos', 1);
INSERT INTO `regiones` VALUES (14, 'Región de Los Lagos', 1);
INSERT INTO `regiones` VALUES (15, 'Región Aysén del General Carlos Ibáñez del Campo', 1);
INSERT INTO `regiones` VALUES (16, 'Región de Magallanes y de la Antártica Chilena', 1);

-- ----------------------------
-- Table structure for votantes
-- ----------------------------
DROP TABLE IF EXISTS `votantes`;
CREATE TABLE `votantes`  (
  `idVotante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rut` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comuna` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comoSeEntero` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idVotante`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votantes
-- ----------------------------
INSERT INTO `votantes` VALUES (1, 'Lorenzo Talavera', 'ltala', '13333748-2', 'ltala@correo.cl', '2', '8', 'Web, Redes Sociales');
INSERT INTO `votantes` VALUES (2, 'Maria Milagros Fajardo', 'mmfaa', '15594820-5', 'mmfa@correo.cl', '4', '22', 'Web, TV');
INSERT INTO `votantes` VALUES (3, 'Pere Hinojosa', 'phinojosa', '11458684-6', 'phinojosa@correo.cl', '12', '204', 'Redes Sociales, Amigo');
INSERT INTO `votantes` VALUES (4, 'Paulina Duran', 'pduran', '53906604-8', 'pduran@correo.cl', '16', '285', 'Web, TV');
INSERT INTO `votantes` VALUES (5, 'Eloi Valencia', 'evalencia', '75094542-2', 'evalencia@correo.cl', '6', '46', 'Web, TV');
INSERT INTO `votantes` VALUES (6, 'Modesta Wu', 'wu12333', '87546501-5', 'modesta@corre.cl', '6', '70', 'Web, TV');
INSERT INTO `votantes` VALUES (7, 'Maria Cruz Sanchez', 'mcruz123123', '88463032-0', 'mcruz@corre.cl', '7', '297', 'Web, TV');
INSERT INTO `votantes` VALUES (8, 'Alejandro Jose Fuente', 'ajosefuente', '70765472-4', 'ajosefuente@correo.cl', '9', '132', 'Web, Redes Sociales');
INSERT INTO `votantes` VALUES (9, 'Luis Manuel Boix', 'lmanuebo', '87300597-1', 'lmanuebo@correo.cl', '6', '47', 'Web, Redes Sociales');
INSERT INTO `votantes` VALUES (10, 'Oier Valera', 'overa', '91226532-3', 'overa@correo.cl', '6', '68', 'Web, TV');
INSERT INTO `votantes` VALUES (11, 'Andoni Franco', 'afran', '95609371-6', 'afran@correo.cl', '11', '167', 'TV, Amigo');
INSERT INTO `votantes` VALUES (12, 'Ursula Calero', 'ucalero', '97274624-K', 'ucalero@correo.cl', '6', '47', 'Web, Redes Sociales');
INSERT INTO `votantes` VALUES (13, 'Laura Murcia', 'lauraMurcia', '76733205-k', 'lauraMurcia@correo.cl', '3', '13', 'Web, Redes Sociales');
INSERT INTO `votantes` VALUES (14, 'Joel Quevedo', 'joelquevedo', '63208269-K', 'joelquevedo@correo.cl', '5', '30', 'TV, Amigo');
INSERT INTO `votantes` VALUES (15, 'Jose Pedro Caro', 'jpedrocaro', '18213404-k', 'jpedrocaro@correo.cl', '4', '24', 'Web, TV');
INSERT INTO `votantes` VALUES (16, 'Bartolome Soria', 'bsoria123213', '2637393-k', 'bsoria@correo.cl', '6', '48', 'Web, Amigo');

-- ----------------------------
-- Table structure for voto
-- ----------------------------
DROP TABLE IF EXISTS `voto`;
CREATE TABLE `voto`  (
  `idVoto` int NOT NULL AUTO_INCREMENT,
  `idVotante` int NULL DEFAULT NULL,
  `idCandidato` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idVoto`) USING BTREE,
  INDEX `fk_votante`(`idVotante` ASC) USING BTREE,
  CONSTRAINT `fk_votante` FOREIGN KEY (`idVotante`) REFERENCES `votantes` (`idVotante`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voto
-- ----------------------------
INSERT INTO `voto` VALUES (1, 1, '1');
INSERT INTO `voto` VALUES (2, 2, '1');
INSERT INTO `voto` VALUES (3, 3, '2');
INSERT INTO `voto` VALUES (4, 4, '2');
INSERT INTO `voto` VALUES (5, 5, '2');
INSERT INTO `voto` VALUES (6, 6, '2');
INSERT INTO `voto` VALUES (7, 7, '2');
INSERT INTO `voto` VALUES (8, 8, '1');
INSERT INTO `voto` VALUES (9, 9, '1');
INSERT INTO `voto` VALUES (10, 10, '1');
INSERT INTO `voto` VALUES (11, 11, '1');
INSERT INTO `voto` VALUES (12, 12, '2');
INSERT INTO `voto` VALUES (13, 13, '1');
INSERT INTO `voto` VALUES (14, 14, '2');
INSERT INTO `voto` VALUES (15, 15, '2');
INSERT INTO `voto` VALUES (16, 16, '2');

SET FOREIGN_KEY_CHECKS = 1;
