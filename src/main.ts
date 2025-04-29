import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const port = process.env.PORT ?? 3000;

  // Log when the app starts up - helps with debugging
  await app.listen(port);
  console.log(`Application is running on: http://localhost:${port}`);
  console.log(`Health endpoint available at: http://localhost:${port}/health`);
}
bootstrap();
