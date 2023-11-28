"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const objetivos_controller_1 = require("../controller/objetivos.controller");
const objetivosRoutes = (0, express_1.Router)();
objetivosRoutes.route('/:objetivoOdsId')
    .get(objetivos_controller_1.getObjetivosByOdsId);
exports.default = objetivosRoutes;
