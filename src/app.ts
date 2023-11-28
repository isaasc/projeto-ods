import cors from "cors";
import express, { Application, Request, Response } from "express";
import ip from "ip";
import { Code } from "./domain/enum/code.enum";
import { HttpResponse } from "./domain/response";
import { Status } from "./domain/enum/status.enum";
import objetivosRoutes from "./routes/objetivos.routes";
import indicadoresRoutes from "./routes/indicadores.routes";

export class App {
    private readonly app: Application;
    private readonly APPLICATION_RUNNING = 'application is running on:';
    private readonly ROUTE_NOT_FOUND = 'Route does not exist on the server';

    constructor(private readonly port: (string | number) = process.env.SERVER_PORT || 3000) {
        this.app = express();
        this.middleWare();
        this.routes();
    }

    listen(): void {
        this.app.listen(this.port);
        console.info(`${this.APPLICATION_RUNNING} ${ip.address()}:${this.port}`);
    }

    private middleWare(): void {
        this.app.use(cors({origin: '*'}));
        this.app.use(express.json());
    }

    private routes(): void {
        this.app.use('/objetivos', objetivosRoutes);
        this.app.use('/indicadores', indicadoresRoutes);

        this.app.get('/', (_: Request, res: Response) => res.status(Code.OK).send(new HttpResponse(Code.OK, Status.OK, 'Server is up')));
        this.app.all('*', (_: Request, res: Response) => res.status(Code.NOT_FOUND).send(new HttpResponse(Code.NOT_FOUND, Status.NOT_FOUND, this.ROUTE_NOT_FOUND)));
    }
}