import { Router } from "express";
import { getIndicadoresById } from "../controller/indicadores.controller";

const indicadoresRoutes = Router();

indicadoresRoutes.route('/:indicadorId')
    .get(getIndicadoresById)

export default indicadoresRoutes;