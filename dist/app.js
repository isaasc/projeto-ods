"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.App = void 0;
const cors_1 = __importDefault(require("cors"));
const express_1 = __importDefault(require("express"));
const ip_1 = __importDefault(require("ip"));
const code_enum_1 = require("./domain/enum/code.enum");
const response_1 = require("./domain/response");
const status_enum_1 = require("./domain/enum/status.enum");
const objetivos_routes_1 = __importDefault(require("./routes/objetivos.routes"));
const indicadores_routes_1 = __importDefault(require("./routes/indicadores.routes"));
class App {
    constructor(port = process.env.SERVER_PORT || 3000) {
        this.port = port;
        this.APPLICATION_RUNNING = 'application is running on:';
        this.ROUTE_NOT_FOUND = 'Route does not exist on the server';
        this.app = (0, express_1.default)();
        this.middleWare();
        this.routes();
    }
    listen() {
        this.app.listen(this.port);
        console.info(`${this.APPLICATION_RUNNING} ${ip_1.default.address()}:${this.port}`);
    }
    middleWare() {
        this.app.use((0, cors_1.default)({ origin: '*' }));
        this.app.use(express_1.default.json());
    }
    routes() {
        this.app.use('/objetivos', objetivos_routes_1.default);
        this.app.use('/indicadores', indicadores_routes_1.default);
        this.app.get('/', (_, res) => res.status(code_enum_1.Code.OK).send(new response_1.HttpResponse(code_enum_1.Code.OK, status_enum_1.Status.OK, 'Server is up')));
        this.app.all('*', (_, res) => res.status(code_enum_1.Code.NOT_FOUND).send(new response_1.HttpResponse(code_enum_1.Code.NOT_FOUND, status_enum_1.Status.NOT_FOUND, this.ROUTE_NOT_FOUND)));
    }
}
exports.App = App;
