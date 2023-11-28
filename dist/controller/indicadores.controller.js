"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getIndicadoresById = void 0;
const mysql_config_1 = require("../config/mysql.config");
const indicadores_query_1 = require("../query/indicadores.query");
const code_enum_1 = require("../domain/enum/code.enum");
const response_1 = require("../domain/response");
const status_enum_1 = require("../domain/enum/status.enum");
const getIndicadoresById = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    console.info(`[${new Date().toLocaleString()}] Incoming ${req.method}${req.originalUrl} Request from ${req.rawHeaders[0]} ${req.rawHeaders[1]}`);
    try {
        const pool = yield (0, mysql_config_1.connection)();
        const result = yield pool.query(indicadores_query_1.INDICADORES_QUERY.SELECT_INDICADORES_BY_ID, [req.params.indicadorId]);
        console.log(result);
        if (!result) {
            return res.status(code_enum_1.Code.NOT_FOUND).send(new response_1.HttpResponse(code_enum_1.Code.NOT_FOUND, status_enum_1.Status.NOT_FOUND, 'Indicador not found'));
        }
        return res.status(code_enum_1.Code.OK).send(new response_1.HttpResponse(code_enum_1.Code.OK, status_enum_1.Status.OK, 'Indicador ok', result));
    }
    catch (error) {
        console.error(error);
        return res.status(code_enum_1.Code.INTERNAL_SERVER_ERROR).send(new response_1.HttpResponse(code_enum_1.Code.INTERNAL_SERVER_ERROR, status_enum_1.Status.INTERNAL_SERVER_ERROR, 'An error occured'));
    }
});
exports.getIndicadoresById = getIndicadoresById;
