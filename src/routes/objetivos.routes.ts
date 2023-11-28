import { Router } from "express";
import { getObjetivosByOdsId } from "../controller/objetivos.controller";

const objetivosRoutes = Router();

objetivosRoutes.route('/:objetivoOdsId')
    .get(getObjetivosByOdsId)

export default objetivosRoutes;