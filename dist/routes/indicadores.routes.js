"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const indicadores_controller_1 = require("../controller/indicadores.controller");
const indicadoresRoutes = (0, express_1.Router)();
indicadoresRoutes.route('/:indicadorId')
    .get(indicadores_controller_1.getIndicadoresById);
exports.default = indicadoresRoutes;
