import { Request, Response } from "express"
import { connection } from "../config/mysql.config";
import { INDICADORES_QUERY } from "../query/indicadores.query";
import { Code } from "../domain/enum/code.enum";
import { HttpResponse } from "../domain/response";
import { Status } from "../domain/enum/status.enum";
import { Query } from "mysql2";
import { OBJETIVOS_QUERY } from "../query/objetivos.query";

export const getObjetivosByOdsId = async (req: Request, res: Response): Promise<Response<HttpResponse>> => {
    console.info(`[${ new Date().toLocaleString()}] Incoming ${req.method}${req.originalUrl} Request from ${req.rawHeaders[0]} ${req.rawHeaders[1]}`);

    try {
        const pool = await connection();
        const result: Query = await pool.query(OBJETIVOS_QUERY.SELECT_OBJETIVOS_BY_ODS_ID, [req.params.objetivoOdsId]);
        console.log(result)

        if(!result) {
            return res.status(Code.NOT_FOUND).send(new HttpResponse(Code.NOT_FOUND, Status.NOT_FOUND, 'Objetivo not found'))
        }

        return res.status(Code.OK).send(new HttpResponse(Code.OK, Status.OK, 'Objetivo ok', result))
    } catch (error) {
        console.error(error);
        return res.status(Code.INTERNAL_SERVER_ERROR).send(new HttpResponse(Code.INTERNAL_SERVER_ERROR, Status.INTERNAL_SERVER_ERROR, 'An error occured'))
    }
}