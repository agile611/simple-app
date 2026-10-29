import express, { Request, Response } from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

// Endpoint obligatorio para el healthcheck del Dockerfile
app.get('/healthz', (req: Request, res: Response) => {
  res.status(200).json({ status: 'ok', timestamp: new Date().toISOString() });
});

app.get('/', (req: Request, res: Response) => {
  res.send('¡Hola desde la app corriendo en Docker con múltiples etapas!');
});

app.listen(PORT, () => {
  console.log(`Servidor escuchando en el puerto ${PORT}`);
});